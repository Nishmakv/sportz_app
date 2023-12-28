import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sportz_app/bloc/bloc/bloc/add_turf_bloc.dart';
import 'package:sportz_app/screens/turf_owner/turf_owner_home_screen.dart';
import 'package:sportz_app/widgets/button.dart';
import 'package:sportz_app/widgets/login_card.dart';

// ignore: must_be_immutable
class TurfAddScreen extends StatefulWidget {
  double longitude;
  double latitude;
  TurfAddScreen({super.key, required this.longitude, required this.latitude});

  @override
  State<TurfAddScreen> createState() => _TurfAddScreenState();
}

class _TurfAddScreenState extends State<TurfAddScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  XFile? image;
  ImagePicker? imagePicker;
  List listAmenities = [];
  bool isChecked = false;
  bool isChecked1 = false;
  bool isChecked2 = false;
  bool isChecked3 = false;
  bool isChecked4 = false;
  bool isChecked5 = false;

  Future pickImage(String a) async {
    image = await ImagePicker().pickImage(
        source: a == "Gallery" ? ImageSource.gallery : ImageSource.camera);
    setState(() {});
  }

  void modelBottomSheet(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext ctx) {
        return Container(
          child: Column(
            children: [
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Camera'),
                onTap: () {
                  pickImage('Camera');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo),
                title: const Text('Gallery'),
                onTap: () {
                  Navigator.pop(context);
                  pickImage('Gallery');
                },
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddTurfBloc, AddTurfState>(
      listener: (context, state) {
        if (state is AddTurfSuccess) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (ctx) => const TurfOwnerHome(),
            ),
          );
        } else if (state is AddTurfFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Failed'),
            ),
          );
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Card(
                    child: Container(
                      height: 60,
                      width: 250,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: const Center(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  LoginCard(
                      controller: nameController,
                      label: 'Name',
                      hint: 'Enter name of your turf'),
                  LoginCard(
                      controller: priceController,
                      label: 'Price',
                      hint: 'Enter price here'),
                  LoginCard(
                      controller: locationController,
                      label: 'Location',
                      hint: 'location'),
                  Visibility(
                    visible: image != null,
                    child: SizedBox(
                        height: 250,
                        width: 400,
                        child: image != null
                            ? Image.file(
                                File(image!.path),
                              )
                            : null),
                  ),
                  const SizedBox(height: 20),
                  Button(
                    text: 'Upload Image',
                    onClick: () {
                      modelBottomSheet(context);
                    },
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: isChecked,
                        onChanged: (value) {
                          setState(
                            () {
                              isChecked = !isChecked;
                              if (isChecked) {
                                listAmenities.add('wifi');
                              }
                            },
                          );
                        },
                      ),
                      const Text('Wifi'),
                      Checkbox(
                        value: isChecked5,
                        onChanged: (value) {
                          setState(
                            () {
                              listAmenities.add(value);
                            },
                          );
                        },
                      ),
                      const Text('WashRoom'),
                      Checkbox(
                        value: isChecked1,
                        onChanged: (value) {
                          setState(
                            () {
                              listAmenities.add(value);
                            },
                          );
                        },
                      ),
                      const Text('Parking'),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: isChecked2,
                        onChanged: (value) {
                          setState(
                            () {
                              listAmenities.add(value);
                            },
                          );
                        },
                      ),
                      const Text('DressingRoom'),
                      Checkbox(
                        value: isChecked3,
                        onChanged: (value) {
                          setState(
                            () {
                              listAmenities.add(value);
                            },
                          );
                        },
                      ),
                      const Text('Gallery'),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: isChecked4,
                        onChanged: (value) {
                          setState(
                            () {
                              listAmenities.add(value);
                            },
                          );
                        },
                      ),
                      const Text('Water'),
                    ],
                  ),
                  LoginCard(
                      controller: descriptionController,
                      label: 'Description',
                      hint: 'Enter description here'),
                  const SizedBox(height: 20),
                  Button(
                    text: 'Save',
                    onClick: () {
                      context.read<AddTurfBloc>().add(
                            AddTurfProcess(
                              longitude: widget.longitude,
                              latitude: widget.latitude,
                              name: nameController.text,
                              price: priceController.text,
                              image: File(image!.path),
                              amenities: listAmenities,
                              description: descriptionController.text,
                              location: locationController.text,
                            ),
                          );
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
