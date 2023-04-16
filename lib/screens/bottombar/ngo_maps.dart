import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class NgoMaps extends StatefulWidget {
  const NgoMaps({Key? key}) : super(key: key);

  @override
  State<NgoMaps> createState() => _NgoMapsState();
}

class _NgoMapsState extends State<NgoMaps> {
  GoogleMapController? _controller;
  LatLng center = const LatLng(13.016031, 74.792253);
  final Set<Marker> _markers = {
    Marker(
      markerId: MarkerId('Prashyara Wellfare Foundation'),
      position: LatLng(13.013906, 74.793632),
      infoWindow: InfoWindow(title: 'Prashyara Wellfare Foundation'),
    ),
    Marker(
      markerId: MarkerId('Satyajith Surathkal Home'),
      position: LatLng(12.997263, 74.800514),
      infoWindow: InfoWindow(title: 'Satyajith Surathkal Home'),
    ),
    Marker(
      markerId: MarkerId('Surathkal Railway Station'),
      position: LatLng(13.022502, 74.802058),
      infoWindow: InfoWindow(title: 'Surathkal Railway Station'),
    ),
    Marker(
      markerId: MarkerId('Chiranthana Environment NGO'),
      position: LatLng(12.990287, 74.803106),
      infoWindow: InfoWindow(title: 'Chiranthana Environment NGO'),
    ),
    Marker(
      markerId: MarkerId('Jagruthi Environment Society'),
      position: LatLng(12.965018, 74.805905),
      infoWindow: InfoWindow(title: 'Jagruthi Environment Society'),
    ),
  };
  Location currentLocation = Location();

  void getLocation() async {
    currentLocation.onLocationChanged.listen((LocationData loc) {
      _controller?.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(loc.latitude ?? 0.0, loc.longitude ?? 0.0),
        zoom: 12.0,
      )));
      setState(() {
        _markers.add(
          Marker(
            draggable: true,
            flat: true,
            infoWindow: const InfoWindow(title: 'Your Current Location'),
            markerId: const MarkerId('Home'),
            position: LatLng(loc.latitude ?? 0.0, loc.longitude ?? 0.0),
          ),
        );
      });
    });
  }

  @override
  void initState() {
    getLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: GoogleMap(
          markers: _markers,
          onMapCreated: (GoogleMapController controller) {
            _controller = controller;
          },
          initialCameraPosition: CameraPosition(
            target: center,
            zoom: 14.0,
          ),
        ),
      ),
    );
  }
}
