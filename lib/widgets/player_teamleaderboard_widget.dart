import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

// ignore: must_be_immutable
class PlayerLeaderboardWidget extends StatelessWidget {
  String playerName;
  int playerScore;
  String playerPic;
  int index;
  PlayerLeaderboardWidget(
      {super.key,
      required this.playerName,
      required this.playerScore,
      required this.playerPic,
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
                  backgroundImage: NetworkImage(playerPic),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      playerName,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                   
                  ],
                )
              ],
            ),
            Text(
              playerScore.toString(),
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
