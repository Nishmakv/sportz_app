// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:ionicons/ionicons.dart';
// import 'package:sportz_app/bloc/bloc/create_team_bloc.dart';
// import 'package:sportz_app/screens/add_players.dart';
// import 'package:sportz_app/widgets/button.dart';
// import 'package:sportz_app/widgets/login_card.dart';

// class TeamHostScreen extends StatefulWidget {
//   const TeamHostScreen({Key? key}) : super(key: key);

//   @override
//   State<TeamHostScreen> createState() => _TeamHostScreenState();
// }

// class _TeamHostScreenState extends State<TeamHostScreen> {
//   TextEditingController nameController = TextEditingController();
//   TextEditingController strengthController = TextEditingController();
//   TextEditingController managerController = TextEditingController();
//   XFile? image;
//   ImagePicker? imagePicker;
//   List<String> skillList = ['Beginner', 'Intermediate', 'Professional'];
//   String? selectedSkill = "Beginner";

//   Future pickImage(String a) async {
//     image = await ImagePicker().pickImage(
//         source: a == "Gallery" ? ImageSource.gallery : ImageSource.camera);
//     setState(() {});
//   }

//   void modelBottomSheet(context) {
//     showModalBottomSheet(
//       context: context,
//       builder: (BuildContext ctx) {
//         return Container(
//           child: Column(
//             children: [
//               ListTile(
//                 leading: const Icon(Icons.photo_camera),
//                 title: const Text('Camera'),
//                 onTap: () {
//                   pickImage('Camera');
//                   Navigator.pop(context);
//                 },
//               ),
//               ListTile(
//                 leading: const Icon(Icons.photo),
//                 title: const Text('Gallery'),
//                 onTap: () {
//                   Navigator.pop(context);
//                   pickImage('Gallery');
//                 },
//               )
//             ],
//           ),
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocListener<CreateTeamBloc, CreateTeamState>(
//       listener: (context, state) {
//         if (state is CreateTeamSuccess) {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (ctx) => const AddPlayersScreen(),
//             ),
//           );
//         } else if (state is CreateTeamFailure) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(
//               content: Text('Failed'),
//             ),
//           );
//         }
//       },
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.white,
//           elevation: 0,
//           leading: GestureDetector(
//             onTap: () {
//               Navigator.pop(context);
//             },
//             child: const Icon(
//               Ionicons.arrow_back,
//               color: Colors.black,
//             ),
//           ),
//           title: const Text(
//             'Team Host',
//             style: TextStyle(
//               color: Colors.black,
//             ),
//           ),
//         ),
//         body: SafeArea(
//           child: Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Text(
//                   'Create your team',
//                   style: TextStyle(
//                     fontWeight: FontWeight.w600,
//                     fontSize: 16,
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 Row(
//                   children: [
//                     Stack(
//                       children: [
//                         const CircleAvatar(
//                           radius: 40,
//                           backgroundImage:
//                               AssetImage('assets/images/Ellipse 841.png'),
//                         ),
//                         Positioned(
//                           left: 50,
//                           top: 50,
//                           child: GestureDetector(
//                             onTap: () {
//                               modelBottomSheet(context);
//                             },
//                             child: const Icon(
//                               Ionicons.camera,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     Expanded(
//                       child: LoginCard(
//                           controller: nameController,
//                           label: 'Name',
//                           hint: 'Team Name'),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 15),
//                 const Text(
//                   'Team Skill',
//                   style: TextStyle(
//                     fontWeight: FontWeight.w600,
//                     fontSize: 16,
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 Row(
//                   children: skillList.map((skillLevel) {
//                     return ChoiceChip(
//                       padding: const EdgeInsets.all(1),
//                       label: Text(skillLevel),
//                       selected: selectedSkill == skillLevel,
//                       onSelected: (value) {
//                         setState(() {
//                           selectedSkill = value ? skillLevel : null;
//                         });
//                       },
//                     );
//                   }).toList(),
//                 ),
//                 LoginCard(
//                     controller: strengthController,
//                     label: 'Team Strength',
//                     hint: 'Add team strength here'),
//                 const SizedBox(height: 10),
//                 Button(
//                   text: 'Create Team',
//                   onClick: () {
//                     context.read<CreateTeamBloc>().add(
//                           AddTeamProcess(
//                             longitude: 20,
//                             latitude: 20,
//                             name: nameController.text,
//                             skill: selectedSkill!,
//                             image: File(image!.path),
//                             strength: strengthController.text,
//                             manager: managerController.text,
//                           ),
//                         );
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
