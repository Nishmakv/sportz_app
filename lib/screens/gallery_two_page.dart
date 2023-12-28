import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ionicons/ionicons.dart';
import 'package:sportz_app/bloc/bloc/gallery_bloc.dart';
import 'package:sportz_app/widgets/button.dart';
import 'package:sportz_app/widgets/login_card.dart';

class PhotoUploadingScreen extends StatefulWidget {
  const PhotoUploadingScreen({Key? key}) : super(key: key);

  @override
  State<PhotoUploadingScreen> createState() => _PhotoUploadingScreenState();
}

class _PhotoUploadingScreenState extends State<PhotoUploadingScreen> {
  XFile? image;
  ImagePicker? imagePicker;

  Future pickImage(String a) async {
    image = await ImagePicker().pickImage(
      source: a == "Gallery" ? ImageSource.gallery : ImageSource.camera,
    );
    setState(() {});
  }

  void modelBottomSheet1(context) {
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
    TextEditingController descriptionController = TextEditingController();
    return BlocListener<GalleryBloc, GalleryState>(
      listener: (context, state) {
        if (state is GallerySuccess) {
          Navigator.pop(context);
        }
        // else {
        //   ScaffoldMessenger.of(context).showSnackBar(
        //     const SnackBar(
        //       content: Text('Failed'),
        //     ),
        //   );
        // }
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Visibility(
                    visible: image != null,
                    child: SizedBox(
                      height: 250,
                      width: 350,
                      child: image != null
                          ? Image.file(
                              File(image!.path),
                              fit: BoxFit.cover,
                            )
                          : null,
                    ),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      if (image == null) {
                        modelBottomSheet1(context);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please select an image.'),
                          ),
                        );
                      }
                    },
                    child: Container(
                      height: 50,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color.fromARGB(78, 158, 158, 158),
                      ),
                      child: const Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 25),
                            child: Icon(Ionicons.add),
                          ),
                          SizedBox(width: 20),
                          Text('Add Image'),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  LoginCard(
                    controller: descriptionController,
                    label: 'Description',
                    hint: 'Add description here',
                  ),
                  const SizedBox(height: 50),
                  Button(
                    text: 'Save',
                    onClick: () {
                      context.read<GalleryBloc>().add(
                            AddImageProcess(
                              image: File(image!.path),
                              description: descriptionController.text,
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
