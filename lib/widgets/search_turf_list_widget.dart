import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:sportz_app/bloc/bloc/search_turf_name_bloc.dart';
import 'package:sportz_app/model.dart/search_turf_name_model.dart';
import 'package:sportz_app/screens/turf_detail_screen.dart';

// ignore: must_be_immutable
class SearchTurfListWidget extends StatefulWidget {
  int id;
  String location;
  String name;
  List amenities;
  double price;
  String image;
  String description;
  double rating;

  SearchTurfListWidget(
      {super.key,
      required this.id,
      required this.location,
      required this.name,
      required this.rating,
      required this.amenities,
      required this.price,
      required this.image,
      required this.description});

  @override
  State<SearchTurfListWidget> createState() => _SearchTurfListWidgetState();
}

class _SearchTurfListWidgetState extends State<SearchTurfListWidget> {
  @override
  Widget build(BuildContext context) {
    List<SearchTurfModel> searchTurfModel = [];
    return GestureDetector(
      onTap: () {
        PersistentNavBarNavigator.pushNewScreen(context,
            screen: TurfDetailScreen(
              rating: widget.rating,
              id: widget.id,
              location: widget.location,
              name: widget.name,
              amenities: widget.amenities,
              price: widget.price,
              image: widget.image,
              description: widget.description,
            ),
            withNavBar: false);
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Container(
          width: 300,
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
                  width: 280,
                  height: 150,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      widget.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.w800, color: Colors.black),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Ionicons.star,
                          color: Color.fromARGB(255, 255, 230, 0),
                          size: 15,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          widget.rating.toString(),
                          style: const TextStyle(
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
                    Text(
                      widget.location,
                      style: const TextStyle(
                          color: Colors.black38, fontWeight: FontWeight.w700),
                    ),
                    Text(
                      '₹${widget.price}',
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
