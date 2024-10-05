import 'package:geolocator/geolocator.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:camera/camera.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:async';
import 'package:path_provider/path_provider.dart';

class DataCapture {
  Position? _currentPosition;
  final FlutterSoundRecorder _audioRecorder = FlutterSoundRecorder();
  CameraController? _cameraController;
  Timer? _timer;
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  // Start capturing data in emergency mode
  void startEmergencyMode() async {
    await _initializeAudioRecording();
    await _initializeVideoRecording();
    
    _captureData();
    _timer = Timer.periodic(const Duration(seconds: 30), (timer) {
      _captureData();
    });
  }

  // Stop emergency mode (stop capturing data)
  void stopEmergencyMode() {
    if (_timer != null) {
      _timer!.cancel();
      _timer = null;
    }
    _stopAudioRecording();
    _stopVideoRecording();
    print("Emergency mode stopped.");
  }

  // Capture audio, video, and location
  Future<void> _captureData() async {
    await _captureLocation();
    _startAudioRecording();
    _startVideoRecording();
  }

  // Capture location
  Future<void> _captureLocation() async {
    try {
      _currentPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      print("Captured location: Lat ${_currentPosition!.latitude}, Long ${_currentPosition!.longitude}");

      String locationKey = "location_${DateTime.now().toIso8601String()}";
      await _secureStorage.write(key: locationKey, value: "Lat ${_currentPosition!.latitude}, Long ${_currentPosition!.longitude}");
    } catch (e) {
      print("Error capturing location: $e");
    }
  }

  // Initialize audio recording
  Future<void> _initializeAudioRecording() async {
    await _audioRecorder.openRecorder();  // Correct method name
  }

  // Start audio recording
  Future<void> _startAudioRecording() async {
    String filePath = "${(await getTemporaryDirectory()).path}/audio_${DateTime.now().millisecondsSinceEpoch}.aac";
    await _audioRecorder.startRecorder(toFile: filePath);
    print("Audio recording started: $filePath");

    await _secureStorage.write(key: "audio_${DateTime.now().toIso8601String()}", value: filePath);
  }

  // Stop audio recording
  Future<void> _stopAudioRecording() async {
    await _audioRecorder.stopRecorder();
    print("Audio recording stopped.");
  }

  // Initialize video recording
  Future<void> _initializeVideoRecording() async {
    final cameras = await availableCameras();
    _cameraController = CameraController(cameras[0], ResolutionPreset.high);
    await _cameraController!.initialize();
  }

  // Start video recording
  Future<void> _startVideoRecording() async {
    if (_cameraController != null) {
      await _cameraController!.startVideoRecording();  // Correct method call (no arguments)
      String filePath = "${(await getTemporaryDirectory()).path}/video_${DateTime.now().millisecondsSinceEpoch}.mp4";
      print("Video recording started: $filePath");

      await _secureStorage.write(key: "video_${DateTime.now().toIso8601String()}", value: filePath);
    }
  }

  // Stop video recording
  Future<void> _stopVideoRecording() async {
    if (_cameraController != null && _cameraController!.value.isRecordingVideo) {
      await _cameraController!.stopVideoRecording();
      print("Video recording stopped.");
    }
  }
}
