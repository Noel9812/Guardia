import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_background_geolocation/flutter_background_geolocation.dart' as bg;

class LocationSharingService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Start sharing the user's location with Firestore
  void startSharingLocation(String userId) {
    bg.BackgroundGeolocation.onLocation((bg.Location location) {
      // Update Firestore with user's current location
      firestore.collection('locations').doc(userId).set({
        'latitude': location.coords.latitude,
        'longitude': location.coords.longitude,
        'timestamp': FieldValue.serverTimestamp(),
      });
    });

    // Start background geolocation to track user's location
    bg.BackgroundGeolocation.start();
  }
}
