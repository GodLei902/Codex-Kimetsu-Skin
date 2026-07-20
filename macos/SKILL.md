---
name: codex-kimetsu-skin
description: Install, customize, launch, verify, repair, update, or restore the Thunder Breathing Codex skin on macOS. Use when a user wants this fork's Zenitsu theme applied through safe CDP injection while preserving the native interface, or needs troubleshooting and rollback.
compatibility: macOS, official Codex Desktop app, signed bundled Node.js 20 or newer
---

# Codex Kimetsu Skin

This file is an optional Codex capability entry. The delivery is a complete standalone project; users do not need to install it as a Skill.

## Workflow

1. Run `Install Codex Kimetsu Skin.command` from the complete project folder. A fresh install seeds and selects `preset-thunder-breathing`.
2. Optionally run `Customize Codex Kimetsu Skin.command` to test a local UI-free background without removing the bundled Thunder Breathing preset.
3. Verify the live result with `Verify Codex Kimetsu Skin.command`. A pass requires a visible native sidebar and composer, no horizontal overflow, non-interactive decoration, and—on the home route—a continuous wallpaper with live native heading, project controls, and any suggestion cards exposed by the current Codex version.
4. Restore the official appearance with `Restore Codex Kimetsu Skin.command`.

## Guardrails

- Never modify the official `.app`, `app.asar`, or its code signature.
- Use the official Codex app's signed Node.js runtime only after validating its signature, Team ID, architecture, and minimum version.
- Bind CDP to loopback, verify that the listener belongs to Codex, and reject non-Codex renderer targets.
- Preserve all native cards, navigation, project selectors, task content, composer controls, and keyboard focus.
- Theme images must be UI-free wallpapers. The bundled Thunder Breathing theme uses a 16:9 background, left safe area, and dark appearance; custom images should keep the same readability constraints.
- Keep decoration at `pointer-events: none`.
- Require explicit authorization before restarting an already-running Codex instance.
- Stop an injector only when its recorded PID, executable, command line, and start time all match.

## Key resources

- `README.md`: user installation and customization guide.
- `scripts/injector.mjs`: CDP connection, injection, removal, verification, and screenshots.
- `assets/kimetsu-skin.css`: live native interface styling.
- `assets/renderer-inject.js`: idempotent DOM integration and cleanup.
- `scripts/doctor-macos.sh`: signed-runtime, payload, and optional live-session self-check.
- `references/qa-inventory.md`: release and visual acceptance criteria.
