// To parse this JSON data, do
//
//     final userProfileModel = userProfileModelFromJson(jsonString);

import 'dart:convert';

SearchTurfModel userProfileModelFromJson(String str) =>
    SearchTurfModel.fromJson(json.decode(str));

String userProfileModelToJson(SearchTurfModel data) =>
    json.encode(data.toJson());

class SearchTurfModel {
  int unnamed0;
  double aiRating;
  String amenity;
  String description;
  int id;
  String image;
  double latitude;
  String location;
  double longitude;
  String name;
  double price;

  SearchTurfModel({
    required this.unnamed0,
    required this.aiRating,
    required this.amenity,
    required this.description,
    required this.id,
    required this.image,
    required this.latitude,
    required this.location,
    required this.longitude,
    required this.name,
    required this.price,
  });

  factory SearchTurfModel.fromJson(Map<String, dynamic> json) =>
      SearchTurfModel(
        unnamed0: json["Unnamed: 0"],
        aiRating: json["ai_rating"]?.toDouble(),
        amenity: json["amenity"],
        description: json["description"],
        id: json["id"],
        image: json["image"],
        latitude: json["latitude"]?.toDouble(),
        location: json["location"],
        longitude: json["longitude"]?.toDouble(),
        name: json["name"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "Unnamed: 0": unnamed0,
        "ai_rating": aiRating,
        "amenity": amenity,
        "description": description,
        "id": id,
        "image": image,
        "latitude": latitude,
        "location": location,
        "longitude": longitude,
        "name": name,
        "price": price,
      };
}
