// To parse this JSON data, do
//
//     final userTurfModel = userTurfModelFromJson(jsonString);

import 'dart:convert';

UserTurfModel userTurfModelFromJson(String str) =>
    UserTurfModel.fromJson(json.decode(str));

String userTurfModelToJson(UserTurfModel data) => json.encode(data.toJson());

class UserTurfModel {
  int id;
  String name;
  String location;
  double price;
  double rating;
  String imageUrl;
  String description;
  List<String> amenities;
  double distanceKm;

  UserTurfModel({
    required this.id,
    required this.name,
    required this.location,
    required this.price,
    required this.rating,
    required this.imageUrl,
    required this.description,
    required this.amenities,
    required this.distanceKm,
  });

  factory UserTurfModel.fromJson(Map<String, dynamic> json) => UserTurfModel(
        id: json["id"],
        name: json["name"],
        location: json["location"],
        rating: json["rating"]?.toDouble(),
        price: json["price"]?.toDouble(),
        imageUrl: json["image"],
        description: json["description"],
        amenities: List<String>.from(json["amenities"].map((x) => x)),
        distanceKm: json["distance_km"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "location": location,
        "price": price,
        "rating": rating,
        "image": imageUrl,
        "description": description,
        "amenities": List<dynamic>.from(amenities.map((x) => x)),
        "distance_km": distanceKm,
      };
}
