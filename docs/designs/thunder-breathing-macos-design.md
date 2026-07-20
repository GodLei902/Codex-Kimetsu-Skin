# Thunder Breathing macOS Skin Concept

Mac-only supported design based on the packaged Zenitsu / Thunder Breathing preset background at `macos/presets/preset-thunder-breathing/background.jpg` and the live Codex reference captures preserved under `docs/images/`.

## Direction

- Keep the artwork as a full-window 16:9 background, focused around `72% 44%`.
- Reserve the left and center-left as the native Codex reading area with a directional dark veil.
- Preserve the right-side character, sword, and electric motion as the main visual signal.
- Move only supported native Codex surfaces away from soft glass toward sharper 6-8px surfaces, electric ivory borders, and haori-orange action states.

## Runtime Theme Token Proposal

```json
{
  "schemaVersion": 1,
  "id": "preset-thunder-breathing",
  "name": "霹雳呼吸",
  "brandSubtitle": "CODEX KIMETSU SKIN",
  "tagline": "把霹雳的速度感带进 Codex 工作台。",
  "projectPrefix": "选择项目 · ",
  "projectLabel": "◉  选择项目",
  "statusText": "THUNDER SKIN ONLINE",
  "quote": "BREATH OF THUNDER",
  "image": "background.jpg",
  "appearance": "dark",
  "art": {
    "focusX": 0.72,
    "focusY": 0.44,
    "safeArea": "left",
    "taskMode": "ambient"
  },
  "colors": {
    "background": "#080b10",
    "panel": "#11151d",
    "panelAlt": "#171f2a",
    "accent": "#fff8bb",
    "accentAlt": "#f6d36a",
    "secondary": "#e1a04d",
    "highlight": "#5f8aa6",
    "text": "#f7f4e8",
    "muted": "#aab6bd",
    "line": "rgba(255, 232, 142, .22)"
  }
}
```

## Supported UI Changes Beyond Background

- Font stack: display surfaces use `"Avenir Next Condensed", "DIN Condensed", "SF Pro Display", "PingFang SC", system-ui`; regular UI keeps `"SF Pro Text", "Avenir Next", "PingFang SC", system-ui`.
- Sidebar: darker blue-black shell, electric active rail, square icon wells, lower contrast inactive nav.
- Home heading: condensed heavy display type with ivory glow, not the current generic Codex headline treatment.
- Cards: 6-8px radius, thin ivory borders, amber icon wells, no soft pastel card style.
- Composer: single dark tactical surface, hard corners, amber/ivory send accent using the existing native send button.
- Project picker: keep the real Codex project selector row, restyled as the top band of the composer.

## Implementation Reality Check

The preview is constrained to elements already visible in the current Codex screenshot and already targeted by the macOS injection layer. The macOS app remains the official Codex UI with CSS and small injected decoration only; do not fake controls that are not present in the native app.

Local Codex inspection on this Mac:

- Installed app: `/Applications/ChatGPT.app`
- Bundle id: `com.openai.codex`
- Version: `26.715.31925`
- Runtime: Chromium `150.0.7871.124`, bundled Node `v24.14.0`
- Signature: OpenAI Team ID `2DC432GLL2`, notarized, valid
- Current Kimetsu Skin session: live on loopback CDP `127.0.0.1:9341`
- Current injection model: dynamic CSS/JS through CDP; `app.asar` is not modified

| Design piece | Existing macOS hook | Feasibility | Notes |
| --- | --- | --- | --- |
| Full-window wallpaper, focus, safe area, task dimming | `theme.json` `art.*`, `data-kimetsu-art-*`, `--kimetsu-skin-art` | High | Directly supported. Use `safeArea: "left"`, `focusX: 0.72`, `focusY: 0.44`, `taskMode: "ambient"`. |
| Palette and base typography | `applyTheme()` CSS variables plus `body` font rules | High | Can ship as theme tokens plus Thunder-specific CSS overrides. |
| Home headline treatment | `.kimetsu-skin-home [data-feature="game-source"]` | High | Existing selector is already used for the home hero copy. |
| Home suggestion cards | `.kimetsu-skin-home .group\/home-suggestions button` | High | Can change radius, borders, icon wells, hover, and type scale. |
| Composer and project picker | `.composer-surface-chrome`, `.kimetsu-skin-home-utility`, `.group\/project-selector` | High | Can make the dark tactical surface and amber send/action styling, but must keep native buttons clickable. |
| Sidebar dark shell and active row | `aside.app-shell-left-panel`, `[aria-current="page"]`, hover classes | High | Can style existing rows and icons without changing sidebar layout. |
| Task page message surfaces | `.thread-scroll-container`, `[class*="_markdownContent_"]`, `[class~="bg-token-foreground/5"][class~="max-w-[77%]"]` | Medium-high | Supported for implementation/testing. Current Codex task route does not expose `article` nodes. Exact turn DOM can change between Codex releases. |

