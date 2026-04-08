# Context: You

## Who You Are

Customize this file with your own context — role, expertise, current projects, preferences.

## Key Preferences

- Concise responses for simple tasks
- Verification over claims of completion
- Direct language, no hedging
- CLI-first approach
- Simple solutions over clever ones
- Evidence over claims

## Voice Server (Optional)

If you set up a TTS voice server, set these environment variables before launching opai:

```bash
export PAI_VOICE_ENABLED=true
export PAI_VOICE_ENDPOINT=http://localhost:8888/notify
export PAI_VOICE_ID=your-voice-id
```

Then use this pattern in your workflow:
```bash
curl -s -X POST $PAI_VOICE_ENDPOINT \
  -H "Content-Type: application/json" \
  -d '{"message": "MESSAGE_HERE", "voice_id": "'$PAI_VOICE_ID'", "voice_enabled": true}'
```

Works with ElevenLabs, Coqui, or any TTS server accepting HTTP POST with JSON body.

## Memory Location

Persistent memory files at `~/.config/opai/memory/`:
- `learning/` — Signals and patterns from interactions
- `state/` — Current work tracking
- `work/` — PRD files for Algorithm sessions
