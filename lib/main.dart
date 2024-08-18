import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// Root widget of the application
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Variable to track whether dark mode is enabled
  bool _isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Set the theme based on the _isDarkMode variable
      theme: _isDarkMode ? darkTheme : lightTheme,
      home: HomeScreen(
        // Pass a function to toggle the theme
        onThemeChanged: (bool isDarkMode) {
          setState(() {
            _isDarkMode = isDarkMode;
          });
        },
        isDarkMode: _isDarkMode, // Pass the current theme mode
      ),
    );
  }
}

// HomeScreen widget displays content and allows theme switching
class HomeScreen extends StatelessWidget {
  final ValueChanged<bool> onThemeChanged;
  final bool isDarkMode;

  HomeScreen({required this.onThemeChanged, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Multi-Theme Flutter App'),
        actions: [
          // Button to switch between light and dark themes
          IconButton(
            icon: Icon(isDarkMode ? Icons.brightness_7 : Icons.brightness_2),
            onPressed: () {
              onThemeChanged(!isDarkMode);
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Hello World',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Click Me'),
            ),
          ],
        ),
      ),
    );
  }
}

// Define the light theme
final ThemeData lightTheme = ThemeData(
  primarySwatch: Colors.blue,
  colorScheme: const ColorScheme.light(),
  brightness: Brightness.light, // Light theme
  textTheme: const TextTheme(
    headlineLarge: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
    bodyLarge: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: Colors.blue,
    textTheme: ButtonTextTheme.primary,
  ),
);

// Define the dark theme
final ThemeData darkTheme = ThemeData(
  primarySwatch: Colors.grey,
  colorScheme: const ColorScheme.dark(),
  brightness: Brightness.dark, // Dark theme
  textTheme: const TextTheme(
    headlineLarge: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold, color: Colors.white),
    bodyLarge: TextStyle(fontSize: 14.0, fontFamily: 'Hind', color: Colors.white70),
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: Colors.grey,
    textTheme: ButtonTextTheme.primary,
  ),
);
