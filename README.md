# 第一个Flutter应用！（But design by AI)

一个迷你却有趣的 Flutter 演示应用，能够按需生成随机单词组合，并让你随心所欲地切换主题风格。

## ✨ 主要功能

- **随机单词组合**：借助 *english_words* 包实时生成。
- **实时换色**：在应用内调色板中任意选择主题色。
- **深浅模式**：一键切换明亮 / 暗黑外观。
- **Material 3 设计**：卡片阴影、圆角与动态配色。
- **按钮动画**：每次点击都有细腻的缩放反馈。

## 🚀 快速开始

### 1. 克隆仓库
```bash
git clone https://github.com/your-username/namer-app.git
cd namer-app
```

### 2. 安装依赖
```bash
flutter pub get
```

### 3. 运行应用
```bash
flutter run
```

## 🧪 运行测试（可选）
```bash
flutter test
```

## 🛠️ 技术栈

| 依赖包 | 作用 |
|--------|------|
| [provider](https://pub.dev/packages/provider) | 状态管理 |
| [english_words](https://pub.dev/packages/english_words) | 单词组合生成 |
| [google_fonts](https://pub.dev/packages/google_fonts) | 字体定制 |

## 📁 项目结构
```
lib/
├── main.dart          # 入口与主题配置
└── src/
    ├── app_state.dart # MyAppState（状态管理）
    ├── home_page.dart # 主页
    └── animated_button.dart # 自定义带动画的按钮
```
> 为了简化示例，以上文件全部内联在 `main.dart` 中。

## 🎨 个性化指南

1. **增加颜色**：在 `MyAppState` 的 `colorOptions` 里继续添加。
2. **更换字体**：将 `GoogleFonts.robotoTextTheme()` 替换为 [Google_fonts 字体库](https://fonts.google.com) 中的任意字体。
3. **调整动画**：修改 `AnimatedButton` 中的 `duration` 与缩放系数即可。

## 🤝 如何贡献

欢迎贡献！请随时提 Issue 或 Pull Request。

1. Fork 本仓库
2. 创建功能分支（`git checkout -b feature/你的点子`）
3. 提交更改（`git commit -m '添加了酷炫功能'`）
4. 推送分支（`git push origin feature/你的点子`）
5. 新建 Pull Request

## 📄 许可证

MIT 许可证，详见 `LICENSE`。

---

用爱发电 ❤️ by [Eix0721](https://github.com/Eix0721)。
```
