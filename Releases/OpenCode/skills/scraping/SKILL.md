---
name: scraping
description: Web scraping and data extraction — fetch pages, extract structured data, handle dynamic content, monitor pages, and process web content. USE WHEN scrape, crawl, extract data, fetch page, web data, parse HTML, download, bulk fetch, monitor page, API scraping, pagination, rate limit, bypass.
metadata:
  author: pai
  version: 2.0.0
---

# Scraping Skill

Extract structured data from web sources.

---

## Workflow Routing

| Trigger | Workflow |
|---------|----------|
| "scrape", "extract data from" | Full Scrape |
| "fetch", "get content from URL" | Simple Fetch |
| "pagination", "scrape all pages" | Paginated Scrape |
| "monitor", "watch for changes", "alert when" | Page Monitor |
| "API", "JSON endpoint", "scrape API" | API Data Extraction |
| "JavaScript", "dynamic content", "SPA" | Headless Browser |

---

## PROGRESSIVE ESCALATION PRINCIPLE

Always start with the simplest method and escalate only when needed:

1. **Direct fetch** — `curl`/`wget` for simple static pages
2. **HTML parsing** — `requests` + `BeautifulSoup`/`lxml` for structured extraction
3. **Headless browser** — Playwright/Puppeteer for JavaScript-rendered content
4. **Proxy/bypass** — Rotating proxies or specialized services for anti-bot protection

---

## SIMPLE FETCH
*Get plain text or HTML content from a static URL.*

**Invoke:** `scraping fetch: [URL]`

```bash
# Basic fetch
curl -s -L -A "Mozilla/5.0 (compatible; research-bot/1.0)" "[URL]"

# Save to file
curl -s -L -A "Mozilla/5.0" "[URL]" -o output.html

# Follow redirects, show final URL
curl -s -L -w "\nFinal URL: %{url_effective}\n" "[URL]"

# With headers inspection
curl -I "[URL]"
```

**Via @researcher:** "Fetch and return the full text content of [URL]. Extract just the main body text, removing navigation, ads, and boilerplate."

---

## FULL SCRAPE
*Extract structured data from one or more pages.*

**Invoke:** `scraping extract: [URL] — extract [data description]`

**Procedure:**
1. @coder: "Write a Python scraper for [URL] that extracts [data description]. Use requests + BeautifulSoup. Output as JSON. Include: headers with realistic User-Agent, 1-2s delay between requests if paginated, error handling for non-200 status codes."

**Template:**
```python
import requests
import time
from bs4 import BeautifulSoup
import json

HEADERS = {
    "User-Agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36"
}

def scrape(url: str) -> dict:
    resp = requests.get(url, headers=HEADERS, timeout=10)
    resp.raise_for_status()
    soup = BeautifulSoup(resp.content, "html.parser")
    
    # Extract data — customize selector
    items = []
    for el in soup.select(".item-class"):
        items.append({
            "title": el.select_one("h2").get_text(strip=True),
            "link": el.select_one("a")["href"],
        })
    return {"url": url, "count": len(items), "items": items}

data = scrape("URL_HERE")
print(json.dumps(data, indent=2))
```

---

## PAGINATED SCRAPE
*Scrape data across multiple pages.*

**Invoke:** `scraping paginated: [URL pattern] — extract [data]`

**Procedure:**
1. @coder: "Inspect [URL] and identify the pagination pattern (query param, path segment, next-page link). Write a paginated scraper that: detects the last page, respects rate limits (1-2s delay), and outputs all items as a single JSON array."

**Common patterns:**
```python
# Query param pagination: ?page=1, ?page=2, ...
def scrape_all_pages(base_url, max_pages=50):
    all_items = []
    for page in range(1, max_pages + 1):
        url = f"{base_url}?page={page}"
        items = scrape_page(url)
        if not items:
            break  # No more results
        all_items.extend(items)
        time.sleep(1.5)
    return all_items

# Link-based pagination: follow "next" links
def scrape_with_next(start_url):
    all_items = []
    url = start_url
    while url:
        soup, items = scrape_page(url)
        all_items.extend(items)
        next_link = soup.select_one("a[rel='next']")
        url = next_link["href"] if next_link else None
        time.sleep(1.5)
    return all_items
```

---

## PAGE MONITOR
*Watch a page for changes and report what changed.*

**Invoke:** `scraping monitor: [URL] — watch for [change description]`

