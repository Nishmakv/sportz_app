// To parse this JSON data, do
//
//     final userProfileModel = userProfileModelFromJson(jsonString);

import 'dart:convert';

UserProfileModel userProfileModelFromJson(String str) => UserProfileModel.fromJson(json.decode(str));

String userProfileModelToJson(UserProfileModel data) => json.encode(data.toJson());

class UserProfileModel {
    String phoneNo;
    String email;
    String profileName;
    dynamic profilePic;

    UserProfileModel({
        required this.phoneNo,
        required this.email,
        required this.profileName,
         this.profilePic,
    });

    factory UserProfileModel.fromJson(Map<String, dynamic> json) => UserProfileModel(
        phoneNo: json["phone_no"],
        email: json["email"],
        profileName: json["profile_name"],
        profilePic: json["profile_pic"],
    );

    Map<String, dynamic> toJson() => {
        "phone_no": phoneNo,
        "email": email,
        "profile_name": profileName,
        "profile_pic": profilePic,
    };
}
