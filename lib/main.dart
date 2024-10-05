import 'package:flutter/material.dart';

import 'splash_screen.dart'; // Import the SplashScreen
import 'info_screen.dart'; // Import the InfoScreen
import 'screens/signup_screen.dart'; // Import the SignupScreen
import 'screens/home_screen.dart'; // Import the HomeScreen

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Ensure Flutter widgets are initialized before Firebase


  // Optionally, you could add geolocation configuration here.
  // Initialize the background geolocation if required:
  bg.BackgroundGeolocation.ready(bg.Config(
    desiredAccuracy: bg.Config.DESIRED_ACCURACY_HIGH,
    distanceFilter: 10, // Distance filter in meters before location updates
    stopOnTerminate: false,
    startOnBoot: true,
  )).then((bg.State state) {
    if (!state.enabled) {
      bg.BackgroundGeolocation.start();
    }
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/', // Splash screen as the initial route
      routes: {
        '/': (context) => const SplashScreen(), // Splash screen route
        '/info': (context) => const InfoScreen(), // Info screen route
        '/signup': (context) => const SignupScreen(), // Signup screen route
        '/home': (context) => HomeScreen(), // Home screen route for geofencing
      },
    );
  }
}
