import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:sportz_app/screens/booking_screen.dart';
import 'package:sportz_app/screens/login_screen.dart';
import 'package:sportz_app/screens/review_screen.dart';
import 'package:sportz_app/utils/shared_preference.dart';
import 'package:sportz_app/widgets/amenities_list.dart';
import 'package:sportz_app/widgets/button.dart';

// ignore: must_be_immutable
class TurfDetailScreen extends StatefulWidget {
  int id;
  String location;
  String name;
  List amenities;
  double price;
  double rating;
  String image;
  String description;
  TurfDetailScreen(
      {super.key,
      required this.id,
      required this.location,
      required this.name,
      required this.amenities,
      required this.price,
       required this.rating,
      required this.image,
      required this.description});

  @override
  State<TurfDetailScreen> createState() => _TurfDetailScreenState();
}

class _TurfDetailScreenState extends State<TurfDetailScreen> {
  String token = '';
  @override
  void initState() {
    super.initState();
    getToken();
  }

  void getToken() async {
    SharedPrefs sharedPrefs = SharedPrefs();
    token = await sharedPrefs.getToken('userToken');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 100),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 300,
                      padding: const EdgeInsets.all(10),
                      child: Stack(
                        children: [
                          SizedBox(
                            height: 300,
                            width: double.infinity,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.network(widget.image,
                                  fit: BoxFit.cover),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white24,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                width: 50,
                                height: 50,
                                child: const Icon(
                                  Ionicons.arrow_back,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.name,
                                    style: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    children: [
                                      const Icon(
                                        Ionicons.location,
                                        size: 20,
                                        color: Color.fromARGB(255, 15, 177, 21),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        widget.location,
                                        style: const TextStyle(
                                            color: Colors.black54),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 20,),
                          Row(
                            children: [
                              Text(
                                '₹${widget.price}',
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 15, 177, 21),
                                ),
                              ),
                              const Text(
                                " / hour",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 25),
                          const Text(
                            'Description',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Text(
                              widget.description,
                              style: const TextStyle(
                                  fontSize: 15, color: Colors.black54),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            'Amenities',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            ),
                          ),
                          AmenitiesListCard(amenities: widget.amenities),
                          // Column(
                          //   crossAxisAlignment: CrossAxisAlignment.start,
                          //   children: [
                          //     GestureDetector(
                          //       onTap: () {
                          //         Navigator.push(
                          //           context,
                          //           MaterialPageRoute(
                          //             builder: (ctx) => const ReviewScreen(),
                          //           ),
                          //         );
                          //       },
                          //       child: Container(
                          //         height: 40,
                          //         width: 150,
                          //         decoration: BoxDecoration(
                          //           color: Colors.white,
                          //           borderRadius: BorderRadius.circular(8),
                          //           border: Border.all(
                          //             color: const Color.fromARGB(51, 0, 0, 0),
                          //           ),
                          //         ),
                          //         child: const Center(
                          //           child: Text(
                          //             'Review Ground',
                          //             style: TextStyle(
                          //               color: Colors.green,
                          //             ),
                          //           ),
                          //         ),
                          //       ),
                          //     ),
                          //   ],
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Button(
                    onClick: () {
                      if (token.isNotEmpty) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (ctx) => BookingScreen(id: widget.id),
                          ),
                        );
                      } else {
                        PersistentNavBarNavigator.pushNewScreen(
                          context,
                          screen: const LoginScreen(),
                          pageTransitionAnimation:
                              PageTransitionAnimation.cupertino,
                        );
                      }
                    },
                    text: "Book Now",
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
