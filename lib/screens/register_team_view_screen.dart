import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:sportz_app/bloc/bloc/get_players_bloc.dart';
import 'package:sportz_app/model.dart/register_team_view.dart';
import 'package:sportz_app/screens/team_screen.dart';
import 'package:sportz_app/widgets/team_list_card.dart';

class TeamListScreen extends StatefulWidget {
  const TeamListScreen({super.key});

  @override
  State<TeamListScreen> createState() => _TeamListScreenState();
}

class _TeamListScreenState extends State<TeamListScreen> {
  List<RegisterTeamViewModel> registerTeamView = [];
  @override
  void initState() {
    super.initState();
    context.read<GetPlayersBloc>().add(
          const GetPlayersProcess(),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<GetPlayersBloc, GetPlayersState>(
      listener: (context, state) {
        if (state is GetPlayersSuccess) {
          registerTeamView.addAll(state.registerTeamView);
        }
      },
      child: Scaffold(
        
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      PersistentNavBarNavigator.pushNewScreen(
                          context,
                          screen: const TeamHostScreen(),
                          withNavBar: false,
                          pageTransitionAnimation:
                              PageTransitionAnimation.cupertino,
                        );
                    },
                    child:  Container(
                      color : const Color.fromARGB(255, 245, 242, 242),
                      width: double.infinity,
                      height: 50,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Ionicons.add),
                          Text(
                            'Create Team',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  const TeamListCard(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}