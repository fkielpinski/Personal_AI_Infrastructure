---
name: scraping
description: Web scraping and data extraction — fetch pages, extract structured data, handle dynamic content, and process web content at scale. USE WHEN scrape, crawl, extract data, fetch page, web data, parse HTML, download, bulk fetch, monitor page.
metadata:
  author: pai
  version: 1.0.0
---

# Scraping Skill

Extract structured data from web sources.

## Approach: Progressive Escalation

Start with the simplest method and escalate only if needed:

1. **Direct fetch** — `curl` or `wget` for simple static pages
2. **Structured fetch** — use `jq` or Python `requests` + `BeautifulSoup` for HTML parsing
3. **Headless browser** — Playwright or Puppeteer for JavaScript-rendered content
4. **Proxy / bypass** — rotating proxies or Bright Data for anti-bot protected sites

## Workflow

1. **Identify the target** — URL, data format, frequency
2. **Inspect the structure** — view source, check network requests
3. **Choose extraction method** — simplest that works
4. **Handle pagination** — detect next-page patterns
5. **Output as structured data** — JSON, CSV, or markdown table
6. **Respect rate limits** — add delays between requests

## Common Patterns

### Extract table data
```python
import requests
from bs4 import BeautifulSoup
import pandas as pd

r = requests.get(url, headers={"User-Agent": "Mozilla/5.0"})
soup = BeautifulSoup(r.content, "html.parser")
tables = pd.read_html(str(soup.find("table")))
```

### Monitor a page for changes
```bash
# Save current state and compare on next run
curl -s $URL | sha256sum > /tmp/page_hash
```

## Ethics

- Respect `robots.txt`
- Add reasonable delays (1-5s between requests)
- Do not overwhelm servers
- Check ToS before large-scale scraping
