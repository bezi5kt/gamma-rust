# Fullbright

A native [Horizon](https://github.com/horizon-rust/horizon) mod: set the brightness past the video settings' 100%
with a command, and toggle full brightness.

| Command | What it does |
| --- | --- |
| `/gamma <value>` | Sets your own gamma: `1` is vanilla's "Bright", `15` is fullbright, up to `100`. `/gamma 1500%` works too. |
| `/gamma` | Shows the gamma in effect. |
| `/gamma reset` (or `off`) | Back to the video settings slider. |
| `/gamma on` | Your last custom gamma again. |
| `/fullbright` | Toggles gamma 15 on and off. |

Options > Mods > Fullbright has an on/off button, a button cycling 100/200/500/1000/1500%, and a toggle key
(unbound until you pick one). The commands are the client's own, so they work in single player and on servers.

## How it works

Horizon copies the brightness slider into the renderer's lightmap gamma when settings change. Each frame
(`native_frame`), while a custom gamma is on, the mod puts its own value there instead; the lightmap's
`mix(color, notGamma, gamma)` then brightens past 100% as vanilla's does with a high gamma. The slider and
`options.txt` are never changed, so `/gamma reset` (or turning the mod off) gives your own brightness back.

Settings are kept in `horizon-mods/.horizon-mod-data/fullbright/` (`enabled`, `gamma`).

It uses only Horizon's native hook points (`"hooks": 1`): `native_frame`, `native_command`, `native_key`,
`native_mods`, `native_settings`, `native_settings_click`. Tested on Horizon `41672b1` with horizon-mixins `0d6b103`.

## Install

In the Horizon launcher: Mods, Horizon, Fullbright, Install, then Settings > Game > Native mods > Build. Native mods
are compiled into the game and are not sandboxed: read the source before you build it.

## Develop

```sh
cargo test        # the commands and settings (mixins/fullbright/runtime.rs)
./pack.ps1        # dist/fullbright-<version>.hnmod
```

To try a change in the game: `horizon-launcher native-build . --trust-native-code`.

## License

MIT
