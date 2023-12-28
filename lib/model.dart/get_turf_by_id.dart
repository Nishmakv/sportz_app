// To parse this JSON data, do
//
//     final userTurfByIdModel = userTurfByIdModelFromJson(jsonString);

import 'dart:convert';

UserTurfByIdModel userTurfByIdModelFromJson(String str) =>
    UserTurfByIdModel.fromJson(json.decode(str));

String userTurfByIdModelToJson(UserTurfByIdModel data) =>
    json.encode(data.toJson());

class UserTurfByIdModel {
  int id;
  List<int> amenity;
  String name;
  String location;
  double price;
  String image;
  String description;
  double latitude;
  double longitude;

  UserTurfByIdModel({
    required this.id,
    required this.amenity,
    required this.name,
    required this.location,
    required this.price,
    required this.image,
    required this.description,
    required this.latitude,
    required this.longitude,
  });

  factory UserTurfByIdModel.fromJson(Map<String, dynamic> json) =>
      UserTurfByIdModel(
        id: json["id"],
        amenity: List<int>.from(json["amenity"].map((x) => x)),
        name: json["name"],
        location: json["location"],
        price: json["price"]?.toDouble(),
        image: json["image"],
        description: json["description"],
        latitude: json["latitude"].toDouble(),
        longitude: json["longitude"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "amenity": List<dynamic>.from(amenity.map((x) => x)),
        "name": name,
        "location": location,
        "price": price,
        "image": image,
        "description": description,
        "latitude": latitude,
        "longitude": longitude,
      };
}
