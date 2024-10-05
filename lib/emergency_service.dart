import 'packagefluttermaterial.dart';
import 'packagegoogle_maps_fluttergoogle_maps_flutter.dart';
import 'packagegeolocatorgeolocator.dart';
import 'packagehttphttp.dart' as http;
import 'dartconvert';

void main() = runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home MapScreen(),
    );
  }
}

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() = _MapScreenState();
}

class _MapScreenState extends StateMapScreen {
  GoogleMapController mapController;
  LatLng _currentLocation;
  ListMarker _markers = [];

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Futurevoid _getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy LocationAccuracy.high);
    setState(() {
      _currentLocation = LatLng(position.latitude, position.longitude);
      _fetchNearbyPlaces();
    });
  }

  Futurevoid _fetchNearbyPlaces() async {
    if (_currentLocation == null) return;

    String apiKey = 'YOUR_GOOGLE_API_KEY';  Replace with your Google API key
    String types = 'hospitalpolicefire_station';  Emergency services types
    String url =
        'httpsmaps.googleapis.commapsapiplacenearbysearchjsonlocation=${_currentLocation!.latitude},${_currentLocation!.longitude}&radius=5000&type=${types}&key=$apiKey';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      List places = result['results'];
      _addMarkers(places);
    }
  }

  void _addMarkers(List places) {
    ListMarker markers = places.map((place) {
      LatLng position = LatLng(
        place['geometry']['location']['lat'],
        place['geometry']['location']['lng'],
      );
      return Marker(
        markerId MarkerId(place['place_id']),
        position position,
        infoWindow InfoWindow(title place['name']),
      );
    }).toList();

    setState(() {
      _markers = markers;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar AppBar(
        title Text('Nearby Emergency Services'),
      ),
      body _currentLocation == null
           Center(child CircularProgressIndicator())
           GoogleMap(
              onMapCreated (controller) {
                mapController = controller;
              },
              initialCameraPosition CameraPosition(
                target _currentLocation!,
                zoom 14.0,
              ),
              markers Set.from(_markers),
              myLocationEnabled true,
              myLocationButtonEnabled true,
            ),
    );
  }
}