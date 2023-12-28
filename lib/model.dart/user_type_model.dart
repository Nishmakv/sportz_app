

import 'dart:convert';

UserTypeModel userTypeModelFromJson(String str) => UserTypeModel.fromJson(json.decode(str));

String userTypeModelToJson(UserTypeModel data) => json.encode(data.toJson());

class UserTypeModel {
    String token;
    String userType;
    bool isAdmin;
    int userId;

    UserTypeModel({
        required this.token,
        required this.userType,
        required this.isAdmin,
        required this.userId,
    });

    factory UserTypeModel.fromJson(Map<String, dynamic> json) => UserTypeModel(
        token: json["token"],
        userType: json["user_type"],
        isAdmin: json["is_admin"],
        userId: json["user_id"],
    );

    Map<String, dynamic> toJson() => {
        "token": token,
        "user_type": userType,
        "is_admin": isAdmin,
        "user_id": userId,
    };
}
