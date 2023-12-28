import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ionicons/ionicons.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sportz_app/bloc/bloc/user_profile_bloc.dart';
import 'package:sportz_app/model.dart/profile_model.dart';
import 'package:sportz_app/screens/booking_history_screen.dart';
import 'package:sportz_app/screens/home.dart';
import 'package:sportz_app/screens/profile_edit_screen.dart';
import 'package:sportz_app/utils/shared_preference.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  XFile? image;
  SharedPrefs sharedPrefs = SharedPrefs();

  UserProfileModel? userProfileModel;

  @override
  void initState() {
    super.initState();
    context.read<UserProfileBloc>().add(
          const UserProfileProcess(),
        );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    void showLogOutDialogue(BuildContext context) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Logout'),
            content: const Text('Are you sure?'),
            actions: [
              TextButton(
                onPressed: () {
                  sharedPrefs.saveToken('userToken', '');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (ctx) => const HomeScreen(),
                    ),
                  );
                },
                child: const Text('Yes'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('No'),
              ),
            ],
          );
        },
      );
    }

    return BlocListener<UserProfileBloc, UserProfileState>(
      listener: (context, state) {
        if (state is UserProfileSuccess) {
          userProfileModel = state.userProfileModel;
          setState(() {});
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
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
                      "Profile",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                BlocBuilder<UserProfileBloc, UserProfileState>(
                  builder: (context, state) {
                    if (state is UserProfileLoading) {
                      return Shimmer.fromColors(
                        baseColor: const Color.fromARGB(31, 220, 217, 217),
                        highlightColor: Colors.white,
                        child: Column(
                          children: [
                            Container(
                              width: double.infinity,
                              height: 80,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                    return Container(
                        padding: const EdgeInsets.all(15),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: const Color.fromARGB(49, 145, 145, 145),
                          ),
                        ),
                        child: Row(
                          children: [
                            Column(
                              children: [
                                CircleAvatar(
                                  radius: 30,
                                  backgroundImage: image != null
                                      ? FileImage(File(image!.path))
                                          as ImageProvider // Use FileImage for local files
                                      : const AssetImage(
                                          'assets/images/images (3).jpeg'),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  userProfileModel?.email ?? '',
                                  style: TextStyle(
                                      fontSize: width * 0.05,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                Text(
                                  userProfileModel?.phoneNo ?? '',
                                ),
                                const SizedBox(height: 3),
                                GestureDetector(
                                  onTap: () {
                                    PersistentNavBarNavigator.pushNewScreen(
                                      context,
                                      screen: ProfileEditScreen(
                                        name:
                                            userProfileModel?.profileName ?? '',
                                        email: userProfileModel?.email ?? '',
                                        phoneNumber:
                                            userProfileModel?.phoneNo ?? '',
                                      ),
                                    );
                                  },
                                  child: const Row(
                                    children: [
                                      Text(
                                        'Edit Profile',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.green),
                                      ),
                                      Icon(
                                        Ionicons.chevron_forward,
                                        size: 15,
                                        color: Colors.green,
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ));
                  },
                ),
                const SizedBox(height: 10),
                Container(
                  width: 350,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: const Color.fromARGB(49, 145, 145, 145),
                    ),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: 15),
                      const Icon(Ionicons.cart_outline),
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          PersistentNavBarNavigator.pushNewScreen(
                            context,
                            screen: const BookingHistory(),
                          );
                        },
                        child: Text(
                          'Your Bookings',
                          style: TextStyle(
                              fontSize: width * 0.04,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    showLogOutDialogue(context);
                  },
                  child: Container(
                    width: 350,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: const Color.fromARGB(49, 145, 145, 145),
                      ),
                    ),
                    child: Row(
                      children: [
                        const SizedBox(width: 15),
                        const Icon(Ionicons.settings_outline),
                        const SizedBox(width: 10),
                        Text(
                          'Logout',
                          style: TextStyle(
                              fontSize: width * 0.04,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
