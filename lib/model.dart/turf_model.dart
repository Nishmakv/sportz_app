// To parse this JSON data, do
//
//     final turfModel = turfModelFromJson(jsonString);

import 'dart:convert';

List<TurfModel> turfModelFromJson(String str) => List<TurfModel>.from(json.decode(str).map((x) => TurfModel.fromJson(x)));

String turfModelToJson(List<TurfModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TurfModel {
    int id;
    List<int> amenity;
    String name;
    String location;
    String price;
    String image;
    String description;
    double latitude;
    double longitude;

    TurfModel({
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

    factory TurfModel.fromJson(Map<String, dynamic> json) => TurfModel(
        id: json["id"],
        amenity: List<int>.from(json["amenity"].map((x) => x)),
        name: json["name"],
        location: json["location"],
        price: json["price"],
        image: json["image"],
        description: json["description"],
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
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
