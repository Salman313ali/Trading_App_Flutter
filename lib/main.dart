import 'package:flutter/material.dart';
import 'package:trading_app/src/Features/authentication/Screens/on_boarding_screen.dart';
import 'package:trading_app/src/Utils/Theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trading App',
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: OnboardingScreen(),
    );
  }
}


