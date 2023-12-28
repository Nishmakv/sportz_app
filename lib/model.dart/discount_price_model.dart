// To parse this JSON data, do
//
//     final discountPriceModel = discountPriceModelFromJson(jsonString);

import 'dart:convert';

DiscountPriceModel discountPriceModelFromJson(String str) =>
    DiscountPriceModel.fromJson(json.decode(str));

String discountPriceModelToJson(DiscountPriceModel data) =>
    json.encode(data.toJson());

class DiscountPriceModel {
  DateTime date;
  int discountAmount;
  String endTime;
  int price;
  String startTime;

  DiscountPriceModel({
    required this.date,
    required this.discountAmount,
    required this.endTime,
    required this.price,
    required this.startTime,
  });

  factory DiscountPriceModel.fromJson(Map<String, dynamic> json) =>
      DiscountPriceModel(
        date: DateTime.parse(json["date"]),
        discountAmount: json["discount_amount"],
        endTime: json["end_time"],
        price: json["price"],
        startTime: json["start_time"],
      );

  Map<String, dynamic> toJson() => {
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "discount_amount": discountAmount,
        "end_time": endTime,
        "price": price,
        "start_time": startTime,
      };
}
