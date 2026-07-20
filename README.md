# Codex Kimetsu Skin

<p align="center">
  <strong>中文</strong> · <a href="./README.en.md">English</a>
</p>

<p align="center">
  <strong>我妻善逸「霹雳呼吸」Codex 桌面端主题皮肤</strong><br>
  基于本机 CDP 注入 · 不修改官方安装包 · 保留 Codex 原生交互
</p>

> 把我妻善逸「霹雳呼吸」的速度感、雷光和深色工作台氛围带进 Codex 桌面端。主题通过本机 CDP 注入应用，不改官方安装包，也不替换 Codex 的原生交互。

## 主题预览

<p align="center">
  <img src="docs/images/codex-live-home-current-theme.png" alt="我妻善逸霹雳呼吸主题首页实机效果" width="900"><br>
  <sub>霹雳呼吸 · macOS 实机注入截图 · 2026-07-20 重新截取</sub>
</p>

这套主题使用深蓝黑背景、霹雳白金高光、羽织橙动作态和更硬朗的 6-8px 控件语言。运行时仍然是官方 Codex 的真实侧栏、任务页、项目选择、设置页、输入框和菜单；主题层只通过 CSS 与少量装饰 DOM 改变外观。

## 快速开始

### macOS

```bash
cd macos
./scripts/install-kimetsu-skin-macos.sh --no-launch
~/.codex/codex-kimetsu-skin/scripts/switch-theme-macos.sh \
  --id preset-thunder-breathing
~/.codex/codex-kimetsu-skin/scripts/start-kimetsu-skin-macos.sh
```

也可以双击 `macos/Install Codex Kimetsu Skin.command` 安装。安装后桌面会创建启动、验证、定制和恢复入口。

### Windows

```powershell
cd windows
powershell -ExecutionPolicy Bypass -File .\scripts\install-kimetsu-skin.ps1
powershell -ExecutionPolicy Bypass -File .\scripts\start-kimetsu-skin.ps1
```

Windows 首次安装会把同一套「霹雳呼吸」设为活动主题，并播种到本地已保存主题库。

## 仓库结构

| 路径 | 内容 |
|------|------|
| `macos/` | macOS 安装、启动、注入、验证、恢复脚本，以及霹雳呼吸主题资源 |
| `macos/presets/preset-thunder-breathing/` | 唯一保留的内置主题包 |
| `windows/` | Windows PowerShell 启动/安装/恢复脚本、CDP 注入器和同款默认主题 |
| `docs/designs/` | 霹雳呼吸设计说明和静态预览 |
| `docs/images/` | 当前实机截图与设计预览图 |

## 安全边界

- CDP 只绑定本机回环地址。
- 不修改官方 `.app`、WindowsApps、`app.asar`、代码签名、API Key 或 Base URL。
- Restore 脚本会停止主题注入并恢复官方外观。
- 运行皮肤时不要让不可信本机程序连接调试端口。

## 测试

```bash
cd macos && npm test
powershell -File windows/tests/run-tests.ps1
```

提交前请同时检查首页、任务页、左下角个人资料菜单和设置页。

## 许可与声明

代码许可见 [`macos/LICENSE`](./macos/LICENSE)，额外素材声明见 [`macos/NOTICE.md`](./macos/NOTICE.md)。

## 来源与致谢

本项目参考并使用了 [Fei-Away/Codex-Dream-Skin](https://github.com/Fei-Away/Codex-Dream-Skin) 的本机 CDP 换肤思路与跨平台脚本结构，在此基础上整理为我妻善逸「霹雳呼吸」主题版本。

本项目不是 OpenAI 官方产品。Codex、鬼灭之刃、我妻善逸及相关名称、角色、商标和素材权利归各自权利人所有。本仓库中的角色主题素材仅作个人主题示意；公开再分发或商用前请自行完成权利核验。
