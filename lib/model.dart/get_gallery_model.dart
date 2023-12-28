// To parse this JSON data, do
//
//     final getGalleryModel = getGalleryModelFromJson(jsonString);

import 'dart:convert';

List<GetGalleryModel> getGalleryModelFromJson(String str) =>
    List<GetGalleryModel>.from(
        json.decode(str).map((x) => GetGalleryModel.fromJson(x)));

String getGalleryModelToJson(List<GetGalleryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetGalleryModel {
  int? id;
  String? image;
  String? description;
  int? user;
  GetGalleryModel({
    required this.id,
    required this.image,
    required this.description,
    required this.user,
  });

  factory GetGalleryModel.fromJson(Map<String, dynamic> json) =>
      GetGalleryModel(
        id: json["id"],
        image: json["image"],
        description: json["description"],
        user: json["user"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "description": description,
        "user": user,
      };
}
