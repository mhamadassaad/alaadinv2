import 'dart:convert';

import 'package:amazcart/model/NewModel/Brand/branddata.dart';
import 'package:amazcart/model/NewModel/Category/categorydata.dart';
import 'package:amazcart/model/NewModel/Filter/filterattributeelement.dart';
import 'package:amazcart/model/NewModel/Filter/filtercolor.dart';

SingleCategory singleCategoryFromJson(String str) =>
    SingleCategory.fromJson(json.decode(str));

String singleCategoryToJson(SingleCategory data) => json.encode(data.toJson());

class SingleCategory {
  SingleCategory({
    required this.data,
    required this.attributes,
    required this.color,
    required this.brands,
    this.lowestPrice,
    this.heightPrice,
  });

  CategoryData data;
  List<FilterAttributeElement> attributes;
  FilterColor color;
  List<BrandData> brands;
  dynamic lowestPrice;
  dynamic heightPrice;

  factory SingleCategory.fromJson(Map<String, dynamic> json) => SingleCategory(
        data: CategoryData.fromJson(json["data"]),
        attributes: List<FilterAttributeElement>.from(
            json["attributes"].map((x) => FilterAttributeElement.fromJson(x))),
        color: json["color"],
        brands: List<BrandData>.from(
            json["brands"].map((x) => BrandData.fromJson(x))),
        lowestPrice: json["lowest_price"] == null ? null : json["lowest_price"],
        heightPrice: json["height_price"] == null ? null : json["height_price"],
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "attributes": List<dynamic>.from(attributes.map((x) => x.toJson())),
        "color": color.toJson(),
        "categories": List<dynamic>.from(brands.map((x) => x.toJson())),
        "lowest_price": lowestPrice,
        "height_price": heightPrice,
      };
}
