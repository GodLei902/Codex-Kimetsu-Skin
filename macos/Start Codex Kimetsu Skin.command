#!/bin/bash
set -euo pipefail
INSTALLED="$HOME/.codex/codex-kimetsu-skin/scripts/start-kimetsu-skin-macos.sh"
if [ ! -x "$INSTALLED" ]; then
  /usr/bin/osascript -e 'display alert "请先双击 Install Codex Kimetsu Skin.command 完成安装。" as warning' >/dev/null
  exit 1
fi
exec "$INSTALLED" --prompt-restart
