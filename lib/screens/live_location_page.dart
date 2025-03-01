import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';

class LiveLocationPage extends StatefulWidget {
  const LiveLocationPage({super.key});

  @override
  _LiveLocationPageState createState() => _LiveLocationPageState();
}

class _LiveLocationPageState extends State<LiveLocationPage> {
  late GoogleMapController _mapController; // Keep this if you plan to use it later
  LatLng _currentLocation = const LatLng(0, 0);
  LatLng _busLocation = const LatLng(37.7749, -122.4194); // Dummy bus location
  final Set<Marker> _markers = {};
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
    _startTrackingBus();
  }

  /// Get Student's Current Location
  Future<void> _getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled, handle accordingly
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, handle accordingly
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are permanently denied, handle accordingly
      return;
    }

    // Use LocationSettings instead of desiredAccuracy
    Position position = await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high, // Set the desired accuracy
      ),
    );

    setState(() {
      _currentLocation = LatLng(position.latitude, position.longitude);
      _updateMarkers();
    });
  }

  /// Simulate Real-Time Bus Location Update
  void _startTrackingBus() {
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      setState(() {
        _busLocation = LatLng(
          _busLocation.latitude + 0.001, // Simulating movement
          _busLocation.longitude + 0.001,
        );
        _updateMarkers();
      });
    });
  }

  /// Update Markers on Map
  void _updateMarkers() {
    _markers.clear();
    _markers.add(
      Marker(
        markerId: const MarkerId('currentLocation'),
        position: _currentLocation,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        infoWindow: const InfoWindow(title: "You"),
      ),
    );
    _markers.add(
      Marker(
        markerId: const MarkerId('busLocation'),
        position: _busLocation,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        infoWindow: const InfoWindow(title: "Bus"),
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    _mapController.dispose(); // Dispose the map controller if you're using it
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Live Bus Tracking")),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: _currentLocation,
          zoom: 14,
        ),
        markers: _markers,
        onMapCreated: (GoogleMapController controller) {
          _mapController = controller;
          // Example: Use the controller to animate the camera
          _mapController.animateCamera(
            CameraUpdate.newLatLng(_currentLocation),
          );
        },
      ),
    );
  }
}