**Simple hash-based monitor:**
```bash
#!/usr/bin/env bash
URL="$1"
HASH_FILE="/tmp/page_hash_$(echo $URL | md5sum | cut -c1-8)"

CURRENT=$(curl -s "$URL" | sha256sum | cut -d' ' -f1)

if [ -f "$HASH_FILE" ]; then
    PREVIOUS=$(cat "$HASH_FILE")
    if [ "$CURRENT" != "$PREVIOUS" ]; then
        echo "CHANGED: $URL"
        echo "Previous hash: $PREVIOUS"
        echo "New hash: $CURRENT"
    else
        echo "NO CHANGE: $URL"
    fi
else
    echo "FIRST RUN — baseline saved"
fi

echo "$CURRENT" > "$HASH_FILE"
```

**Content-diff monitor:**
```python
import requests, hashlib, json, pathlib

def check_for_changes(url: str, selector: str = None):
    resp = requests.get(url, headers={"User-Agent": "Mozilla/5.0"})
    from bs4 import BeautifulSoup
    soup = BeautifulSoup(resp.content, "html.parser")
    content = soup.select_one(selector).get_text() if selector else resp.text
    
    state_file = pathlib.Path(f"/tmp/monitor_{hashlib.md5(url.encode()).hexdigest()}.json")
    current_hash = hashlib.sha256(content.encode()).hexdigest()
    
    if state_file.exists():
        prev = json.loads(state_file.read_text())
        if prev["hash"] != current_hash:
            print(f"CHANGED: {url}")
            return True
    
    state_file.write_text(json.dumps({"hash": current_hash, "url": url}))
    return False
```

---

## API DATA EXTRACTION
*Extract data from JSON APIs (documented or reverse-engineered).*

**Invoke:** `scraping api: [API URL or page with API calls]`

**Procedure:**
1. @researcher: "Inspect the network requests made by [URL]. What API endpoints does it call? What request format (headers, auth tokens, query params)? Return the raw API request details."
2. @coder: "Write a Python script to call [API endpoint] with [auth/params] and extract [data]. Handle: pagination, rate limiting, auth token refresh if needed."

**Template:**
```python
import requests
import json

# Auth: bearer token (from browser DevTools > Network > Request Headers)
HEADERS = {
    "Authorization": "Bearer YOUR_TOKEN",
    "User-Agent": "Mozilla/5.0",
    "Accept": "application/json",
}

def fetch_api(endpoint: str, params: dict = None) -> dict:
    resp = requests.get(endpoint, headers=HEADERS, params=params, timeout=10)
    resp.raise_for_status()
    return resp.json()

# Paginated API
def fetch_all(base_url: str):
    results = []
    cursor = None
    while True:
        params = {"limit": 100}
        if cursor:
            params["cursor"] = cursor
        data = fetch_api(base_url, params)
        results.extend(data.get("items", []))
        cursor = data.get("next_cursor")
        if not cursor:
            break
    return results
```

---

## HEADLESS BROWSER
*For JavaScript-rendered content that curl/requests can't get.*

**Invoke:** `scraping headless: [URL] — extract [data]`

**Procedure:**
1. @coder: "Write a Playwright Python script to scrape [URL]. The page uses JavaScript rendering, so we need a real browser. Extract [data]. Wait for: [element/condition] before extracting."

**Template:**
```python
from playwright.sync_api import sync_playwright
import json

def scrape_js_page(url: str, wait_for: str = "networkidle"):
    with sync_playwright() as p:
        browser = p.chromium.launch(headless=True)
        page = browser.new_page()
        
        # Block images/fonts to speed up
        page.route("**/*.{png,jpg,gif,svg,woff,woff2}", lambda r: r.abort())
        
        page.goto(url, wait_until=wait_for, timeout=30000)
        
        # Extract after JS renders
        items = page.eval_on_selector_all(
            ".item-selector",
            "els => els.map(el => ({ text: el.textContent, href: el.href }))"
        )
        
        browser.close()
        return items

data = scrape_js_page("URL_HERE")
print(json.dumps(data, indent=2))
```

---

## Ethics and Rate Limits

- Respect `robots.txt` — check `[domain]/robots.txt` first
- Add 1-5s delays between requests for the same domain
- Do not overwhelm servers — use exponential backoff on errors
- Check Terms of Service before large-scale or commercial scraping
- Store scraped data responsibly — do not republish without permission
