import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Emergency Call App")),
        body: EmergencyCallScreen(),
      ),
    );
  }
}

class EmergencyCallScreen extends StatefulWidget {
  @override
  _EmergencyCallScreenState createState() => _EmergencyCallScreenState();
}

class _EmergencyCallScreenState extends State<EmergencyCallScreen> {
  int clickCount = 0;

  Future<void> requestCallPermission() async {
    var status = await Permission.phone.status;
    if (!status.isGranted) {
      await Permission.phone.request();
    }
  }

  void onEmergencyButtonPressed() async {
    clickCount++;

    if (clickCount == 1) {
      // Request permission before making a call
      await requestCallPermission();

      // Check again if permission is granted
      if (await Permission.phone.isGranted) {
        // Make the emergency call
        final channel = MethodChannel('com.example.guardia/panicGesture');
        channel.invokeMethod('makeCall',
            {'number': '8086481977'}); // Changed number to 8921201498
      } else {
        // Handle permission denial
        print("Call permission denied");
      }

      // Reset the click count
      clickCount = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: onEmergencyButtonPressed,
        child: Text("Emergency"), // Button text is "Emergency"
      ),
    );
  }
}
