import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sportz_app/screens/home.dart';
import 'package:sportz_app/widgets/button.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(
                        top: 50,
                      ),
                      child: Text(
                        'Whats your location?',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'We need your location to show available turfs and players',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 50),
                    SizedBox(
                      child: Image.asset(
                        'assets/images/_b60e786a-9415-413f-a083-8d3aeb25db46.jpeg.jpg',
                        width: 400,
                      ),
                    ),
                    
                  ],
                ),
                ),
                Button(
                  text: 'Allow location access',
                  onClick: () {
                    getLocation(context);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future getLocation(BuildContext context) async {
    LocationPermission permission = await Geolocator.checkPermission();
    permission = await Geolocator.requestPermission();

    if (permission == LocationPermission.denied) {
      print('Location permission denied');
    } else {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (ctx) => HomeScreen(),
        ),
      );
    }
  }
}