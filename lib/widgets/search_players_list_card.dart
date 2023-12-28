import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sportz_app/bloc/bloc/invite_players_bloc.dart';
import 'package:sportz_app/bloc/bloc/register_player_list_bloc.dart';

import 'package:sportz_app/data/player_search_list.dart';
import 'package:sportz_app/model.dart/register_player_list_model.dart';
import 'package:sportz_app/widgets/search_players_list_widget.dart';

class SearchPlayersListCard extends StatefulWidget {
  final int teamId;
  const SearchPlayersListCard({super.key, required this.teamId});

  @override
  State<SearchPlayersListCard> createState() => _SearchPlayersListCardState();
}

class _SearchPlayersListCardState extends State<SearchPlayersListCard> {
  List<RegisterPlayerList> registerPlayerList = [];
  @override
  void initState() {
    super.initState();
    context.read<RegisterPlayerListBloc>().add(
          const RegisterPlayerProcess(),
        );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<RegisterPlayerListBloc, RegisterPlayerListState>(
          listener: (context, state) {
            if (state is RegisterPlayerListSuccess) {
              registerPlayerList.addAll(state.registerPlayerList);
              setState(() {});
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
                child: registerPlayerList.isNotEmpty
                    ? ListView.separated(
                        primary: false,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return SearchPlayersWidget(
                            teamId: widget.teamId,
                            id: registerPlayerList[index].id,
                            playerName: registerPlayerList[index].playerName,
                            playerPic:
                                registerPlayerList[index].playerPic ?? "",
                            playerPosition:
                                registerPlayerList[index].playerPosition,
                            playerSkill: registerPlayerList[index].playerSkill,
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
