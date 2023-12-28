// To parse this JSON data, do
//
//     final registerPlayerList = registerPlayerListFromJson(jsonString);

import 'dart:convert';

List<RegisterPlayerList> registerPlayerListFromJson(String str) =>
    List<RegisterPlayerList>.from(
        json.decode(str).map((x) => RegisterPlayerList.fromJson(x)));

String registerPlayerListToJson(List<RegisterPlayerList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RegisterPlayerList {
  int id;
  String playerName;
  String? playerSkill;
  String? playerPic;
  String playerPosition;

  RegisterPlayerList({
    required this.id,
    required this.playerName,
     this.playerSkill,
     this.playerPic,
    required this.playerPosition,
  });

  factory RegisterPlayerList.fromJson(Map<String, dynamic> json) =>
      RegisterPlayerList(
        id: json["id"],
        playerName: json["player_name"],
        playerSkill: json["player_skill"]!,
        playerPic: json["player_pic"],
        playerPosition: json["player_position"]!,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "player_name": playerName,
        "player_skill": playerSkill,
        "player_pic": playerPic,
        "player_position": playerPosition,
      };
}
