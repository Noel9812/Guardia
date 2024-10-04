import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Delay for 3 seconds before navigating to the InfoScreen
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/info');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[100],  // Light blue background
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // App Logo
            Image.asset(
              'assets/logo.png',  // Path to your app logo
              width: 150,
              height: 150,
            ),
            const SizedBox(height: 20),
            // App Name with a stylish font
            const Text(
              'Guardia',  // Your app's name
              style: TextStyle(
                fontSize: 32,  // Increased font size for better visibility
                fontWeight: FontWeight.bold,
                fontFamily: 'Pacifico',  // Example of a stylish font
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
