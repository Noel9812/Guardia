import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';

class PanicGestureService {
  static const MethodChannel _channel =
      MethodChannel('com.example.guardia/panicGesture');

  static Future<void> startListening() async {
    await requestPermissions(); // Request phone permissions before starting

    // Native method call to start listening for power button presses
    _channel.invokeMethod('EMERGENCY');
  }

  static Future<void> requestPermissions() async {
    await Permission.phone.request(); // Request phone permission
  }
}