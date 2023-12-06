// To parse this JSON data, do
//
//     final allProductsModel = allProductsModelFromJson(jsonString);

import 'dart:convert';
import 'package:amazcart/model/NewModel/Product/ProductModel.dart';
import 'package:amazcart/model/NewModel/meta.dart';

List<ProductModel> productModelFromJson(String str) => List<ProductModel>.from(
    json.decode(str).map((x) => ProductModel.fromJson(x)));

String userModelToJson(List<ProductModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AllProductsModel {
  AllProductsModel({
    required this.data,
    required this.meta,
  });

  List<ProductModel> data;
  Meta meta;

  factory AllProductsModel.fromJson(Map<String, dynamic> json) =>
      AllProductsModel(
        data: List<ProductModel>.from(
            json["data"].map((x) => ProductModel.fromJson(x))),
        meta: Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "meta": meta.toJson(),
      };
}
