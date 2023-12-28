import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:sportz_app/screens/turf_owner/turf_location_screen.dart';

class MapTouchScreen extends StatelessWidget {
  const MapTouchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Card(
                child: Container(
                  height: 70,
                  width: 300,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (ctx) => MapScreen(),
                              ),
                            );
                          },
                          child: Icon(Ionicons.pin)),
                      Center(
                        child: Text('Add your location'),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
