import 'package:flutter_sound/flutter_sound.dart';
import 'data_capture.dart';

class NoiseDetection {
  final FlutterSoundRecorder _recorder = FlutterSoundRecorder();
  static const double _noiseThreshold = 80.0; // Example decibel threshold for loud noise
  bool _isMonitoringNoise = false;

  void startMonitoringNoise() async {
    await _recorder.openRecorder();  // Correct method for initializing audio session
    await _recorder.startRecorder(); // Start recording without stream
    _monitorNoise();
    _isMonitoringNoise = true;
  }

  void _monitorNoise() {
    // Simulate monitoring of the noise level by periodically checking audio input.
    // You'll need a real noise-level detector or audio stream analyzer here.
    print("Monitoring noise...");
    // You can implement noise level monitoring here if required
    if (_calculateNoiseLevel() > _noiseThreshold) {
      print("Loud noise detected! Triggering emergency...");
      DataCapture().startEmergencyMode(); // Trigger emergency data capture
    }
  }

  double _calculateNoiseLevel() {
    // Your logic to analyze audio stream and return noise level in decibels
    return 85.0; // Placeholder
  }

  void stopNoiseDetection() async {
    if (_isMonitoringNoise) {
      await _recorder.stopRecorder();
      _isMonitoringNoise = false;
      print("Noise monitoring stopped.");
    }
  }
}
