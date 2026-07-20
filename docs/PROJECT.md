# Codex Kimetsu Skin · 项目记录

本仓库是基于本机 CDP 换肤运行框架改造的主题化 fork。上游提供跨平台 Codex 换肤运行能力；本 fork 的维护目标是把发行内容收敛成一套我妻善逸「霹雳呼吸」主题。

## 当前范围

- 保留本机 CDP 注入模型。
- 保留 macOS 与 Windows 的安装、启动、验证、暂停、恢复脚本。
- 保留主题导入/保存能力，方便本地测试与自定义。
- 内置主题只保留 `preset-thunder-breathing`。
- 删除上游多主题发行内容、旧生图提示词和非善逸主题素材。

## 运行模型

```text
用户本机脚本
    │  启动官方 Codex + loopback CDP
    ▼
官方 Codex Desktop
    │  注入 CSS + 装饰 DOM
    ▼
原生 Codex 控件 + 霹雳呼吸视觉层
```

不修改官方 `.app`、WindowsApps、`app.asar`、签名、API Key 或 Base URL。

## 主题资产

| 路径 | 用途 |
|------|------|
| `macos/presets/preset-thunder-breathing/` | 唯一内置 preset |
| `macos/assets/kimetsu-reference.jpg` | macOS 默认 payload 背景 |
| `windows/assets/kimetsu-reference.jpg` | Windows 默认 payload 背景 |
| `docs/designs/` | 霹雳呼吸设计说明与静态预览 |
| `docs/images/codex-live-*-current-theme.png` | 当前 Codex 实机参考截图 |
| `docs/images/thunder-breathing-*.png` | 霹雳呼吸设计/实机预览 |

预览图已在 2026-07-20 从当前我妻善逸皮肤实机重新截取；文档预览图不能当作主题背景导入。

## 维护要求

- 用户可见 macOS 行为变更需要更新 `macos/CHANGELOG.md`。
- Windows 行为变更需要更新 `windows/CHANGELOG.md`。
- 主题相关测试至少覆盖安装默认主题、主题切换、payload 校验和恢复路径。
- 配置写入必须保持严格 UTF-8、原子写入、可恢复备份和中文路径/项目名回归测试。
- CDP 必须保持 loopback-only。

## 素材声明

霹雳呼吸主题包含第三方 IP 角色参考，不随 MIT 软件许可授权。公开再分发、商用或二次打包前，需要自行确认角色、图像、模型输出和商标相关权利。详细清单见 [`../macos/NOTICE.md`](../macos/NOTICE.md)。
