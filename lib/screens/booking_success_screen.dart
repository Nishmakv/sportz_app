import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class BookingSuccessScreen extends StatelessWidget {
  const BookingSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
              child: Center(
                  child: Column(
            children: [
              Lottie.asset('assets/animations/Success.json'),
              const SizedBox(
                height: 25,
              ),
              const Text('Booking successfully completed'),
            ],
          ))),
        ],
      )),
    );
  }
}
