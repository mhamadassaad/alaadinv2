// To parse this JSON data, do
//
//     final liveSearchModel = liveSearchModelFromJson(jsonString);

import 'dart:convert';
import 'package:amazcart/model/NewModel/Category/categorydata.dart';
import 'package:amazcart/model/NewModel/Product/heproductmodel.dart';
import 'package:amazcart/model/NewModel/Tags/tagdata.dart';

LiveSearchModel liveSearchModelFromJson(String str) =>
    LiveSearchModel.fromJson(json.decode(str));

String liveSearchModelToJson(LiveSearchModel data) =>
    json.encode(data.toJson());

class LiveSearchModel {
  LiveSearchModel({
    required this.tags,
    required this.products,
    required this.categories,
  });

  List<TagData> tags;
  List<HeProductModel> products;
  List<CategoryData> categories;

  factory LiveSearchModel.fromJson(Map<String, dynamic> json) =>
      LiveSearchModel(
        tags: List<TagData>.from(json["tags"].map((x) => TagData.fromJson(x))),
        // products: List<ProductModel>.from(
        //     json["products"].map((x) => ProductModel.fromJson(x))),
        products: List<HeProductModel>.from(
            json["products"].map((x) => HeProductModel.fromJson(x))), //ah
        categories: List<CategoryData>.from(
            json["categories"].map((x) => CategoryData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "tags": List<dynamic>.from(tags.map((x) => x)),
        // "products": List<dynamic>.from(products.map((x) => x.toJson())),
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
      };
}
