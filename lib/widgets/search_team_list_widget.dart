import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportz_app/bloc/bloc/invite_players_bloc.dart';
import 'package:sportz_app/bloc/bloc/match_invitation_bloc.dart';

// ignore: must_be_immutable
class SearchTeamWidget extends StatelessWidget {
  int? teamId;
  int? id;
  String teamName;
  String? teamSkill;
  String teamPic;
  String teamPosition;
  SearchTeamWidget(
      {super.key,
      required this.teamId,
      required this.id,
      required this.teamName,
      required this.teamPic,
      required this.teamPosition,
      required this.teamSkill});

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
          leading: Image.network(teamPic),
          title: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(teamName),
          ),
          subtitle: Column(
            children: [
              Text(teamPosition),
              Text(teamSkill!),
            ],
          ),
          trailing: GestureDetector(
            onTap: () {
              context.read<MatchInvitationBloc>().add(MatchInvitationProcess(
                  senderTeamId: teamId, receiverTeamId: id));
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
