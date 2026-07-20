# Codex Kimetsu Skin for macOS

macOS runner for the **Zenitsu Agatsuma / Thunder Breathing** Codex Desktop skin.

This fork keeps the Kimetsu Skin runtime model from the upstream project, but the bundled theme surface is now single-purpose: `preset-thunder-breathing`. The official Codex app is launched with a loopback CDP port, then CSS and a small decorative DOM layer are injected into the renderer. The official `.app`, `app.asar`, code signature, API keys, and base URLs are not modified.

## Requirements

- macOS
- Official Codex Desktop installed and launched at least once
- Existing `~/.codex/config.toml`
- No global Node.js requirement; the scripts validate and use Codex's signed bundled Node runtime

## Install And Start

```bash
cd macos
./scripts/install-kimetsu-skin-macos.sh --no-launch
~/.codex/codex-kimetsu-skin/scripts/start-kimetsu-skin-macos.sh
```

If no active theme exists yet, the installer seeds and selects:

```text
presets/preset-thunder-breathing/
```

Manual theme switch:

```bash
~/.codex/codex-kimetsu-skin/scripts/switch-theme-macos.sh \
  --id preset-thunder-breathing
```

## Desktop Launchers

The installer creates these Desktop entries:

| Launcher | Purpose |
|----------|---------|
| `Codex Kimetsu Skin.command` | Start or reapply the Thunder Breathing skin |
| `Codex Kimetsu Skin - Customize.command` | Import a local image as a custom theme |
| `Codex Kimetsu Skin - Verify.command` | Verify injection and save a screenshot |
| `Codex Kimetsu Skin - Restore.command` | Stop injection and restore the official appearance |

## Theme Files

| File | Purpose |
|------|---------|
| `assets/kimetsu-reference.jpg` | Default Thunder Breathing image used by the built-in payload |
| `assets/theme.json` | Default Thunder Breathing runtime metadata |
| `presets/preset-thunder-breathing/background.jpg` | Saved preset background |
| `presets/preset-thunder-breathing/theme.json` | Saved preset metadata |

Design notes and supported DOM coverage live in [`../docs/designs/thunder-breathing-macos-design.md`](../docs/designs/thunder-breathing-macos-design.md).

## Verify

```bash
cd macos
npm test
./scripts/doctor-macos.sh
```

For visual changes, also inspect the live home route, a task route, the profile menu, and settings. Preview images under `../docs/images/` are documentation screenshots only; do not import them as theme backgrounds.

## Restore

```bash
~/.codex/codex-kimetsu-skin/scripts/restore-kimetsu-skin-macos.sh \
  --restore-base-theme --restart-codex
```

Restore removes the injected skin, closes the recorded injector only when its process identity matches the saved state, and returns Codex to normal launch behavior.

## Security Notes

- CDP is bound to `127.0.0.1`.
- While the skin is running, treat the local debugging port as sensitive.
- Config writes are strict UTF-8 with backup, lock, and atomic replacement.
- The bundled Zenitsu artwork is outside the MIT software license; see [`NOTICE.md`](./NOTICE.md).
