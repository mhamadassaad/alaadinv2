// To parse this JSON data, do
//
//     final myWishListModel = myWishListModelFromJson(jsonString);

import 'dart:convert';

import 'package:amazcart/model/NewModel/Product/giftcarddata.dart';
import 'package:amazcart/model/NewModel/Product/productmodel.dart';
import 'package:amazcart/model/NewModel/Product/producttype.dart';
import 'package:amazcart/model/NewModel/Seller/sellerdata.dart';
// import 'package:amazcart/model/NewModel/Product/GiftCardData.dart';
// import 'package:amazcart/model/NewModel/Product/ProductModel.dart';
// import 'package:amazcart/model/NewModel/Product/ProductType.dart';
// import 'package:amazcart/model/NewModel/Seller/SellerData.dart';

MyWishListModel myWishListModelFromJson(String str) =>
    MyWishListModel.fromJson(json.decode(str));

String myWishListModelToJson(MyWishListModel data) =>
    json.encode(data.toJson());

class MyWishListModel {
  MyWishListModel({
    required this.products,
    required this.message,
  });

  Map<String, List<WishListProduct>> products;
  String message;

  factory MyWishListModel.fromJson(Map<String, dynamic> json) =>
      MyWishListModel(
        products: Map.from(json["products"]).map((k, v) =>
            MapEntry<String, List<WishListProduct>>(
                k,
                List<WishListProduct>.from(
                    v.map((x) => WishListProduct.fromJson(x))))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "products": Map.from(products).map((k, v) => MapEntry<String, dynamic>(
            k, List<dynamic>.from(v.map((x) => x.toJson())))),
        "message": message,
      };
}

class WishListProduct {
  WishListProduct({
    this.id,
    this.userId,
    this.sellerId,
    required this.type,
    this.sellerProductId,
    required this.createdAt,
    required this.updatedAt,
    required this.seller,
    required this.giftcard,
    required this.product,
  });

  dynamic id;
  dynamic userId;
  dynamic sellerId;
  ProductType type;
  dynamic sellerProductId;
  DateTime createdAt;
  DateTime updatedAt;
  SellerData seller;
  GiftCardData giftcard;
  ProductModel product;

  factory WishListProduct.fromJson(Map<String, dynamic> json) =>
      WishListProduct(
        id: json["id"],
        userId: json["user_id"],
        sellerId: json["seller_id"],
        type: json["type"],
        sellerProductId: json["seller_product_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        seller: SellerData.fromJson(json["seller"]),
        giftcard: json["giftcard"],
        product: json["product"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "seller_id": sellerId,
        "type": type,
        "seller_product_id": sellerProductId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "seller": seller.toJson(),
        "giftcard": giftcard == null ? null : giftcard.toJson(),
        "product": product == null ? null : product.toJson(),
      };
}
