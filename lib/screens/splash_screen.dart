import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sportz_app/screens/home.dart';
import 'package:sportz_app/screens/location_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    gotoHome(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: Image.asset(
                'assets/images/1700474236855.948.jpg',
                width: 250,
                height: 250,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: Column(
              children: [
                const Text(
                  "from",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: Color.fromARGB(255, 147, 146, 141)),
                ),
                const SizedBox(
                  height: 10,
                ),
                Image.asset(
                  'assets/images/rgc-log.png',
                  width: 150,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<void> gotoHome(BuildContext ctx) async {
    await Future.delayed(
      const Duration(seconds: 1),
    );
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (ctx) => const LocationScreen(),
        ),
      );
    } else {
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (ctx1) => const HomeScreen(),
        ),
      );
    }
  }
}
