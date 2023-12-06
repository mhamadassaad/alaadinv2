// To parse this JSON data, do
//
//     final shippingMethodModel = shippingMethodModelFromJson(jsonString);

import 'dart:convert';

ShippingMethodModel shippingMethodModelFromJson(String str) =>
    ShippingMethodModel.fromJson(json.decode(str));

String shippingMethodModelToJson(ShippingMethodModel data) =>
    json.encode(data.toJson());

class ShippingMethodModel {
  ShippingMethodModel({
    required this.shippings,
    required this.msg,
  });

  List<Shipping> shippings;
  String msg;

  factory ShippingMethodModel.fromJson(Map<String, dynamic> json) =>
      ShippingMethodModel(
        shippings: List<Shipping>.from(
            json["shippings"].map((x) => Shipping.fromJson(x))),
        msg: json["msg"],
      );

  Map<String, dynamic> toJson() => {
        "shippings": List<dynamic>.from(shippings.map((x) => x.toJson())),
        "msg": msg,
      };
}

class Shipping {
  Shipping({
    required this.id,
    required this.methodName,
    required this.carrierId,
    required this.costBasedOn,
    this.logo,
    required this.phone,
    required this.shipmentTime,
    required this.cost,
    required this.minimumShopping,
    required this.isActive,
    required this.requestByUser,
    required this.isApproved,
    required this.createdAt,
    required this.updatedAt,
    required this.carrier,
  });

  int id;
  String methodName;
  int carrierId;
  String costBasedOn;
  dynamic logo;
  String phone;
  String shipmentTime;
  double cost;
  double minimumShopping;
  int isActive;
  int requestByUser;
  int isApproved;
  DateTime createdAt;
  DateTime updatedAt;
  Carrier carrier;

  factory Shipping.fromJson(Map<String, dynamic> json) => Shipping(
        id: json["id"],
        methodName: json["method_name"],
        carrierId: json["carrier_id"],
        costBasedOn: json["cost_based_on"],
        logo: json["logo"],
        phone: json["phone"] == null ? null : json["phone"],
        shipmentTime: json["shipment_time"],
        cost: json["cost"].toDouble(),
        minimumShopping: json["minimum_shopping"].toDouble(),
        isActive: json["is_active"],
        requestByUser: json["request_by_user"],
        isApproved: json["is_approved"],
        createdAt: json["created_at"],
        updatedAt: DateTime.parse(json["updated_at"]),
        carrier: json["carrier"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "method_name": methodName,
        "carrier_id": carrierId,
        "cost_based_on": costBasedOn,
        "logo": logo,
        "phone": phone == null ? null : phone,
        "shipment_time": shipmentTime,
        "cost": cost,
        "minimum_shopping": minimumShopping,
        "is_active": isActive,
        "request_by_user": requestByUser,
        "is_approved": isApproved,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "carrier": carrier.toJson(),
      };
}

class Carrier {
  Carrier({
    required this.id,
    required this.name,
    this.logo,
    required this.type,
    required this.slug,
    this.trackingUrl,
    required this.status,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String name;
  dynamic logo;
  String type;
  String slug;
  dynamic trackingUrl;
  int status;
  dynamic createdAt;
  dynamic updatedAt;

  factory Carrier.fromJson(Map<String, dynamic> json) => Carrier(
        id: json["id"],
        name: json["name"],
        logo: json["logo"],
        type: json["type"],
        slug: json["slug"],
        trackingUrl: json["tracking_url"],
        status: json["status"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "logo": logo,
        "type": type,
        "slug": slug,
        "tracking_url": trackingUrl,
        "status": status,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
