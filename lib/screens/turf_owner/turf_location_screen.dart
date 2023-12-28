import 'dart:async';

import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:ionicons/ionicons.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:sportz_app/screens/turf_owner/turf_add_screen.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  double? longitude;
  double? latitude;
  bool isLoading = true;
  Completer<GoogleMapController> _controller = Completer<GoogleMapController>();
  Future currentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      print('error');
    }
    LocationPermission permission = await Geolocator.checkPermission();
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      print("denied aan");
    }
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    setState(() {
      longitude = position.longitude;
      latitude = position.latitude;
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    currentLocation();
  }

  @override
  void dispose() {
    _controller = Completer<GoogleMapController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : SizedBox(
                width: 500,
                height: 800,
                child: GoogleMap(
                  mapType: MapType.normal,
                  initialCameraPosition: CameraPosition(
                    target: LatLng(latitude ?? 11, longitude ?? 76),
                  ),
                  markers: {
                    Marker(
                      markerId: const MarkerId('_current location'),
                      icon: BitmapDescriptor.defaultMarker,
                      position: LatLng(latitude ?? 148, longitude ?? 148),
                      onDrag: (value) => setState(() {
                        longitude = value.longitude;
                        latitude = value.latitude;
                      }),
                    ),
                  },
                ),
              ),

      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
          PersistentNavBarNavigator.pushNewScreen(
                        context,
                        screen:  TurfAddScreen(longitude: longitude!,latitude: latitude!,),
                        withNavBar: false,
                        pageTransitionAnimation:
                            PageTransitionAnimation.cupertino,
          
                      );     
         
      },
      child: const Icon(Ionicons.checkmark_outline,color: Colors.white,),
      backgroundColor: const Color.fromARGB(255, 15, 177, 21),
      ),
    );
  }
}