Current live home-route verification after refreshing the real macOS skin screenshot on 2026-07-20:

- Viewport: `2560 x 1327`; captured PNG is Retina-scaled to `5120 x 2654`
- Sidebar: `aside.app-shell-left-panel`, `240 x 1327`, visible
- Main surface: `.main-surface.kimetsu-skin-home-shell`, `2320 x 1327`, visible
- Home hero wrapper: `.kimetsu-skin-home > div:first-child > div:first-child > div:first-child`, `2246 x 376`, visible
- Home title: `.kimetsu-skin-home [data-feature="game-source"]`, visible
- Suggestions: `.group\/home-suggestions`, `4` buttons, each about `546 x 118`, visible
- Project selector: `.group\/project-selector > button`, visible
- Home utility/project row: `.kimetsu-skin-home-utility`, visible
- Composer: `.composer-surface-chrome`, `1148 x 98`, visible
- Send button: `button[class~="bg-token-foreground"]`, visible
- Verification screenshot: `docs/images/codex-live-home-current-theme.png`
- README preview screenshot: `docs/images/thunder-breathing-live-home-fixed.png`
- Static design preview: `docs/images/thunder-breathing-macos-concept.png`

Current live task-route DOM also confirmed these dynamic hooks:

- `aside.app-shell-left-panel`: sidebar exists and is visible.
- `main.main-surface`: main surface exists and is visible.
- `header.app-header-tint`: top bar exists and can be made transparent/readable.
- `.composer-surface-chrome`: composer exists and is visible.
- `.ProseMirror`: editable input exists and can inherit theme text/caret colors.
- `button[class~="bg-token-foreground"]`: native send button exists and can be recolored.
- `#codex-kimetsu-skin-chrome`: injected decoration layer exists with `pointer-events: none`.
- macOS traffic-light controls are not in the DOM, so they are out of scope.

## Task Route DIY Support

The task route was inspected live from the real Codex window; the reference capture is preserved as `docs/images/codex-live-task-current-theme.png`.

Live task-route verification:

- Viewport: `2560 x 1327`; captured PNG is Retina-scaled to `5120 x 2654`
- Main surface: `main.main-surface`, visible
- Thread scroll container: `.thread-scroll-container`, visible
- Composer: `.composer-surface-chrome`, `736 x 98`, visible
- Sidebar: `aside.app-shell-left-panel`, `240 x 1327`, visible
- Verification screenshot: `docs/images/codex-live-task-current-theme.png`
- Implemented task preview: `docs/images/thunder-breathing-live-task-implemented.png`
- Supported task preview: `docs/images/thunder-breathing-macos-task-concept.png`
- Diff/resource preview: `docs/images/thunder-breathing-live-diff-glass-implemented.png`

Task elements that can be designed:

