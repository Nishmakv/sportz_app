import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sportz_app/bloc/bloc/get_players_bloc.dart';
import 'package:sportz_app/bloc/bloc/invite_players_bloc.dart';
import 'package:sportz_app/bloc/bloc/register_player_list_bloc.dart';

import 'package:sportz_app/data/player_search_list.dart';
import 'package:sportz_app/model.dart/register_player_list_model.dart';
import 'package:sportz_app/model.dart/register_team_view.dart';
import 'package:sportz_app/widgets/search_players_list_widget.dart';

class SearchTeamListCard extends StatefulWidget {
  final int teamId;
  const SearchTeamListCard({super.key, required this.teamId});

  @override
  State<SearchTeamListCard> createState() => _SearchTeamListCardState();
}

class _SearchTeamListCardState extends State<SearchTeamListCard> {
  List<RegisterTeamViewModel> registerTeamList = [];
  @override
  void initState() {
    super.initState();
    context.read<GetPlayersBloc>().add(
          const GetPlayersProcess(),
        );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<GetPlayersBloc, GetPlayersState>(
          listener: (context, state) {
            if (state is GetPlayersSuccess ) {
              registerTeamList.addAll(state.registerTeamView);
              setState(() {});
            } else if (state is GetPlayersFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Failed'),
                ),
              );
            }
          },
        ),
        BlocListener<InvitePlayersBloc, InvitePlayersState>(
          listener: (context, state) {
            if (state is InvitePlayersSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Invitation successfully completed'),
                ),
              );
            } else if (state is InvitePlayersFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Invitation failed'),
                ),
              );
            }
          },
        ),
      ],
      child: BlocBuilder<RegisterPlayerListBloc, RegisterPlayerListState>(
        builder: (context, state) {
          if (state is RegisterPlayerListLoading) {
            Shimmer.fromColors(
              baseColor: const Color.fromARGB(31, 220, 217, 217),
              highlightColor: Colors.white,
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 160,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ],
              ),
            );
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                child: registerTeamList.isNotEmpty
                    ? ListView.separated(
                        primary: false,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return SearchPlayersWidget(
                            teamId: widget.teamId,
                            id: registerTeamList[index].id,
                            playerName: registerTeamList[index].teamName,
                            playerPic:
                                registerTeamList[index].teamPic ?? "",
                            playerPosition:
                                registerTeamList[index].teamStrength.toString(),
                            playerSkill: registerTeamList[index].teamSkill,
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            width: 10,
                          );
                        },
                        itemCount: list3.length)
                    : const Text("No Players"),
              ),
            ],
          );
        },
      ),
    );
  }
}
