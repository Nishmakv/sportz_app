import 'package:flutter/material.dart';
import 'package:sportz_app/widgets/login_card.dart';

// ignore: must_be_immutable
class UpdateTurfScreen extends StatefulWidget {
  int? id;
  String name;
  String? location;
  List? amenities;
  String? description;
  String? price;
  String? image;

  UpdateTurfScreen(
      {super.key,
      required this.id,
      required this.name,
      required this.location,
      required this.amenities,
      required this.description,
      required this.image,
      required this.price});
  @override
  State<UpdateTurfScreen> createState() => _UpdateTurfScreenState();
}

class _UpdateTurfScreenState extends State<UpdateTurfScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            LoginCard(
              controller: nameController,
              label: 'name',
              hint: 'name',
            ),
            SizedBox(height: 10),
            // LoginCard(
            //     controller: priceController, label: 'Price', hint: 'Price',  initialValue: widget.price),
            SizedBox(height: 10),
            LoginCard(
                controller: descriptionController,
                label: 'description',
                hint: 'description'),
            SizedBox(height: 10),
            LoginCard(
                controller: locationController,
                label: 'location',
                hint: 'location'),
          ],
        ),
      ),
    );
  }
}
