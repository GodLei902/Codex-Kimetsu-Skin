#!/bin/bash
set -euo pipefail
INSTALLED="$HOME/.codex/codex-kimetsu-skin/scripts/verify-kimetsu-skin-macos.sh"
OUTPUT="$HOME/Desktop/Codex Kimetsu Skin Verification.png"
if [ ! -x "$INSTALLED" ]; then
  /usr/bin/osascript -e 'display alert "请先双击 Install Codex Kimetsu Skin.command 完成安装。" as warning' >/dev/null
  exit 1
fi
"$INSTALLED" --screenshot "$OUTPUT"
/usr/bin/open "$OUTPUT"
