// To parse this JSON data, do
//
//     final myCartModel = myCartModelFromJson(jsonString);

import 'dart:convert';
import 'package:amazcart/model/NewModel/Customer/CustomerData.dart';
import 'package:amazcart/model/NewModel/Product/GiftCardData.dart';
import 'package:amazcart/model/NewModel/Product/SkuProduct.dart';
import 'package:amazcart/model/NewModel/Product/producttype.dart';
import 'package:amazcart/model/NewModel/Seller/SellerData.dart';

MyCartModel myCartModelFromJson(String str) =>
    MyCartModel.fromJson(json.decode(str));

String myCartModelToJson(MyCartModel data) => json.encode(data.toJson());

class MyCartModel {
  MyCartModel({
    required this.carts,
    required this.message,
    this.shippingCharge,
  });

  Map<String, List<MyCart>> carts;
  String message;
  dynamic shippingCharge;

  factory MyCartModel.fromJson(Map<String, dynamic> json) => MyCartModel(
        carts: Map.from(json["carts"]).map((k, v) =>
            MapEntry<String, List<MyCart>>(
                k, List<MyCart>.from(v.map((x) => MyCart.fromJson(x))))),
        message: json["message"],
        shippingCharge: json["shipping_charge"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "carts": Map.from(carts).map((k, v) => MapEntry<String, dynamic>(
            k, List<dynamic>.from(v.map((x) => x.toJson())))),
        "message": message,
        "shipping_charge": shippingCharge,
      };
}

class MyCart {
  MyCart({
    this.id,
    this.userId,
    this.sellerId,
    required this.productType,
    this.productId,
    this.qty,
    this.price,
    required this.totalPrice,
    this.isSelect,
    this.shippingMethodId,
    required this.seller,
    required this.customer,
    required this.giftCard,
    required this.product,
  });

  dynamic id;
  dynamic userId;
  dynamic sellerId;
  ProductType productType;
  dynamic productId;
  dynamic qty;
  dynamic price;
  double totalPrice;
  dynamic isSelect;
  dynamic shippingMethodId;
  SellerData seller;
  CustomerData customer;
  GiftCardData giftCard;
  SkuProduct product;

  factory MyCart.fromJson(Map<String, dynamic> json) => MyCart(
        id: json["id"],
        userId: json["user_id"],
        sellerId: json["seller_id"],
        productType: json["product_type"],
        productId: json["product_id"],
        qty: json["qty"],
        price: json["price"],
        totalPrice: json["total_price"].toDouble(),
        isSelect: json["is_select"],
        shippingMethodId: json["shipping_method_id"],
        seller: SellerData.fromJson(json["seller"]),
        customer: json["customer"],
        giftCard: json["gift_card"],
        product: json["product"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "seller_id": sellerId,
        "product_type": [productType],
        "product_id": productId,
        "qty": qty,
        "price": price,
        "total_price": totalPrice,
        "is_select": isSelect,
        "shipping_method_id": shippingMethodId,
        "seller": seller.toJson(),
        "customer": customer.toJson(),
        "gift_card": giftCard == null ? null : giftCard.toJson(),
        "product": product.toJson(),
      };
}
