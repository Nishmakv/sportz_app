import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:sportz_app/bloc/bloc/search_turf_name_bloc.dart';
import 'package:sportz_app/model.dart/search_turf_name_model.dart';
import 'package:sportz_app/screens/search_turf_list_screen.dart';
import 'package:sportz_app/widgets/button.dart';
import 'package:sportz_app/widgets/searc_turf_list_card.dart';

class SlotScreen extends StatefulWidget {
  const SlotScreen({super.key});

  @override
  State<SlotScreen> createState() => _SlotScreenState();
}

class _SlotScreenState extends State<SlotScreen> {
  TextEditingController nameController = TextEditingController();

  List<SearchTurfModel> searchTurfModel = [];
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Discover and',
          style: TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.w600,
              fontSize: width / 25),
        ),
        Text(
          "Play Now",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: width / 12),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 60,
          child: TextFormField(
            decoration: InputDecoration(
                fillColor: const Color.fromARGB(255, 249, 248, 248),
                filled: true,
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green)),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: Color.fromARGB(255, 244, 240, 240), width: 1),
                  borderRadius: BorderRadius.circular(7),
                ),
                prefixIcon:
                    const Icon(Ionicons.search_outline, color: Colors.green),
                contentPadding: const EdgeInsets.all(18),
                hintText: 'Search here'),
            controller: nameController,
          ),
        ),
        const SizedBox(height: 20),
        Button(
            text: 'Search',
            onClick: () {
              context.read<SearchTurfNameBloc>().add(
                    SearchTurfNameProcess(name: nameController.text),
                  );
              PersistentNavBarNavigator.pushNewScreen(context,
                  screen: SearchTurfListCard(), withNavBar: false);
            }),
      ],
    );
  }
}
