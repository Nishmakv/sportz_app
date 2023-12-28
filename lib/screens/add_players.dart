import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:sportz_app/bloc/bloc/get_each_player_bloc.dart';
import 'package:sportz_app/model.dart/add_players_model.dart';
import 'package:sportz_app/model.dart/register_player_list_model.dart';
import 'package:sportz_app/screens/new_players_add.dart';
import 'package:sportz_app/widgets/button.dart';
import 'package:sportz_app/widgets/search_players_list_card.dart';
import 'package:sportz_app/widgets/search_team_list_card.dart';

// ignore: must_be_immutable
class AddPlayersScreen extends StatefulWidget {
  int id;
  int? teamStrength;
  AddPlayersScreen({super.key, required this.id, required this.teamStrength});

  @override
  State<AddPlayersScreen> createState() => _AddPlayersScreenState();
}

class _AddPlayersScreenState extends State<AddPlayersScreen> {
  List<RegisterPlayerList> registerPlayerList = [];
  AddPlayersModel? addPlayers;
  @override
  void initState() {
    super.initState();
    context.read<GetEachPlayerBloc>().add(
          GetEachPlayersProcess(id: widget.id),
        );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    void modelBottomSheet() {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext ctx) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  Container(
                    height: 50,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Ionicons.add_outline),
                        SizedBox(width: 20),
                        Center(
                            child: Text(
                          'Add Players',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  SearchPlayersListCard(teamId: widget.id),
                ],
              ),
            ),
          );
        },
      );
    }

    void teamBottomSheet() {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext ctx) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  SearchTeamListCard(teamId: widget.id),
                ],
              ),
            ),
          );
        },
      );
    }

    return MultiBlocListener(
      listeners: [
        BlocListener<GetEachPlayerBloc, GetEachPlayerState>(
          listener: (context, state) {
            if (state is GetEachPlayerSuccess) {
              addPlayers = state.addPlayers;
              setState(() {});
            }
          },
        ),
      ],
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
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
                        "Team",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      )
                    ],
                  ),
                  addPlayers != null
                      ? ListView.builder(
                          itemCount: addPlayers!.players.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Card(
                              child: ListTile(
                                trailing: Text(
                                    addPlayers!.players[index].playerSkill),
                                title: Row(
                                  children: [
                                    // Text(addPlayers[index].),
                                    Text(addPlayers!.players[index].playerName),
                                  ],
                                ),
                                subtitle: Text(
                                    addPlayers!.players[index].playerPosition),
                              ),
                            );
                          },
                        )
                      : SizedBox(
                          height: 100,
                          child: Center(
                            child: Text(
                              "No Players",
                              style: TextStyle(
                                  fontSize: width * 0.05,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                  const SizedBox(height: 10),
                  widget.teamStrength == addPlayers?.players.length
                      ? Button(
                          text: 'Invite Team',
                          onClick: () {
                            teamBottomSheet();
                          },
                        )
                      : Button(
                          text: 'Invite Players',
                          onClick: () {
                            modelBottomSheet();
                          }),
                  const SizedBox(
                    height: 25,
                  ),
                  Button(
                    text: 'Add Players',
                    onClick: () {
                      PersistentNavBarNavigator.pushNewScreen(context,
                          screen: NewPlayerAddScreen(),
                          withNavBar: false,
                          pageTransitionAnimation:
                              PageTransitionAnimation.cupertino);
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
