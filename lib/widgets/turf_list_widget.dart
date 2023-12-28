// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:sportz_app/screens/turf_detail_screen.dart';

// ignore: must_be_immutable
class TurfListWidget extends StatelessWidget {
  int id;
  String location;
  String name;
  List amenities;
  double price;
  String image;
  String description;
  bool fullWidth;
  double rating;

  TurfListWidget(
      {super.key,
      required this.id,
      required this.location,
      required this.name,
      required this.amenities,
      required this.price,
      required this.image,
      required this.description,
      required this.rating,
      this.fullWidth = false});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        PersistentNavBarNavigator.pushNewScreen(context,
            screen: TurfDetailScreen(
              rating: rating,
              id: id,
              location: location,
              name: name,
              amenities: amenities,
              price: price,
              image: image,
              description: description,
            ),
            withNavBar: false);
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Container(
          width: fullWidth ? double.infinity : 300,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.038),
                blurRadius: 12,
              ),
            ],
            border: Border.all(
              color: const Color.fromARGB(19, 145, 145, 145),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                SizedBox(
                  width: fullWidth ? double.infinity : 280,
                  height: 150,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                          fontWeight: FontWeight.w800, color: Colors.black),
                    ),
                     Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Ionicons.star,
                          color: Color.fromARGB(255, 255, 230, 0),
                          size: 15,
                        ),
                        SizedBox(width: 5),
                        Text(
                          rating.toString(),
                          style: TextStyle(
                              color: Colors.black38,
                              fontSize: 12,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: width / 2.5,
                      child: Text(
                        location,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            color: Colors.black38, fontWeight: FontWeight.w700),
                      ),
                    ),
                    Text(
                      '₹$price',
                      style: const TextStyle(
                          color: Color.fromARGB(255, 15, 177, 21),
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

