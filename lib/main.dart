import 'package:flutter/material.dart';
import 'splash_screen.dart';
import 'info_screen.dart';
import 'signup_screen.dart';  // Import the SignupScreen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),  // Splash screen as the initial route
        '/info': (context) => const InfoScreen(),  // Info screen route
        '/signup': (context) => const SignupScreen(),  // Signup screen route
      },
    );
  }
}