// To parse this JSON data, do
//
//     final allRecommendedModel = allRecommendedModelFromJson(jsonString);

import 'dart:convert';

import 'package:amazcart/model/NewModel/Product/productmodel.dart';
import 'package:amazcart/model/NewModel/meta.dart';

// import 'package:amazcart/model/NewModel/Meta.dart';
// import 'package:amazcart/model/NewModel/Product/ProductModel.dart';

AllRecommendedModel allRecommendedModelFromJson(String str) =>
    AllRecommendedModel.fromJson(json.decode(str));

String allRecommendedModelToJson(AllRecommendedModel data) =>
    json.encode(data.toJson());

class AllRecommendedModel {
  AllRecommendedModel({
    required this.data,
    required this.meta,
  });

  List<ProductModel> data;
  Meta meta;

  factory AllRecommendedModel.fromJson(Map<String, dynamic> json) {
    return AllRecommendedModel(
      data: json["data"],
      meta: json["meta"],
    );
  }

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "meta": meta.toJson(),
      };
}
