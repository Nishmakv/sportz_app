import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

// ignore: must_be_immutable
class LeaderboardWidget extends StatelessWidget {
  String teamName;
  int aggregateScore;
  int matchesAttended;
  String teamPic;
  int teamStrength;
  int numberOfWins;
  int index;
  LeaderboardWidget(
      {super.key,
      required this.teamName,
      required this.aggregateScore,
      required this.matchesAttended,
      required this.teamPic,
      required this.teamStrength,
      required this.numberOfWins,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                index == 0
                    ? const Icon(
                        Ionicons.trophy,
                        color: Color.fromARGB(255, 248, 197, 8),
                        size: 30,
                      )
                    : Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black12),
                            borderRadius: BorderRadius.circular(5)),
                        child: Text((index + 1).toString())),
                const SizedBox(width: 10),
                CircleAvatar(
                  radius: 23,
                  backgroundImage: NetworkImage(teamPic),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      teamName,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text(
                      "Matches Played : $matchesAttended ",
                      style: const TextStyle(
                        color: Colors.black38,
                        fontSize: 12,
                      ),
                    )
                  ],
                )
              ],
            ),
            Text(
              aggregateScore.toString(),
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
