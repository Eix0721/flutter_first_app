import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  ThemeData _buildTheme(Color seedColor, Brightness brightness) {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: seedColor,
      brightness: brightness,
    );
    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      textTheme: GoogleFonts.robotoTextTheme().copyWith(
        headlineMedium: GoogleFonts.roboto(
          fontWeight: FontWeight.w500,
          fontSize: 28,
          color: colorScheme.primary,
        ),
        bodyLarge: GoogleFonts.roboto(
          fontSize: 20,
          fontWeight: FontWeight.w400,
          color: colorScheme.onSurface,
        ),
        labelLarge: GoogleFonts.roboto(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: colorScheme.onPrimary,
        ),
      ),
      cardTheme: CardThemeData(
        color: colorScheme.surface,
        elevation: 4,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: GoogleFonts.roboto(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: Consumer<MyAppState>(
        builder: (context, appState, child) => MaterialApp(
          title: 'Namer App',
          theme: _buildTheme(appState.selectedColor, Brightness.light),
          darkTheme: _buildTheme(appState.selectedColor, Brightness.dark),
          themeMode: appState.isDarkMode ? ThemeMode.dark : ThemeMode.light,
          home: const MyHomePage(),
        ),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();
  Color selectedColor = Colors.limeAccent;
  bool isDarkMode = false;

  final Map<Color, String> colorOptions = {
    Colors.limeAccent: 'Lime',
    Colors.tealAccent: 'Teal',
    Colors.pinkAccent: 'Pink',
    Colors.blueAccent: 'Blue',
    Colors.orangeAccent: 'Orange',
    Colors.purpleAccent: 'Purple',
    Colors.greenAccent: 'Green',
  };

  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }

  void changeColor(Color newColor) {
    selectedColor = newColor;
    notifyListeners();
  }

  void toggleDarkMode(bool value) {
    isDarkMode = value;
    notifyListeners();
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Color: '),
                      DropdownButton<Color>(
                        value: appState.selectedColor,
                        items: appState.colorOptions.entries.map((entry) {
                          return DropdownMenuItem<Color>(
                            value: entry.key,
                            child: Row(
                              children: [
                                Container(
                                  width: 20,
                                  height: 20,
                                  color: entry.key,
                                  margin: const EdgeInsets.only(right: 8),
                                ),
                                Text(entry.value),
                              ],
                            ),
                          );
                        }).toList(),
                        onChanged: (Color? newColor) {
                          if (newColor != null) {
                            appState.changeColor(newColor);
                          }
                        },
                      ),
                      const Spacer(),
                      const Text('Dark Mode: '),
                      Switch(
                        value: appState.isDarkMode,
                        onChanged: (value) {
                          appState.toggleDarkMode(value);
                        },
                        activeColor: theme.colorScheme.primary,
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'A Random Idea',
                    style: theme.textTheme.headlineMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    appState.current.asLowerCase,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      fontStyle: FontStyle.italic,
                      color: theme.colorScheme.primary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  AnimatedButton(
                    onPressed: () {
                      appState.getNext();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AnimatedButton extends StatefulWidget {
  final VoidCallback onPressed;

  const AnimatedButton({super.key, required this.onPressed});

  @override
  AnimatedButtonState createState() => AnimatedButtonState();
}

class AnimatedButtonState extends State<AnimatedButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) {
        setState(() => _isPressed = false);
        widget.onPressed();
      },
      onTapCancel: () => setState(() => _isPressed = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: Matrix4.identity()..scale(_isPressed ? 0.95 : 1.0),
        child: FilledButton(
          onPressed: null,
          child: Text(
            'NEXT',
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ),
      ),
    );
  }
}