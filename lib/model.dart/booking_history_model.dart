// To parse this JSON data, do
//
//     final bookingHistoryModel = bookingHistoryModelFromJson(jsonString);

import 'dart:convert';

List<BookingHistoryModel> bookingHistoryModelFromJson(String str) =>
    List<BookingHistoryModel>.from(
        json.decode(str).map((x) => BookingHistoryModel.fromJson(x)));

String bookingHistoryModelToJson(List<BookingHistoryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BookingHistoryModel {
  int user;
  int turfBooked;
  String userName;
  DateTime dateBooked;
  double price;
  int amountPaid;
  int balance;

  BookingHistoryModel({
    required this.user,
    required this.turfBooked,
    required this.userName,
    required this.dateBooked,
    required this.price,
    required this.amountPaid,
    required this.balance,
  });

  factory BookingHistoryModel.fromJson(Map<String, dynamic> json) =>
      BookingHistoryModel(
        user: json["user"],
        turfBooked: json["turf_booked"],
        userName: json["user_name"],
        dateBooked: DateTime.parse(json["date_booked"]),
        price: json["price"],
        amountPaid: json["amount_paid"],
        balance: json["balance"],
      );

  Map<String, dynamic> toJson() => {
        "user": user,
        "turf_booked": turfBooked,
        "user_name": userName,
        "date_booked":
            "${dateBooked.year.toString().padLeft(4, '0')}-${dateBooked.month.toString().padLeft(2, '0')}-${dateBooked.day.toString().padLeft(2, '0')}",
        "price": price,
        "amount_paid": amountPaid,
        "balance": balance,
      };
}
