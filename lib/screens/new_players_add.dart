// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ionicons/ionicons.dart';
import 'package:sportz_app/bloc/bloc/add_new_player_bloc.dart';
import 'package:sportz_app/widgets/button.dart';
import 'package:sportz_app/widgets/login_card.dart';

class NewPlayerAddScreen extends StatefulWidget {
  const NewPlayerAddScreen({super.key});

  @override
  State<NewPlayerAddScreen> createState() => _NewPlayerAddScreenState();
}

class _NewPlayerAddScreenState extends State<NewPlayerAddScreen> {
  XFile? image;
  ImagePicker? imagePicker;
  TextEditingController nameController = TextEditingController();
  TextEditingController positionController = TextEditingController();
  List<String> skillList = ['Beginner', 'Intermediate', 'Professional'];
  String? selectedSkill = "Beginner";
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
    return BlocListener<AddNewPlayerBloc, AddNewPlayerState>(
      listener: (context, state) {
        if (state is AddNewPlayerSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Successfully added'),
            ),
          );
        } else if (state is AddNewPlayerFailure) {
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
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => {Navigator.of(context).pop()},
                        child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 8),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black12),
                                borderRadius: BorderRadius.circular(5)),
                            child: const Center(
                                child: Icon(Ionicons.chevron_back_outline,
                                    size: 22))),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      const Text(
                        "Add Player",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      )
                    ],
                  ),
                 
                  Padding(
                    padding: const EdgeInsets.only(top: 25),
                    child: Stack(
                      children: [
                        const CircleAvatar(
                          radius: 40,
                          backgroundImage:
                              AssetImage('assets/images/images (3).jpeg'),
                        ),
                        Positioned(
                          top: 55,
                          left: 50,
                          child: GestureDetector(
                              onTap: () {
                                modelBottomSheet1(context);
                              },
                              child: const Icon(Ionicons.camera_outline)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox( height: 20,),
                  LoginCard(
                      controller: nameController,
                      label: 'Name',
                      hint: 'Enter your name'),
                  const SizedBox(height: 20),
                  const Text(
                    'Team Skill',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 50,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: skillList.length,
                      itemBuilder: (context, index) {
                        return ChoiceChip(
                          backgroundColor:
                              const Color.fromARGB(255, 243, 243, 243),
                          selectedColor: const Color.fromARGB(0, 255, 255, 255),
                          selectedShadowColor:
                              const Color.fromARGB(255, 15, 177, 21),
                          showCheckmark: false,
                          padding: const EdgeInsets.all(5),
                          label: Text(skillList[index]),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: selectedSkill == skillList[index]
                                  ? const Color.fromARGB(255, 15, 177,
                                      21) // Green color when selected
                                  : Colors
                                      .transparent, // Transparent color when not selected
                              width: 1.0, // Border width
                            ),
                            borderRadius: BorderRadius.circular(
                                15.0), // Adjust the border radius as needed
                          ),
                          selected: selectedSkill == skillList[index],
                          onSelected: (value) {
                            setState(() {
                              selectedSkill = value ? skillList[index] : null;
                            });
                          },
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          width: 10,
                        );
                      },
                    ),
                  ),
                  LoginCard(
                      controller: positionController,
                      label: 'Position',
                      hint: 'Add your position here'),
                  const SizedBox(height: 20),
                  Button(
                    text: 'Save',
                    onClick: () {
                      context.read<AddNewPlayerBloc>().add(
                            AddNewPlayerProcess(
                                playerName: nameController.text,
                                playerPosition: positionController.text,
                               playerSkill: selectedSkill!,
                               playerPic:  File(image!.path),
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
