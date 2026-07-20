# 预设主题

本目录只保留一套内置主题：

- `preset-thunder-breathing/`：我妻善逸「霹雳呼吸」主题。

安装 `macos/scripts/install-kimetsu-skin-macos.sh` 时，脚本会把这个 `preset-*` 目录播种到用户主题库：

```text
~/Library/Application Support/CodexKimetsuSkin/themes/
```

如果当前还没有活动主题，安装器会自动把它设为默认主题。已存在的用户自定义 `custom-*` 主题不会被删除或覆盖。

## 主题结构

```text
preset-thunder-breathing/
├── background.jpg
└── theme.json
```

`theme.json` 使用与运行时 `assets/theme.json` 相同的 schema，核心字段如下：

- `id`: `preset-thunder-breathing`
- `name`: `霹雳呼吸`
- `image`: `background.jpg`
- `appearance`: `dark`
- `art.safeArea`: `left`
- `art.taskMode`: `ambient`

切换命令：

```bash
~/.codex/codex-kimetsu-skin/scripts/switch-theme-macos.sh \
  --id preset-thunder-breathing
```

## 素材边界

`background.jpg` 是这套 fork 的角色主题背景。文档中的 `docs/images/thunder-breathing-*.png` 和 `docs/images/codex-live-*-current-theme.png` 是设计或实机预览图，不是可导入背景。

这套主题包含第三方 IP 角色参考，不随 MIT 软件许可授权。公开再分发、商用或二次打包前，需要自行确认角色、图像、模型输出与商标相关权利。
