# Submitting Fullbright to the Horizon mod registry

What to paste into the form at https://playhorizon.dev/mods/submit (sign in with GitHub).
The form uploads the file and opens the pull request on horizon-rust/horizon-mods.

- **File:** `dist/fullbright-1.0.0.hnmod` (SHA-256 `573c5e04188e0b1a26eb42a8aeaeeefeb6fb334a096afaa834e71b8efa353ad7`)
- **Id:** `fullbright`
- **Kind:** native mod
- **Name:** Fullbright
- **Summary:** Brightness past 100%: `/gamma <value>` sets your own gamma, `/fullbright` toggles full brightness.
- **License:** MIT
- **Source:** https://github.com/<your GitHub name>/horizon-fullbright
- **Icon:** `icon.png`
- **Game:** 26.3
- **Changelog:** First release.

**Description:**

```
**A native Horizon mod**: the launcher builds it into the game (Settings → Game → Native mods, then Build). Native mods are not sandboxed and run with your account's rights, so read the source before you build it. Uses only the native hook points (hooks 1); tested on Horizon 41672b1 and horizon-mixins 0d6b103.

Set the brightness past the video settings' 100% with a command, and toggle full brightness.

- `/gamma <value>`: your own gamma (1 is "Bright", 15 is fullbright, up to 100; `/gamma 1500%` works too).
- `/gamma` shows it, `/gamma reset` goes back to the slider, `/gamma on` turns your last value on again.
- `/fullbright` toggles gamma 15.
- Options → Mods → Fullbright: on/off, gamma presets, and a toggle key.

Client-side: works in single player and on servers. The slider and options.txt are never changed.
```
