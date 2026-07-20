# Codex Kimetsu Skin

<p align="center">
  <a href="./README.md">中文</a> · <strong>English</strong>
</p>

<p align="center">
  <strong>Zenitsu Agatsuma “Thunder Breathing” skin for Codex Desktop</strong><br>
  Local CDP injection · no official app patching · native Codex controls remain interactive
</p>

> Bring Zenitsu Agatsuma's Thunder Breathing energy, lightning accents, and focused dark-workbench atmosphere into Codex Desktop. The skin is applied through local CDP injection without patching the official app or replacing native Codex interactions.

## Preview

<p align="center">
  <img src="docs/images/codex-live-home-current-theme.png" alt="Zenitsu Thunder Breathing Codex home screen" width="900"><br>
  <sub>Home · real macOS injection screenshot · refreshed 2026-07-20</sub>
</p>

<p align="center">
  <img src="docs/images/codex-live-task-current-theme.png" alt="Zenitsu Thunder Breathing Codex task screen" width="900"><br>
  <sub>Task route · native messages, resource cards, and side panel remain interactive</sub>
</p>

<p align="center">
  <img src="docs/images/codex-live-settings-current-theme.png" alt="Zenitsu Thunder Breathing Codex settings screen" width="900"><br>
  <sub>Settings · native navigation, switches, and dropdown controls remain usable</sub>
</p>

The skin uses a blue-black shell, electric ivory highlights, haori-orange action states, and sharper 6-8px UI surfaces. Codex still renders the real sidebar, task view, project picker, settings route, profile menu, and composer; the skin only changes appearance through CSS and a small decorative DOM layer.

## Quick Start

### macOS

```bash
cd macos
./scripts/install-kimetsu-skin-macos.sh --no-launch
~/.codex/codex-kimetsu-skin/scripts/switch-theme-macos.sh \
  --id preset-thunder-breathing
~/.codex/codex-kimetsu-skin/scripts/start-kimetsu-skin-macos.sh
```

You can also double-click `macos/Install Codex Kimetsu Skin.command`. The installer creates Desktop launchers for start, verify, customize, and restore.

### Windows

```powershell
cd windows
powershell -ExecutionPolicy Bypass -File .\scripts\install-kimetsu-skin.ps1
powershell -ExecutionPolicy Bypass -File .\scripts\start-kimetsu-skin.ps1
```

The Windows installer seeds the same Thunder Breathing theme as the initial active theme and saved preset.

## Layout

| Path | Contents |
|------|----------|
| `macos/` | macOS install/start/inject/verify/restore scripts and the Thunder Breathing assets |
| `macos/presets/preset-thunder-breathing/` | The only bundled preset |
| `windows/` | Windows PowerShell launch/install/restore scripts, CDP injector, and matching default theme |
| `docs/designs/` | Thunder Breathing design notes and static previews |
| `docs/images/` | Current live screenshots and design previews |

## Safety

- CDP binds to loopback only.
- The official `.app`, WindowsApps package, `app.asar`, signatures, API keys, and base URLs are not modified.
- Restore stops the injected skin and returns Codex to the official appearance.
- Do not run untrusted local software while a themed CDP session is active.

## Tests

```bash
cd macos && npm test
powershell -File windows/tests/run-tests.ps1
```

Before shipping, also inspect the home route, task route, profile menu, and settings route.

## License And Notices

Software license: [`macos/LICENSE`](./macos/LICENSE). Asset and trademark notes: [`macos/NOTICE.md`](./macos/NOTICE.md).

## Credits

This project references and uses the local CDP theming approach and cross-platform script structure from [Fei-Away/Codex-Dream-Skin](https://github.com/Fei-Away/Codex-Dream-Skin), then adapts that foundation into the Zenitsu Agatsuma “Thunder Breathing” theme.

This is not an official OpenAI product. Codex, Demon Slayer, Zenitsu Agatsuma, and related names, characters, trademarks, and artwork belong to their respective owners. The character skin assets are included as a personal theme example only; redistribution or commercial use requires independent rights review.
