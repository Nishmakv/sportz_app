import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:sportz_app/bloc/bloc/get_players_bloc.dart';
import 'package:sportz_app/model.dart/register_team_view.dart';
import 'package:sportz_app/screens/add_players.dart';
import 'package:sportz_app/widgets/team_list_widget.dart';

class TeamListCard extends StatefulWidget {
  const TeamListCard({super.key});

  @override
  State<TeamListCard> createState() => _TeamListCardState();
}

class _TeamListCardState extends State<TeamListCard> {
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
          setState(() {});
        }
      },
      child: registerTeamView.isNotEmpty
          ? ListView.separated(
              primary: false,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    PersistentNavBarNavigator.pushNewScreen(context,
                          screen: AddPlayersScreen(
                          id: registerTeamView[index].id,
                          teamStrength: registerTeamView[index].teamStrength,
                        ),
                          withNavBar: false,
                          pageTransitionAnimation:
                              PageTransitionAnimation.cupertino);
                    
                  },
                  child: TeamListWidget(
                    teamName: registerTeamView[index].teamName,
                    teamPic:
                       
                        'http://13.126.57.93:8000/${registerTeamView[index].teamPic ?? ''}',
                    teamSkill: registerTeamView[index].teamSkill,
                    teamStrength: registerTeamView[index].teamStrength,
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 15,
                );
              },
              itemCount: registerTeamView.length,
            )
          : const Center(child: Text('No Team Data')),
    );
  }
}