| Task element | Observed hook | Feasibility | Design scope |
| --- | --- | --- | --- |
| Task background and readable overlay | `main.main-surface:not(.kimetsu-skin-home-shell)`, `body`, `--kimetsu-skin-art` | High | Keep the wallpaper present but dimmer than home; use a stronger left-to-center reading veil. |
| Top task header | `header.app-header-tint`, `.no-drag` controls inside it | High | Transparent/dark tactical bar, text shadow, subtle amber focus on `打开位置`. Do not move native buttons. |
| Thread scroll area | `.thread-scroll-container` | High | Scrollbar color, top/bottom fade removal, background continuity, reading contrast. |
| Assistant markdown text | `[class*="_markdownContent_"]`, `[class*="_markdownText_"]`, `.inline-markdown` | Medium-high | Typography, inline code chips, list marker color, text shadow. Avoid relying on generated hashed class names alone. |
| User message bubbles | `[class~="bg-token-foreground/5"][class~="max-w-[77%]"]` | Medium | Dark warm bubble, amber left/accent border, lower radius. Selector is class-token based and should be guarded by task-route scope. |
| Activity/tool run headers | `[class~="group/activity-header"]` | Medium | Compact electric log strip for command/activity rows. Needs live testing because text can be virtualized. |
| Resource/file cards | `[class~="bg-token-dropdown-background/50"][class~="rounded-lg"]`, `.end-resource-default-subtitle` | Medium-high | Dark card surface, thin ivory border, file icon wells, row dividers, `打开方式` button. |
| Edited files/diff card | Text structure plus resource-card descendants; current card uses the same token surfaces | Medium | Diff header, green/red counts, file path rows. Keep native review/undo controls clickable. |
| Right environment panel | `[class*="thread-floating-content-top-inset"] [class~="bg-token-dropdown-background"]`, `[class~="group/summary-panel-item"]`, `[class~="group/section-toggle"]` | Medium-high | Smaller radius, deep blue-black panel, amber/steel section headers, row hover states. It is real DOM and pointer-enabled. |
| Composer | `.composer-surface-chrome`, `.ProseMirror`, `button[class~="bg-token-foreground"]` | High | Same dark tactical surface as home, stronger border, amber send button, themed caret and placeholder. |

Task elements not to design:

- Message virtualization mechanics, scroll anchoring, or generated turn layout structure.
- Right-side environment panel show/hide behavior or section expand/collapse logic.
- Native task title routing, draggable window region, and macOS window controls.
- Replacing the ProseMirror editor or native file/resource card interactions.
- Styling every hashed class directly without a stable ancestor and visual fallback.

## Profile Menu / Settings Page DIY Support

The left-bottom profile menu and settings page were inspected live from the real Codex app after opening the profile button and clicking `设置`.

Live support facts:

- Profile trigger: `button[aria-label="打开个人资料菜单"]`, visible at the bottom of the regular sidebar.
- Profile menu surface: `[role="menu"]`, classes include `bg-token-dropdown-background/90`, `rounded-xl`, `ring-token-border`, `shadow-xl-spread`.
- Profile menu items: `[role="menuitem"]`, current items are `micu`, `显示宠物`, and `设置 ⌘,`.
- Settings route URL remains `app://-/index.html`; it is an SPA state, not a native macOS settings window.
- Settings route root still has `html.codex-kimetsu-skin`, so CSS can affect it after injection.
- Settings sidebar uses `.app-shell-left-panel` on a `div`, with `nav[aria-label="设置"]`.
- Settings main surface uses `div.main-surface.flex.h-full.min-h-0.flex-col`, not `main.main-surface`.
- Settings search input: `input[role="searchbox"][aria-label="搜索设置"]`.
- Settings nav rows are buttons with stable Chinese `aria-label` values such as `常规`, `外观`, `语音`, `配置`, `个性化`, `宠物`, `键盘快捷键`, `账户`.
- Settings cards use section/card structure: `section.flex.flex-col` and card containers whose class starts with `flex flex-col [&>*:not(:last-child)]...`; the live card has a token border, `rgb(38, 39, 56)` background, and `20px` radius.
- Settings rows use `flex items-center justify-between px-4 gap-6 py-3`.
- Switches use `[role="switch"]`; dropdown and segmented controls are native `button` elements.
- Live settings reference screenshot: `docs/images/codex-live-settings-current-theme.png`
- Implemented profile menu preview: `docs/images/thunder-breathing-live-profile-menu-implemented.png`
- Supported profile menu preview: `docs/images/thunder-breathing-macos-profile-menu-concept.png`
- Implemented settings preview: `docs/images/thunder-breathing-live-settings-implemented.png`
- Supported settings preview: `docs/images/thunder-breathing-macos-settings-concept.png`

Profile menu elements that can be designed:

