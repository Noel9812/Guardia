import 'package:flutter/material.dart';
import 'package:flutter_background_geolocation/flutter_background_geolocation.dart'
    as bg;
import '../services/location_sharing_service.dart'; // Import the location sharing service
import 'package:firebase_auth/firebase_auth.dart'; // Import FirebaseAuth to get the user ID

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final LocationSharingService _locationSharingService =
      LocationSharingService();
  final String userId = FirebaseAuth.instance.currentUser?.uid ??
      'guest'; // Get the user's ID (fallback to 'guest')

  @override
  void initState() {
    super.initState();

    // Configure the background geolocation
    bg.BackgroundGeolocation.onGeofence((bg.GeofenceEvent event) {
      if (event.action == 'ENTER') {
        print("[geofence] - ENTER: ${event.identifier}");
        // Handle geofence entry event
      } else if (event.action == 'EXIT') {
        print("[geofence] - EXIT: ${event.identifier}");
        // Handle geofence exit event
      }
    });

    // Add a geofence
    bg.BackgroundGeolocation.addGeofence(bg.Geofence(
      identifier: "SanFrancisco",
      latitude: 37.7749,
      longitude: -122.4194,
      radius: 200, // Radius in meters
      notifyOnEntry: true,
      notifyOnExit: true,
      loiteringDelay: 30000, // Delay in milliseconds
    )).then((bool success) {
      print("[addGeofence] success");
    }).catchError((error) {
      print("[addGeofence] FAILURE: $error");
    });

    // Ready the plugin for use
    bg.BackgroundGeolocation.ready(bg.Config(
      desiredAccuracy: bg.Config.DESIRED_ACCURACY_HIGH,
      distanceFilter: 10,
      stopOnTerminate: false,
      startOnBoot: true,
    )).then((bg.State state) {
      if (!state.enabled) {
        bg.BackgroundGeolocation.start();
      }
    });

    // Start sharing the user's location with Firestore
    _locationSharingService.startSharingLocation(userId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Geofencing & Real-Time Sharing")),
      body: Center(
        child: Text(
            'Geofencing and real-time location sharing are running in the background.'),
      ),
    );
  }
}
