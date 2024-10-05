import 'package:flutter/material.dart';
import 'splash_screen.dart';
import 'info_screen.dart';
import 'signup_screen.dart';  // Import the SignupScreen
// Import the HomePage

// Import the required classes for fall detection, noise detection, data capture, and background task
import 'fall_detection.dart';
import 'noise_detection.dart';
import 'background_task.dart';
import 'data_capture.dart';

void main() {
  // Ensure background task is configured before running the app
  WidgetsFlutterBinding.ensureInitialized();
  BackgroundTask.configure();  // Start background task for fall and noise detection
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',  // The initial screen of the app
      routes: {
        '/': (context) => const SplashScreen(),  // Splash screen as the initial route
        '/info': (context) => const InfoScreen(),  // Info screen route
        '/signup': (context) => const SignupScreen(),  // Signup screen route
        '/home': (context) => HomePage(),  // HomePage as the main route
      },
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isMonitoring = false;

  @override
  void initState() {
    super.initState();
    // Initialize fall detection and noise detection on app start
    FallDetection().startMonitoringFall();
    NoiseDetection().startMonitoringNoise();  // Correct method name
  }

  @override
  void dispose() {
    // Stop noise detection and other background tasks when the app is disposed
    // Only include this if you intend to stop the monitoring when navigating away
    FallDetection().stopMonitoringFall();  // Ensure stopMonitoringFall() is implemented in FallDetection
    NoiseDetection().stopNoiseDetection();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Guardia App',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            _isMonitoring
                ? const Text('Monitoring for falls and noise...')
                : const Text('Monitoring is currently stopped.'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _isMonitoring = !_isMonitoring;
                  if (_isMonitoring) {
                    // Start emergency mode data capture (video, audio, location)
                    DataCapture().startEmergencyMode();
                  } else {
                    // Stop emergency mode data capture
                    DataCapture().stopEmergencyMode();
                  }
                });
              },
              child: _isMonitoring
                  ? const Text('Stop Monitoring')
                  : const Text('Start Monitoring'),
            ),
          ],
        ),
      ),
    );
  }
}
