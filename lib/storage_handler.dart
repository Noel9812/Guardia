import 'dart:io';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class StorageHandler {
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  Future<void> saveData(File file) async {
    await _storeLocally(file);  // Only store locally, no cloud upload
  }

  Future<void> saveLocationData(String locationData) async {
    await _secureStorage.write(key: "location_data", value: locationData);  // Store location data securely
  }

  Future<void> _storeLocally(File file) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final path = "${directory.path}/${file.path}";
      file.copy(path);  // Copy the file to the local directory
      await _secureStorage.write(key: file.path, value: path);  // Store the file path securely
      print("File stored locally: $path");
    } catch (e) {
      print("Error storing file locally: $e");
    }
  }

  Future<bool> _isConnectedToInternet() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi;
  }

  void handleConnectivity() async {
    if (await _isConnectedToInternet()) {
      print("Internet connection detected, but no cloud uploads configured.");
    } else {
      print("No internet connection: Continuing with local storage.");
    }
  }
}
