// To parse this JSON data, do
//
//     final myCheckoutModel = myCheckoutModelFromJson(jsonString);

import 'dart:convert';

import 'package:amazcart/model/NewModel/Cart/FlatGst.dart';
import 'package:amazcart/model/NewModel/Customer/CustomerData.dart';
import 'package:amazcart/model/NewModel/Product/GiftCardData.dart';

import 'package:amazcart/model/NewModel/Product/SkuProduct.dart';
import 'package:amazcart/model/NewModel/Product/producttype.dart';
import 'package:amazcart/model/NewModel/Seller/SellerData.dart';
import 'package:amazcart/model/NewModel/shippingmethodmodel.dart';

MyCheckoutModel myCheckoutModelFromJson(String str) =>
    MyCheckoutModel.fromJson(json.decode(str));

String myCheckoutModelToJson(MyCheckoutModel data) =>
    json.encode(data.toJson());

class MyCheckoutModel {
  MyCheckoutModel({
    required this.packages,
    required this.sameStateGstList,
    required this.differantStateGstList,
    required this.flatGst,
    this.isGstEnable,
    this.isGstModuleEnable,
    required this.message,
  });

  Map<String, CartPackages> packages;
  List<FlatGst> sameStateGstList;
  List<FlatGst> differantStateGstList;
  FlatGst flatGst;
  dynamic isGstEnable;
  dynamic isGstModuleEnable;
  String message;

  factory MyCheckoutModel.fromJson(Map<String, dynamic> json) =>
      MyCheckoutModel(
        packages: Map.from(json["packages"]).map((k, v) =>
            MapEntry<String, CartPackages>(k, CartPackages.fromJson(v))),
        sameStateGstList: List<FlatGst>.from(
            json["same_state_gst_list"].map((x) => FlatGst.fromJson(x))),
        differantStateGstList: List<FlatGst>.from(
            json["differant_state_gst_list"].map((x) => FlatGst.fromJson(x))),
        flatGst: FlatGst.fromJson(json["flat_gst"]),
        isGstEnable: json["is_gst_enable"],
        isGstModuleEnable: json["is_gst_module_enable"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "carts": Map.from(packages).map(
            (k, v) => MapEntry<String, dynamic>(k, CartPackages.fromJson(v))),
        "same_state_gst_list":
            List<dynamic>.from(sameStateGstList.map((x) => x.toJson())),
        "differant_state_gst_list":
            List<dynamic>.from(differantStateGstList.map((x) => x.toJson())),
        "flat_gst": flatGst.toJson(),
        "is_gst_enable": isGstEnable,
        "is_gst_module_enable": isGstModuleEnable,
        "message": message,
      };
}

class CartPackages {
  CartPackages({
    required this.items,
    required this.shipping,
  });

  List<CheckoutItem> items;
  List<Shipping> shipping;

  factory CartPackages.fromJson(Map<String, dynamic> json) => CartPackages(
        items: List<CheckoutItem>.from(
            json["items"].map((x) => CheckoutItem.fromJson(x))),
        shipping: List<Shipping>.from(
            json["shipping"].map((x) => Shipping.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "shipping": List<dynamic>.from(shipping.map((x) => x.toJson())),
      };
}

class CheckoutItem {
  CheckoutItem({
    this.id,
    this.userId,
    this.sellerId,
    required this.productType,
    this.productId,
    this.qty,
    this.price,
    this.totalPrice,
    this.sku,
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
  dynamic totalPrice;
  dynamic sku;
  dynamic isSelect;
  dynamic shippingMethodId;
  SellerData seller;
  CustomerData customer;
  GiftCardData giftCard;
  SkuProduct product;

  factory CheckoutItem.fromJson(Map<String, dynamic> json) => CheckoutItem(
        id: json["id"],
        userId: json["user_id"],
        sellerId: json["seller_id"],
        productType: json["product_type"],
        productId: json["product_id"],
        qty: json["qty"],
        price: json["price"],
        totalPrice: json["total_price"],
        sku: json["sku"],
        isSelect: json["is_select"],
        shippingMethodId: json["shipping_method_id"],
        seller: json["seller"],
        customer: CustomerData.fromJson(json["customer"]),
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
        "sku": sku,
        "is_select": isSelect,
        "shipping_method_id": shippingMethodId,
        "seller": seller == null ? null : seller.toJson(),
        "customer": customer.toJson(),
        "gift_card": giftCard == null ? null : giftCard.toJson(),
        "product": product.toJson(),
      };
}
