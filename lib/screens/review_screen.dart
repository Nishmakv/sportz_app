import 'package:flutter/material.dart';
import 'package:sportz_app/widgets/button.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Havent played in this Ground?',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Sorry! You are not allowed to review the ground since you',
                style: TextStyle(
                  fontSize: 12,
                  color: Color.fromARGB(109, 0, 0, 0),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  'havent booked throung sportzapp',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color.fromARGB(109, 0, 0, 0),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Button(
                text: 'Book Now',
                onClick: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (ctx) =>  BookingScreen(id: ,),
                  //   ),
                  // );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
