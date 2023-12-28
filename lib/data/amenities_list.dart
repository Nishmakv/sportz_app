import 'package:flutter/material.dart';

class AminitiesModel {
  Widget? icon;
  String name;
  AminitiesModel({required this.icon, required this.name});
}

List<AminitiesModel> list2 = [
  AminitiesModel(icon: const Icon(Icons.abc), name: 'Wifi'),
  AminitiesModel(icon: const Icon(Icons.abc), name: 'Dressing room'),
  AminitiesModel(icon: const Icon(Icons.abc), name: 'Gallery'),
  AminitiesModel(icon: const Icon(Icons.abc), name: 'Parking'),
  AminitiesModel(icon: const Icon(Icons.abc), name: 'Water'),
  AminitiesModel(icon: const Icon(Icons.abc), name: 'Washroom'),
];
