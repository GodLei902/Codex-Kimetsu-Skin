#!/bin/bash

set -euo pipefail

[ "$#" -ge 1 ] && [ "$#" -le 2 ] || {
  printf 'Usage: %s <archive-root> [source-docs]\n' "$0" >&2
  exit 1
}

ARCHIVE_ROOT="$(cd "$1" && pwd -P)"
DOCS_SOURCE=""
if [ "$#" -eq 2 ]; then
  DOCS_SOURCE="$(cd "$2" && pwd -P)"
else
  SCRIPT_ROOT="$(cd "$(dirname "$0")/.." && pwd -P)"
  for candidate in "$SCRIPT_ROOT/docs" "$SCRIPT_ROOT/../docs"; do
    if [ -f "$candidate/designs/thunder-breathing-macos-design.md" ]; then
      DOCS_SOURCE="$(cd "$candidate" && pwd -P)"
      break
    fi
  done
fi
[ -n "$DOCS_SOURCE" ] || {
  printf 'Could not locate the Thunder Breathing documentation beside the macOS tree.\n' >&2
  exit 1
}
DOCS_TARGET="$ARCHIVE_ROOT/docs"

[ -d "$DOCS_SOURCE/designs" ] || {
  printf 'Required Thunder design docs are missing: %s\n' "$DOCS_SOURCE/designs" >&2
  exit 1
}
[ -f "$DOCS_SOURCE/images/thunder-breathing-live-home-fixed.png" ] || {
  printf 'Required Thunder preview image is missing: %s\n' \
    "$DOCS_SOURCE/images/thunder-breathing-live-home-fixed.png" >&2
  exit 1
}
[ -f "$ARCHIVE_ROOT/NOTICE.md" ] || {
  printf 'Standalone NOTICE is missing: %s\n' "$ARCHIVE_ROOT/NOTICE.md" >&2
  exit 1
}

/bin/mkdir -p "$DOCS_TARGET/images"
/bin/cp -R "$DOCS_SOURCE/designs" "$DOCS_TARGET/"
while IFS= read -r image; do
  [ -n "$image" ] || continue
  /bin/cp "$image" "$DOCS_TARGET/images/"
done < <(
  /usr/bin/find "$DOCS_SOURCE/images" -maxdepth 1 -type f \( \
    -name 'thunder-breathing-*.png' -o \
    -name 'codex-live-*-current-theme.png' \
  \) -print
)

# NOTICE.md is authored from macos/, so translate repository-relative docs
# paths for standalone archives where macos/ becomes the archive root.
NOTICE="$ARCHIVE_ROOT/NOTICE.md"
temporary="${NOTICE}.standalone"
/usr/bin/sed \
  -e 's#`\.\./docs/#`docs/#g' \
  "$NOTICE" > "$temporary"
/bin/mv "$temporary" "$NOTICE"

if /usr/bin/grep -E -q '`\.\./(docs|windows)/' "$NOTICE"; then
  printf 'Standalone NOTICE retains a parent-repository path: %s\n' "$NOTICE" >&2
  exit 1
fi
