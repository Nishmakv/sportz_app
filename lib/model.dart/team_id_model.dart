// To parse this JSON data, do
//
//     final teamById = teamByIdFromJson(jsonString);

import 'dart:convert';

TeamById teamByIdFromJson(String str) => TeamById.fromJson(json.decode(str));

String teamByIdToJson(TeamById data) => json.encode(data.toJson());

class TeamById {
  int id;
  List<dynamic> players;
  String teamName;
  String teamSkill;
  dynamic teamPic;
  int teamStrength;
  dynamic teamLongitude;
  dynamic teamLatitude;

  TeamById({
    required this.id,
    required this.players,
    required this.teamName,
    required this.teamSkill,
    this.teamPic,
    required this.teamStrength,
    this.teamLongitude,
    this.teamLatitude,
  });

  factory TeamById.fromJson(Map<String, dynamic> json) => TeamById(
        id: json["id"],
        players: List<dynamic>.from(json["players"].map((x) => x)),
        teamName: json["team_name"],
        teamSkill: json["team_skill"],
        teamPic: json["team_pic"],
        teamStrength: json["team_strength"],
        teamLongitude: json["team_longitude"],
        teamLatitude: json["team_latitude"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "players": List<dynamic>.from(players.map((x) => x)),
        "team_name": teamName,
        "team_skill": teamSkill,
        "team_pic": teamPic,
        "team_strength": teamStrength,
        "team_longitude": teamLongitude,
        "team_latitude": teamLatitude,
      };
}
