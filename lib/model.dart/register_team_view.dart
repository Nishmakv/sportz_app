// To parse this JSON data, do
//
//     final addPlayersModel = addPlayersModelFromJson(jsonString);

import 'dart:convert';

List<RegisterTeamViewModel> addPlayersModelFromJson(String str) =>
    List<RegisterTeamViewModel>.from(
        json.decode(str).map((x) => RegisterTeamViewModel.fromJson(x)));

String addPlayersModelToJson(List<RegisterTeamViewModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RegisterTeamViewModel {
  int id;
  List<Player> players;
  String teamName;
  String teamSkill;
  String? teamPic;
  int teamStrength;
  double? teamLongitude;
  double? teamLatitude;

  RegisterTeamViewModel({
    required this.id,
    required this.players,
    required this.teamName,
    required this.teamSkill,
    this.teamPic,
    required this.teamStrength,
    this.teamLongitude,
    this.teamLatitude,
  });

  factory RegisterTeamViewModel.fromJson(Map<String, dynamic> json) =>
      RegisterTeamViewModel(
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
        "team_skill": skillValues.reverse[teamSkill],
        "team_pic": teamPic,
        "team_strength": teamStrength,
        "team_longitude": teamLongitude,
        "team_latitude": teamLatitude,
      };
}

class Player {
  String playerName;
  Skill playerSkill;
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
        playerSkill: skillValues.map[json["player_skill"]]!,
        playerPic: json["player_pic"],
        playerPosition: json["player_position"],
      );

  Map<String, dynamic> toJson() => {
        "player_name": playerName,
        "player_skill": skillValues.reverse[playerSkill],
        "player_pic": playerPic,
        "player_position": playerPosition,
      };
}

enum Skill { BEGINNER, INTERMEDIATE, PROFESSIONAL }

final skillValues = EnumValues({
  "Beginner": Skill.BEGINNER,
  "Intermediate": Skill.INTERMEDIATE,
  "Professional": Skill.PROFESSIONAL
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
