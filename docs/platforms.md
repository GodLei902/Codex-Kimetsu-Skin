# 平台对照

本 fork 只保留我妻善逸「霹雳呼吸」主题。macOS 和 Windows 运行模型一致：启动官方 Codex 桌面端，打开仅本机可访问的 CDP 端口，再注入主题 CSS 和装饰 DOM。官方安装包、`app.asar`、签名、API Key 和 Base URL 均不被修改。

## 路径速查

### macOS

| 用途 | 路径 |
|------|------|
| 源码 | `Codex-Kimetsu-Skin/macos/` |
| 安装后引擎 | `~/.codex/codex-kimetsu-skin` |
| 状态 / 日志 / 主题库 | `~/Library/Application Support/CodexKimetsuSkin` |
| 活动主题 | `~/Library/Application Support/CodexKimetsuSkin/theme` |
| 已保存主题 | `~/Library/Application Support/CodexKimetsuSkin/themes` |
| Codex 配置 | `~/.codex/config.toml` |
| 默认 CDP 端口 | `9341` |

### Windows

| 用途 | 路径 |
|------|------|
| 源码 | `Codex-Kimetsu-Skin/windows/` |
| 安装后的受管运行时 | `%LOCALAPPDATA%\CodexKimetsuSkin\engine` |
| 状态 / 日志 | `%LOCALAPPDATA%\CodexKimetsuSkin` |
| 活动主题 | `%LOCALAPPDATA%\CodexKimetsuSkin\active-theme` |
| 已保存主题 | `%LOCALAPPDATA%\CodexKimetsuSkin\themes` |
| Codex 配置 | `%USERPROFILE%\.codex\config.toml` |
| 默认 CDP 端口 | 首选 `9335`，冲突时自动选空闲口 |

Windows 启动、失败回滚与恢复重开均从已注册的 `OpenAI.Codex` 包清单解析 AppUserModelId，并通过系统应用包激活接口传递 CDP 参数；不会直接执行受 WindowsApps ACL 限制的可执行文件路径。

## 能力矩阵

| 功能 | macOS | Windows |
|------|:-----:|:-------:|
| 安装脚本 | ✅ | ✅ |
| 启动 + 注入 | ✅ | ✅ |
| 一键恢复 | ✅ | ✅ |
| 实机 verify / 截图 | ✅ | ✅ |
| 本地主题库 | ✅ | ✅ |
| 用户选图定制 | ✅ | ✅ |
| 官方签名/包身份校验 | ✅ | ✅ |
| 内置霹雳呼吸主题 | ✅ | ✅ |

## 主题契约

两端默认主题都使用同一套语义字段：

```json
{
  "id": "preset-thunder-breathing",
  "name": "霹雳呼吸",
  "appearance": "dark",
  "art": {
    "focusX": 0.72,
    "focusY": 0.44,
    "safeArea": "left",
    "taskMode": "ambient"
  }
}
```

- `macos/presets/preset-thunder-breathing/` 是唯一保留的 macOS 内置 preset。
- `macos/assets/kimetsu-reference.jpg` 和 `windows/assets/kimetsu-reference.jpg` 是两端默认 payload 的霹雳呼吸背景。
- `docs/images/thunder-breathing-*.png` 与 `docs/images/codex-live-*-current-theme.png` 是文档预览图，不是可导入背景。

## 图片限制

- 主题图片必须是 PNG / JPEG / WebP 等运行时支持格式。
- 注入前拒绝空文件、超过 16 MB 的文件、任一边超过 16384px 或总像素超过 50MP 的图片。
- 背景应是纯画面，不应包含窗口、侧栏、输入框、按钮、Logo、水印或可读 UI 文字。

## 安全边界

- CDP 只绑定 `127.0.0.1`。
- 运行皮肤期间，不要让不可信本机程序连接调试端口。
- macOS 配置写入使用严格 UTF-8、锁、备份和原子替换。
- Windows 配置写入使用严格 UTF-8、同目录原子替换和可恢复备份。
- Restore 只会停止通过记录身份校验的 Codex / injector 进程。
