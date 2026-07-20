# Changelog

## 1.2.2 — 2026-07-17

### Changed

- 将发行内容收敛为单一 macOS 内置主题 `preset-thunder-breathing`。
- 首次安装默认选择我妻善逸「霹雳呼吸」，不再播种其他内置预设。
- 默认 payload 改为 `assets/kimetsu-reference.jpg` + 霹雳呼吸 `theme.json`。
- standalone 文档打包只复制霹雳呼吸设计文档和相关预览图。

### Removed

- 删除上游多主题预设、旧预设生成器、旧图库、旧生图提示词和非善逸主题素材。

### Tests

- 更新预设播种、主题切换、payload、图片元数据和 standalone 文档测试，使断言只覆盖霹雳呼吸主题。

## 1.2.1 — 2026-07-17

### Added

- 新增 macOS 内置「霹雳呼吸」预设，使用深蓝黑、霹雳白金、羽织橙和钢蓝高光配色，并固定 16:9 背景的左侧安全区与任务页沉浸模式。
- 任务页、左下角个人资料菜单和设置页加入霹雳呼吸风格覆盖。

### Fixed

- 修正「霹雳呼吸」首页建议卡片图标、任务页活动状态标签和设置页分组卡片的视觉问题。
- `doctor-macos.sh` 普通模式不再因为旧 live session 校验失败直接退出；只有 `--require-live` 才强制要求 live 注入通过。
