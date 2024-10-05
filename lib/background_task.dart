import 'package:background_fetch/background_fetch.dart';
import 'fall_detection.dart';
import 'noise_detection.dart';

class BackgroundTask {
  static bool _isMonitoringFall = false;
  static bool _isMonitoringNoise = false;

  static void configure() {
    BackgroundFetch.configure(BackgroundFetchConfig(
      minimumFetchInterval: 15, // Background fetch every 15 minutes
      stopOnTerminate: false,    // Keep running after app termination
      startOnBoot: true,         // Automatically start on device boot
      enableHeadless: true,      // Support for headless mode
    ), (String taskId) async {
      print("Background fetch event: $taskId");

      if (!_isMonitoringFall) {
        print("Starting fall detection...");
        FallDetection().startMonitoringFall();
        _isMonitoringFall = true;
      }

      if (!_isMonitoringNoise) {
        print("Starting noise detection...");
        NoiseDetection().startMonitoringNoise();
        _isMonitoringNoise = true;
      }

      BackgroundFetch.finish(taskId);
    });
  }
}
