import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ionicons/ionicons.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:sportz_app/bloc/bloc/create_team_bloc.dart';
import 'package:sportz_app/model.dart/team_id_model.dart';
import 'package:sportz_app/screens/add_players.dart';

import 'package:sportz_app/widgets/button.dart';
import 'package:sportz_app/widgets/login_card.dart';

class TeamHostScreen extends StatefulWidget {
  const TeamHostScreen({Key? key}) : super(key: key);

  @override
  State<TeamHostScreen> createState() => _TeamHostScreenState();
}

class _TeamHostScreenState extends State<TeamHostScreen> {
  TeamById? teamById;
  TextEditingController nameController = TextEditingController();
  TextEditingController strengthController = TextEditingController();
  XFile? image;
  ImagePicker? imagePicker;
  List<String> skillList = ['Beginner', 'Intermediate', 'Professional'];
  String? selectedSkill = "Beginner";

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
    return BlocListener<CreateTeamBloc, CreateTeamState>(
      listener: (context, state) {
        if (state is CreateTeamSuccess) {
          teamById = state.teamById;

          if (teamById != null) {
            PersistentNavBarNavigator.pushNewScreen(
              context,
             
              screen: AddPlayersScreen(
                  id: teamById!.id, teamStrength: teamById!.teamStrength),
              pageTransitionAnimation: PageTransitionAnimation.cupertino,
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Failed'),
              ),
            );
          }
        } else if (state is CreateTeamFailure) {
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
                        "Create your team",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Stack(
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundImage: image != null
                                ? FileImage(File(image!.path))
                                    as ImageProvider // Use FileImage for local files
                                : const AssetImage(
                                    'assets/images/images (3).jpeg'),
                          ),
                          Positioned(
                            right: 0,
                            top: 50,
                            child: GestureDetector(
                              onTap: () {
                                modelBottomSheet(context);
                              },
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(20)),
                                child: const Icon(
                                  Ionicons.camera_outline,
                                  size: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: LoginCard(
                            controller: nameController,
                            label: 'Name',
                            hint: 'Team Name'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  const Text(
                    'Team Skill',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 5),
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
                      controller: strengthController,
                      isNumeric: true,
                      label: 'Team Strength',
                      hint: 'Add team strength here'),
                  const SizedBox(height: 20),
                  Button(
                    text: 'Create Team',
                    onClick: () {
                      context.read<CreateTeamBloc>().add(
                            AddTeamProcess(
                              longitude: 20,
                              latitude: 20,
                              name: nameController.text,
                              skill: selectedSkill!,
                              image: File(image!.path),
                              strength: int.parse(strengthController.text),
                            ),
                          );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
