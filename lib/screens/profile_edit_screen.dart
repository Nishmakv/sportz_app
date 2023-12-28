import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ionicons/ionicons.dart';
import 'package:sportz_app/bloc/bloc/profille_edit_bloc.dart';
import 'package:sportz_app/bloc/bloc/user_profile_bloc.dart';
import 'package:sportz_app/widgets/button.dart';
import 'package:sportz_app/widgets/login_card.dart';

class ProfileEditScreen extends StatefulWidget {
  final String name;
  final String email;
  final String phoneNumber;

  const ProfileEditScreen(
      {super.key,
      required this.name,
      required this.email,
      required this.phoneNumber});

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  XFile? image;
  ImagePicker? imagePicker;
  Future pickImage(String a) async {
    image = await ImagePicker().pickImage(
        source: a == "Gallery" ? ImageSource.gallery : ImageSource.camera);
    setState(() {});
  }

  void modelBottomSheet(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext ctx) {
        return Column(
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
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.name);
    phoneNumberController = TextEditingController(text: widget.phoneNumber);
    emailController = TextEditingController(text: widget.email);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfilleEditBloc, ProfilleEditState>(
      listener: (context, state) {
        if (state is ProfilleEditSuccess) {
          Navigator.pop(context);
          context.read<UserProfileBloc>().add(
                const UserProfileProcess(),
              );
        } else if (state is ProfilleEditFailure) {
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
                      "Edit Profile",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    )
                  ],
                ),
                const SizedBox(height: 15,),
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: image != null
                          ? FileImage(File(image!.path))
                              as ImageProvider // Use FileImage for local files
                          : const AssetImage('assets/images/images (3).jpeg'),
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
                LoginCard(
                    controller: nameController,
                    label: 'Name',
                    hint: 'Edit your name'),
                LoginCard(
                    controller: emailController,
                    label: 'Email',
                    hint: 'Edit your email'),
                LoginCard(
                    controller: phoneNumberController,
                    label: 'Phone No',
                    hint: 'Edit your phone_no'),
                const SizedBox(height: 30),
                Button(
                  text: 'Save',
                  onClick: () {
                    context.read<ProfilleEditBloc>().add(
                          ProfilleEditProcess(
                              image: File(image!.path),
                              name: nameController.text,
                              email: emailController.text,
                              phoneNumber: phoneNumberController.text),
                        );
                  },
                )
              ],
            ),
          ),
        )),
      ),
    );
  }
}