| Menu element | Observed hook | Feasibility | Design scope |
| --- | --- | --- | --- |
| Bottom profile button | `button[aria-label="打开个人资料菜单"]` | High | Dark tactical footer row, amber left rail, themed icon/text color. |
| Popover surface | `[role="menu"]` plus token dropdown classes | High | Deep blue-black surface, 6-8px radius, electric ivory ring, stronger shadow. |
| Menu rows | `[role="menuitem"]`, hover/focus token classes | High | Row spacing, hover/active background, icon color, text color, shortcut color. |
| Settings menu item | `[role="menuitem"]` text structure and existing shortcut span | Medium | Can make it read as the primary action, but must not replace native click behavior. |

Settings elements that can be designed:

| Settings element | Observed hook | Feasibility | Design scope |
| --- | --- | --- | --- |
| Settings shell/sidebar | `.app-shell-left-panel`, `nav[aria-label="设置"]` | High | Same dark sidebar language as task/home, but scoped to settings nav. |
| Back row | Button/link text `返回应用` inside settings nav | Medium | Text and hover treatment only; navigation behavior remains native. |
| Search input | `input[role="searchbox"][aria-label="搜索设置"]` and parent token input wrapper | High | Border, background, placeholder, focus ring, icon color. |
| Settings nav rows | Button `aria-label` values | High | Replace pill look with sharper 6-8px active row, amber rail, themed icon color. |
| Main settings surface | `div.main-surface.flex.h-full.min-h-0.flex-col` | High after selector update | Background, wallpaper veil, scrollbar, content contrast. Current CSS targets `main.main-surface`, so implementation must include `div.main-surface`. |
| Section cards | `section.flex.flex-col` plus card containers with token border/background | Medium-high | Card radius, border, background, dividers, shadows. Use ancestor scoping because exact utility classes can change. |
| Rows and labels | `flex items-center justify-between px-4 gap-6 py-3` descendants | Medium | Typography, muted description color, row dividers. |
| Switches | `[role="switch"]`, `button[aria-checked]` | High | Track/knob colors, disabled opacity, focus ring. Do not alter state or ARIA. |
| Dropdown/action buttons | Native `button` descendants with token border classes | Medium-high | VS Code/language/import/view buttons and segmented choices. |

Current project implementation gap:

`verify-kimetsu-skin-macos.sh --screenshot docs/images/codex-live-settings-current-theme.png` failed on the settings route because `probeSession()` currently verifies only shell markers based on `main.main-surface` plus sidebar/composer-style routes. Settings is still Codex, but its main surface is `div.main-surface` and has no composer. The manual CDP screenshot succeeded.

Before shipping the settings skin, update the macOS runtime to:

- Accept settings as a verified Codex renderer when `.main-surface` and either `.app-shell-left-panel` or `nav[aria-label="设置"]` exist.
- Change renderer route layout lookup from `main.main-surface` to `.main-surface` with `main` fallback.
- Add a settings route marker such as `.kimetsu-skin-settings-shell` when `nav[aria-label="设置"]` and `input[aria-label="搜索设置"]` are present.
- Scope settings CSS under that marker so regular task/home routes and unrelated dropdowns are not over-styled.
- Extend live verification to accept settings routes without a composer and to capture settings screenshots intentionally.

Settings elements not to design:

- Native macOS traffic-light buttons or titlebar chrome.
- Reordering settings categories, changing settings state, or replacing switches/dropdowns with custom controls.
- Adding new settings sections or custom status widgets not present in the current Codex DOM.
- Assuming all settings card utility classes are stable across Codex releases without route/ancestor guards.

## Do Not Design For This Skin

- Native macOS traffic-light buttons and window controls; they are not owned by the injected page CSS.
- A custom sidebar footer meter or other fake sidebar widgets; they are not in the current Codex DOM.
- A forced collapsed/mini sidebar; Codex controls sidebar layout and resize chrome.
- Replacing the native composer with a custom input; only its existing surface, buttons, placeholder, and project row should be styled.
- Extra floating brand/status overlays over the home screen; they risk covering native controls and are not needed for this direction.

Practical landing version: implement the Thunder skin as a theme preset plus a scoped CSS mode in `kimetsu-skin.css`, keep the native sidebar/sidebar width, keep the real project picker and composer, and use the preview only for supported color, type, surface, and motion language.
