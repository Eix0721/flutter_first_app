```markdown
# Namer App

A tiny but delightful Flutter demo that generates random word-pairs on demand and lets you style the experience exactly the way you like.

| ![Screenshot Light](https://via.placeholder.com/320x640/FAFAFA/000000?text=Light+Demo) | ![Screenshot Dark](https://via.placeholder.com/320x640/121212/FFFFFF?text=Dark+Demo) |
|---|---|

## ✨ Features

- **Random word-pairs** powered by the *english_words* package.
- **Live theming** – pick any accent color from the in-app palette.
- **Light & dark mode** – toggle instantly with a switch.
- **Material 3** styling with beautiful card elevations and rounded corners.
- **Animated button** – subtle scale feedback for every interaction.

## 🚀 Getting Started

### 1. Clone the repo
```bash
git clone https://github.com/your-username/namer-app.git
cd namer-app
```

### 2. Install dependencies
```bash
flutter pub get
```

### 3. Run the app
```bash
flutter run
```

## 🧪 Running Tests (optional)
```bash
flutter test
```

## 🛠️ Built With

| Package | Purpose |
|---------|---------|
| [provider](https://pub.dev/packages/provider) | State management |
| [english_words](https://pub.dev/packages/english_words) | Word-pair generation |
| [google_fonts](https://pub.dev/packages/google_fonts) | Typography |

## 📁 Project Structure
```
lib/
├── main.dart          # Entry point & theming
└── src/
    ├── app_state.dart # MyAppState (ChangeNotifier)
    ├── home_page.dart # MyHomePage widget
    └── animated_button.dart # Custom animated button
```
> *The snippets above are inlined in `main.dart` for simplicity in the original codelab.*

## 🎨 Customization Tips

1. **Add more colors** – append entries to `colorOptions` in `MyAppState`.
2. **Swap fonts** – replace `GoogleFonts.robotoTextTheme()` with any font from the [google_fonts catalog](https://fonts.google.com).
3. **Tweak animations** – edit the `duration` and `scale` values inside `AnimatedButton`.

## 🤝 Contributing

Contributions are welcome! Feel free to open issues or submit PRs.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-idea`)
3. Commit your changes (`git commit -m 'Add amazing idea'`)
4. Push to the branch (`git push origin feature/amazing-idea`)
5. Open a Pull Request

## 📄 License

Distributed under the MIT License. See `LICENSE` for more information.

---

Made with ❤️ by [Your Name](https://github.com/your-username).
```
