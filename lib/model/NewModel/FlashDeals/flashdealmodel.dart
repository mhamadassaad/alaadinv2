// To parse this JSON data, do
//
//     final flashDealModel = flashDealModelFromJson(jsonString);

import 'dart:convert';

import 'package:amazcart/model/NewModel/FlashDeals/flashdealdata.dart';

FlashDealModel flashDealModelFromJson(String str) =>
    FlashDealModel.fromJson(json.decode(str));

String flashDealModelToJson(FlashDealModel data) => json.encode(data.toJson());

class FlashDealModel {
  FlashDealModel({
    required this.flashDeal,
  });

  FlashDealData flashDeal;

  factory FlashDealModel.fromJson(Map<String, dynamic> json) => FlashDealModel(
        flashDeal: FlashDealData.fromJson(json["flash_deal"]),
      );

  Map<String, dynamic> toJson() => {
        "flash_deal": flashDeal.toJson(),
      };
}
