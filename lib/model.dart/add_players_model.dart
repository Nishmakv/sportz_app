// To parse this JSON data, do
//
//     final addPlayersModel = addPlayersModelFromJson(jsonString);

import 'dart:convert';

AddPlayersModel addPlayersModelFromJson(String str) =>
    AddPlayersModel.fromJson(json.decode(str));

String addPlayersModelToJson(AddPlayersModel data) =>
    json.encode(data.toJson());

class AddPlayersModel {
  int id;
  List<Player> players;
  String teamName;
  String teamSkill;
  dynamic teamPic;
  int teamStrength;
  double teamLongitude;
  double teamLatitude;

  AddPlayersModel({
    required this.id,
    required this.players,
    required this.teamName,
    required this.teamSkill,
    required this.teamPic,
    required this.teamStrength,
    required this.teamLongitude,
    required this.teamLatitude,
  });

  factory AddPlayersModel.fromJson(Map<String, dynamic> json) =>
      AddPlayersModel(
        id: json["id"],
        players:
            List<Player>.from(json["players"].map((x) => Player.fromJson(x))),
        teamName: json["team_name"],
        teamSkill: json["team_skill"],
        teamPic: json["team_pic"],
        teamStrength: json["team_strength"],
        teamLongitude: json["team_longitude"]?.toDouble(),
        teamLatitude: json["team_latitude"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "players": List<dynamic>.from(players.map((x) => x.toJson())),
        "team_name": teamName,
        "team_skill": teamSkill,
        "team_pic": teamPic,
        "team_strength": teamStrength,
        "team_longitude": teamLongitude,
        "team_latitude": teamLatitude,
      };
}

class Player {
  String playerName;
  String playerSkill;
  String playerPic;
  String playerPosition;

  Player({
    required this.playerName,
    required this.playerSkill,
    required this.playerPic,
    required this.playerPosition,
  });

  factory Player.fromJson(Map<String, dynamic> json) => Player(
        playerName: json["player_name"],
        playerSkill: json["player_skill"],
        playerPic: json["player_pic"],
        playerPosition: json["player_position"],
      );

  Map<String, dynamic> toJson() => {
        "player_name": playerName,
        "player_skill": playerSkill,
        "player_pic": playerPic,
        "player_position": playerPosition,
      };
}
