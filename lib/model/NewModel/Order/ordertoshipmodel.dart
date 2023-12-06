// To parse this JSON data, do
//
//     final orderToShipModel = orderToShipModelFromJson(jsonString);

import 'dart:convert';

import 'package:amazcart/model/NewModel/Order/package.dart';

OrderToShipModel orderToShipModelFromJson(String str) =>
    OrderToShipModel.fromJson(json.decode(str));

String orderToShipModelToJson(OrderToShipModel data) =>
    json.encode(data.toJson());

class OrderToShipModel {
  OrderToShipModel({
    required this.packages,
    required this.message,
  });

  List<Package> packages;
  String message;

  factory OrderToShipModel.fromJson(Map<String, dynamic> json) =>
      OrderToShipModel(
        packages: List<Package>.from(
            json["packages"].map((x) => Package.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "packages": List<dynamic>.from(packages.map((x) => x.toJson())),
        "message": message,
      };
}
