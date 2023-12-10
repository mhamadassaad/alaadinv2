import 'dart:async';
import 'dart:convert';

import 'package:amazcart/config/config.dart';
import 'package:amazcart/model/NewModel/LiveSearchModel.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supercharged/supercharged.dart';

class SearchController extends GetxController {
  RxBool isLoading = false.obs;

  Rx<LiveSearchModel> liveSearchModel =
      LiveSearchModel(categories: [], products: [], tags: []).obs;

  Rx<TextEditingController> keywordCtrl = TextEditingController().obs;

  Future<LiveSearchModel?> getData(
      {required String keyword, required String catId}) async {
    LiveSearchModel result;
    if (keyword == "") {
      return null;
    }
    try {
      isLoading(true);
      Map body = {
        "keyword": keyword,
        "cat_id": catId,
      };
      var response = await Dio().post(
        URLs.LIVE_SEARCH,
        data: jsonEncode(body),
      );
      if (response.statusCode == 200) {
        isLoading(false);
        result = LiveSearchModel.fromJson(response.data);
        liveSearchModel.value = result;
      } else {
        isLoading(false);
      }

      ///return result;
    } catch (e) {
      isLoading(false);
      print(e);
      throw e.toString();
    }
  }

  List<TextSpan> highlightOccurrences(String source, String query) {
    if (query == null || query.isEmpty || !source.contains(query)) {
      return [TextSpan(text: source)];
    }

    final regex = RegExp(
      query.replaceAll(RegExp(r'\W'), r'\\$&').replaceAll(RegExp(r'\s+'),
          r'[\u0600-\u06FF\u0750-\u077F\u08A0-\u08FF\uFB50-\uFDFF\uFE70-\uFEFF\p{Mn}\p{Me}\p{Cf}\p{Zs}]*'),
      caseSensitive: false,
    );

    final matches = regex.allMatches(source);

    int lastMatchEnd = 0;

    final List<TextSpan> children = [];
    for (var i = 0; i < matches.length; i++) {
      final match = matches.elementAt(i);

      if (match.start != lastMatchEnd) {
        children.add(TextSpan(
          text: source.substring(lastMatchEnd, match.start),
        ));
      }

      children.add(TextSpan(
        text: source.substring(match.start, match.end),
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
      ));

      if (i == matches.length - 1 && match.end != source.length) {
        children.add(TextSpan(
          text: source.substring(match.end, source.length),
        ));
      }

      lastMatchEnd = match.end;
    }
    // edit 11-5-2023 ali hellany
    if (matches.length == 0) {
      children.add(TextSpan(
        text: source,
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
      ));
    }
    // edit ends
    return children;
  }

  @override
  void onInit() {
    super.onInit();
  }
}

class Search {
  final int id;
  final String name;

  Search({required this.id, required this.name});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> user = Map<String, dynamic>();
    user["id"] = id;
    user["name"] = this.name;
    return user;
  }

  factory Search.fromJson(Map<String, dynamic> json) => Search(
        id: json["id"],
        name: json["name"],
      );
}
