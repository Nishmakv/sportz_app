import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

// ignore: must_be_immutable
class TeamListWidget extends StatelessWidget {
  String teamName;
  String teamSkill;
  String? teamPic;
  int? teamStrength;

  TeamListWidget(
      {super.key,
      required this.teamName,
      this.teamPic,
      required this.teamSkill,
      required this.teamStrength});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color.fromARGB(19, 0, 0, 0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: h / 10,
              child: teamPic!.isNotEmpty
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.network(
                        teamPic!,
                      ),
                    )
                  : Image.asset("assets/images/placeholder.png"),
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  teamName,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    const Icon(
                      Ionicons.football_outline,
                      size: 20,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      teamSkill,
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
