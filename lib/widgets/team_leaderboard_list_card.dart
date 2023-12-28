import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sportz_app/bloc/bloc/team_leaderboard_bloc.dart';
import 'package:sportz_app/model.dart/team_leaderboard.dart';
import 'package:sportz_app/screens/team_leaderboard_scree.dart';
import 'package:sportz_app/widgets/team_leaderboard_list_widget.dart';

class LeaderboardListCard extends StatefulWidget {
  const LeaderboardListCard({super.key});

  @override
  State<LeaderboardListCard> createState() => _LeaderboardListCardState();
}

class _LeaderboardListCardState extends State<LeaderboardListCard> {
  List<TeamLeaderboard> teamLeaderboardModel = [];
  @override
  void initState() {
    super.initState();
    context.read<TeamLeaderboardBloc>().add(
          const TeamLeaderboardProcess(),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TeamLeaderboardBloc, TeamLeaderboardState>(
      listener: (context, state) {
        if (state is TeamLeaderboardSuccess) {
          teamLeaderboardModel.addAll(state.teamLeaderboardModel);
          setState(() {});
        }
      },
      child: BlocBuilder<TeamLeaderboardBloc, TeamLeaderboardState>(
        builder: (context, state) {
          if (state is TeamLeaderboardLoading) {
            return Shimmer.fromColors(
             
              baseColor: const Color.fromARGB(31, 220, 217, 217),
              highlightColor: Colors.white,
               child:  const SizedBox(
                width: double.infinity,
                height: 160,
              ),
            );
          }
          return Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.038),
                  blurRadius: 12,
                ),
              ],
              border: Border.all(
                color: const Color.fromARGB(19, 145, 145, 145),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Team Leaderboard",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: teamLeaderboardModel.isNotEmpty
                      ? ListView.separated(
                          primary: false,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return LeaderboardWidget(
                              teamName: teamLeaderboardModel[index].teamName,
                              teamPic: teamLeaderboardModel[index].teamPic,
                              aggregateScore:
                                  teamLeaderboardModel[index].aggregateScore,
                              matchesAttended:
                                  teamLeaderboardModel[index].matchesAttended,
                              teamStrength:
                                  teamLeaderboardModel[index].teamStrength,
                              numberOfWins:
                                  teamLeaderboardModel[index].numberOfWins,
                              index: index,
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              height: 10,
                            );
                          },
                          itemCount: 3)
                      : const Center(child: Text('No Data')),
                ),
                GestureDetector(
                  onTap: () {
                    PersistentNavBarNavigator.pushNewScreen(
                      context,
                      withNavBar: false,
                      screen: const TeamLeaderboardScreen(),
                      pageTransitionAnimation:
                          PageTransitionAnimation.cupertino,
                    );
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "See All",
                        style: TextStyle(
                            color: Color.fromARGB(255, 15, 177, 21),
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                      ),
                      Icon(
                        Ionicons.chevron_forward_outline,
                        color: Color.fromARGB(255, 15, 177, 21),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
