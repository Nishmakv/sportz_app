import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:sportz_app/bloc/bloc/get_user_turf_bloc.dart';
import 'package:sportz_app/model.dart/user_turf_model.dart';
import 'package:sportz_app/widgets/team_leaderboard_list_card.dart';
import 'package:sportz_app/widgets/slot.dart';
import 'package:sportz_app/widgets/turf_list_card.dart';
import 'package:sportz_app/widgets/weather.dart';

// ignore: must_be_immutable
class HomeTab extends StatefulWidget {
  PersistentTabController controller;
  HomeTab({super.key, required this.controller});
  @override
  State<HomeTab> createState() => _HomeTabState();
}
class _HomeTabState extends State<HomeTab> {
  List<UserTurfModel> userTurfModel = [];
  @override
  void initState() {
    super.initState();
    sendCurrentLocation();
  }

  void sendCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition();
    setState(() {});
    context.read<GetUserTurfBloc>().add(
          GetUserTurfProcess(
              longitude: position.longitude, latitude: position.latitude),
        );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            children: [
              const SizedBox(height: 10),
              const SlotScreen(),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Nearby Turfs',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      widget.controller.jumpToTab(1);
                    },
                    child: const Text(
                      'See All',
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 15),
              const TurfListCard(
                count: false,
              ),
              const WeatherWidget(),
              const SizedBox(height: 15),
              const LeaderboardListCard(),
              // const SizedBox(height: 50),
              // const PlayerLeaderboardListard(),
            ],
          ),
        ),
      ),
    );
  }
}
