// To parse this JSON data, do
//
//     final playerLeaderBoard = playerLeaderBoardFromJson(jsonString);

import 'dart:convert';

PlayerLeaderBoard playerLeaderBoardFromJson(String str) => PlayerLeaderBoard.fromJson(json.decode(str));

String playerLeaderBoardToJson(PlayerLeaderBoard data) => json.encode(data.toJson());

class PlayerLeaderBoard {
    String player;
    double count;
    int winCount;
    double winRatio;
    String playerLevel;
    String image;
    String name;

    PlayerLeaderBoard({
        required this.player,
        required this.count,
        required this.winCount,
        required this.winRatio,
        required this.playerLevel,
        required this.image,
        required this.name,
    });

    factory PlayerLeaderBoard.fromJson(Map<String, dynamic> json) => PlayerLeaderBoard(
        player: json["Player"],
        count: json["Count"]?.toDouble(),
        winCount: json["Win_Count"],
        winRatio: json["win_ratio"]?.toDouble(),
        playerLevel: json["Player_Level"],
        image: json["image"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "Player": player,
        "Count": count,
        "Win_Count": winCount,
        "win_ratio": winRatio,
        "Player_Level": playerLevel,
        "image": image,
        "name": name,
    };
}
