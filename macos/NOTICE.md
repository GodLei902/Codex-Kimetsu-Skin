# Notices

Codex Kimetsu Skin is an **unofficial** customization project and is **not affiliated with, endorsed by, or sponsored by OpenAI**.

## Software license

The MIT License in `LICENSE` applies to the **software source code** in this repository (scripts, CSS, injectors, and docs that describe the software).

It does **not** grant rights to:

- OpenAI or Codex trademarks, product names, logos, or trade dress
- Official Codex / ChatGPT application binaries, `.app` bundles, or `app.asar`
- Any user-supplied images or third-party artwork you drop into a theme
- Character likenesses, franchise art, or celebrity imagery

## Thunder Breathing / Zenitsu reference material

The following fork-specific files are excluded from the MIT software license:

- `assets/kimetsu-reference.jpg`
- `presets/preset-thunder-breathing/background.jpg`
- `../windows/assets/kimetsu-reference.jpg`
- `../docs/images/thunder-breathing-*.png`
- `../docs/images/codex-live-*-current-theme.png`

They are included as the local Zenitsu / Thunder Breathing skin preset, default runtime background, and design/runtime previews for this fork. They are not official OpenAI/Codex artwork. Their inclusion does not certify or grant Demon Slayer / Zenitsu character, franchise-art, model-output, trademark, commercial-use, or redistribution rights. Downstream redistribution requires an independent rights review; documentation screenshots and previews must never be imported as wallpapers.

## Runtime

This project does not redistribute Node.js. At runtime it validates and uses the Node.js executable already signed and bundled inside the user's official Codex desktop application.

## Security model

Themes are applied through Chromium DevTools Protocol on **loopback only**. While a themed session is running, treat the local debugging port as sensitive: do not run untrusted local software that could attach to it. Use the Restore launcher to tear down the themed session and debugging port.
