// To parse this JSON data, do
//
//     final teamLeaderboard = teamLeaderboardFromJson(jsonString);

import 'dart:convert';

List<TeamLeaderboard> teamLeaderboardFromJson(String str) => List<TeamLeaderboard>.from(json.decode(str).map((x) => TeamLeaderboard.fromJson(x)));

String teamLeaderboardToJson(List<TeamLeaderboard> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TeamLeaderboard {
    int id;
    String teamName;
    int aggregateScore;
    int matchesAttended;
    String teamPic;
    int teamStrength;
    int numberOfWins;
    double winRatio;
    double aggregateScoreRatio;
    int team;

    TeamLeaderboard({
        required this.id,
        required this.teamName,
        required this.aggregateScore,
        required this.matchesAttended,
        required this.teamPic,
        required this.teamStrength,
        required this.numberOfWins,
        required this.winRatio,
        required this.aggregateScoreRatio,
        required this.team,
    });

    factory TeamLeaderboard.fromJson(Map<String, dynamic> json) => TeamLeaderboard(
        id: json["id"],
        teamName: json["team_name"],
        aggregateScore: json["aggregate_score"],
        matchesAttended: json["matches_attended"],
        teamPic: json["team_pic"],
        teamStrength: json["team_strength"],
        numberOfWins: json["number_of_wins"],
        winRatio: json["win_ratio"]?.toDouble(),
        aggregateScoreRatio: json["aggregate_score_ratio"]?.toDouble(),
        team: json["team"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "team_name": teamName,
        "aggregate_score": aggregateScore,
        "matches_attended": matchesAttended,
        "team_pic": teamPic,
        "team_strength": teamStrength,
        "number_of_wins": numberOfWins,
        "win_ratio": winRatio,
        "aggregate_score_ratio": aggregateScoreRatio,
        "team": team,
    };
}
