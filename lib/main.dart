import 'package:flutter/material.dart';
import 'package:web_view/theme/light_theme.dart';
import 'package:web_view/view/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: LightTheme.getTheme(),
      home: const SplashScreen(),
    );
  }
}
