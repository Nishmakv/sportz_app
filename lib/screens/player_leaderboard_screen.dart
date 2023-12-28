import 'package:accordion/accordion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:sportz_app/bloc/bloc/player_leaderboard_bloc.dart';
import 'package:sportz_app/model.dart/player_leaderboard.dart';

class PlayerLeaderboardScreen extends StatefulWidget {
  const PlayerLeaderboardScreen({super.key});

  @override
  State<PlayerLeaderboardScreen> createState() =>
      _PlayerLeaderboardScreenState();
}

class _PlayerLeaderboardScreenState extends State<PlayerLeaderboardScreen> {
  List<PlayerLeaderBoard> playerLeaderboardModel = [];

  @override
  void initState() {
    super.initState();
    context.read<PlayerLeaderboardBloc>().add(
          const PlayerLeaderboardProcess(),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PlayerLeaderboardBloc, PlayerLeaderboardState>(
      listener: (context, state) {
        if (state is PlayerLeaderboardSuccess) {
          playerLeaderboardModel.addAll(state.playerLeaderboardModel);
          setState(() {});
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  color: Colors.white,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () => {Navigator.of(context).pop()},
                            child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 8),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black12),
                                    borderRadius: BorderRadius.circular(5)),
                                child: const Center(
                                    child: Icon(Ionicons.chevron_back_outline,
                                        size: 22))),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          const Text(
                            "Leaderboard",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          )
                        ],
                      ),
                      ListView.builder(
                          primary: false,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Accordion(
                              paddingListHorizontal: 0,
                              openAndCloseAnimation:
                                  Accordion.sectionScaleAnimation,
                              contentHorizontalPadding: 0,
                              paddingBetweenOpenSections: 0,
                              children: [
                                AccordionSection(
                                    paddingBetweenClosedSections: 0,
                                    contentHorizontalPadding: 0,
                                    contentVerticalPadding: 0,
                                    headerBorderColor:
                                        const Color.fromARGB(31, 99, 97, 97),
                                    headerBorderWidth: 1,
                                    headerBorderColorOpened:
                                        const Color.fromARGB(31, 99, 97, 97),
                                    contentBorderColor:
                                        const Color.fromARGB(31, 99, 97, 97),
                                    rightIcon: const Column(
                                      children: [
                                        Icon(
                                          Ionicons.chevron_down_outline,
                                          color: Colors.black38,
                                        )
                                      ],
                                    ),
                                    headerBackgroundColor: Colors.white,
                                    headerPadding: const EdgeInsets.all(10),
                                    header: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 80,
                                          height: 80,
                                          child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: Image.network(
                                                playerLeaderboardModel[index]
                                                    .image,
                                                fit: BoxFit.cover,
                                              )),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "#${(index + 1).toString()}",
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(
                                                      255, 15, 177, 21),
                                                  fontSize: 20),
                                            ),
                                            Text(
                                              playerLeaderboardModel[index]
                                                  .name,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16),
                                            ),
                                         
                                          ],
                                        )
                                      ],
                                    ),
                                    content: Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Row(
                                                  children: [
                                                    Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                vertical: 8,
                                                                horizontal: 8),
                                                        decoration: BoxDecoration(
                                                            border: Border.all(
                                                                color: Colors
                                                                    .black12),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5)),
                                                        child: const Center(
                                                            child: Icon(
                                                                Ionicons
                                                                    .speedometer_outline,
                                                                size: 22))),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text(
                                                      " Score : ${playerLeaderboardModel[index].winCount.toString()}",
                                                      style: const TextStyle(
                                                          fontSize: 15),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                child: Row(
                                                  children: [
                                                    Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                vertical: 8,
                                                                horizontal: 8),
                                                        decoration: BoxDecoration(
                                                            border: Border.all(
                                                                color: Colors
                                                                    .black12),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5)),
                                                        child: const Center(
                                                            child: Icon(
                                                                Ionicons
                                                                    .swap_horizontal_outline,
                                                                size: 22))),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text(
                                                      "  Ratio : ${playerLeaderboardModel[index].winRatio.toString()}",
                                                      style: const TextStyle(
                                                          fontSize: 15),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 25,
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Row(
                                                  children: [
                                                    Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                vertical: 8,
                                                                horizontal: 8),
                                                        decoration: BoxDecoration(
                                                            border: Border.all(
                                                                color: Colors
                                                                    .black12),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5)),
                                                        child: const Center(
                                                            child: Icon(
                                                                Ionicons
                                                                    .podium_outline,
                                                                size: 22))),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text(
                                                      " Wins : ${playerLeaderboardModel[index].playerLevel.toString()}",
                                                      style: const TextStyle(
                                                          fontSize: 15),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                child: Row(
                                                  children: [
                                                    Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                vertical: 8,
                                                                horizontal: 8),
                                                        decoration: BoxDecoration(
                                                            border: Border.all(
                                                                color: Colors
                                                                    .black12),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5)),
                                                        child: const Center(
                                                            child: Icon(
                                                                Ionicons
                                                                    .swap_horizontal_outline,
                                                                size: 22))),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                  
                                                  ],
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ))
                              ],
                            );
                          },
                          itemCount: playerLeaderboardModel.length),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
