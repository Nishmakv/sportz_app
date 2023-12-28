import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportz_app/bloc/bloc/invite_players_bloc.dart';

// ignore: must_be_immutable
class SearchPlayersWidget extends StatelessWidget {
  int? teamId;
  int? id;
  String playerName;
  String? playerSkill;
  String playerPic;
  String playerPosition;
  SearchPlayersWidget(
      {super.key,
      required this.teamId,
      required this.id,
      required this.playerName,
      required this.playerPic,
      required this.playerPosition,
      required this.playerSkill});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: SizedBox(
        height: 100,
        width: 200,
        child: ListTile(
          leading: Image.network("http://13.126.57.93:8000/$playerPic"),
          title: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(playerName),
          ),
          subtitle: Column(
            children: [
              Text(playerPosition),
              Text(playerSkill!),
            ],
          ),
          trailing: GestureDetector(
            onTap: () {
              context
                  .read<InvitePlayersBloc>()
                  .add(InvitePlayersProcess(teamId: teamId, playerId: id));
            },
            child: Container(
              height: 30,
              width: 70,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 15, 177, 21),
                borderRadius: BorderRadius.circular(7),
              ),
              child: const Center(
                  child: Text(
                'Invite',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              )),
            ),
          ),
        ),
      ),
    );
  }
}
