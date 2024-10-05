import 'dart:async';  // Add this to resolve StreamSubscription error
import 'package:sensors_plus/sensors_plus.dart';
import 'data_capture.dart';

class FallDetection {
  static const double _accelerationThreshold = 18; // Threshold for fall detection
  bool _isMonitoringFall = false;
  StreamSubscription? _subscription;

  void startMonitoringFall() {
    _subscription = accelerometerEvents.listen((AccelerometerEvent event) {
      double totalAcceleration = event.x.abs() + event.y.abs() + event.z.abs();
      if (totalAcceleration > _accelerationThreshold) {
        print("Fall detected! Triggering emergency...");
        DataCapture().startEmergencyMode(); // Trigger emergency data capture
      }
    });
    _isMonitoringFall = true;
  }

  void stopMonitoringFall() {
    if (_isMonitoringFall) {
      _subscription?.cancel();
      _isMonitoringFall = false;
      print("Fall monitoring stopped.");
    }
  }
}
