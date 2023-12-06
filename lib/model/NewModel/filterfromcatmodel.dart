// To parse this JSON data, do
//
//     final filterFromCatModel = filterFromCatModelFromJson(jsonString);

import 'dart:convert';

FilterFromCatModel filterFromCatModelFromJson(String str) =>
    FilterFromCatModel.fromJson(json.decode(str));

String filterFromCatModelToJson(FilterFromCatModel data) =>
    json.encode(data.toJson());

class FilterFromCatModel {
  FilterFromCatModel({
    required this.filterDataFromCat,
    required this.sortBy,
    required this.requestItemType,
    required this.requestItem,
    required this.page,
  });

  FilterDataFromCat filterDataFromCat;
  String sortBy;
  String requestItemType;
  String requestItem;
  String page;

  factory FilterFromCatModel.fromJson(Map<String, dynamic> json) =>
      FilterFromCatModel(
        filterDataFromCat:
            FilterDataFromCat.fromJson(json["filterDataFromCat"]),
        sortBy: json["sort_by"],
        requestItemType: json["requestItemType"],
        requestItem: json["requestItem"],
        page: json["page"],
      );

  Map<String, dynamic> toJson() => {
        "filterDataFromCat": filterDataFromCat.toJson(),
        "sort_by": sortBy,
        "requestItemType": requestItemType,
        "requestItem": requestItem,
        "page": page,
      };
}

class FilterDataFromCat {
  FilterDataFromCat({
    required this.requestItemType,
    required this.requestItem,
    required this.filterType,
  });

  String requestItemType;
  String requestItem;
  List<FilterType> filterType;

  factory FilterDataFromCat.fromJson(Map<String, dynamic> json) =>
      FilterDataFromCat(
        requestItemType: json["requestItemType"],
        requestItem: json["requestItem"],
        filterType: List<FilterType>.from(
            json["filterType"].map((x) => FilterType.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "requestItemType": requestItemType,
        "requestItem": requestItem,
        "filterType": List<dynamic>.from(filterType.map((x) => x.toJson())),
      };
}

class FilterType {
  FilterType({
    required this.filterTypeId,
    required this.filterTypeValue,
  });

  String filterTypeId;
  List<dynamic> filterTypeValue;

  factory FilterType.fromJson(Map<String, dynamic> json) => FilterType(
        filterTypeId: json["filterTypeId"],
        filterTypeValue:
            List<dynamic>.from(json["filterTypeValue"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "filterTypeId": filterTypeId,
        "filterTypeValue": List<dynamic>.from(filterTypeValue.map((x) => x)),
      };
}
