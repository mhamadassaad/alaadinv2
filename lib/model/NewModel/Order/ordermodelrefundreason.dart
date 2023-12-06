// To parse this JSON data, do
//
//     final orderRefundReasonModel = orderRefundReasonModelFromJson(jsonString);

import 'dart:convert';

OrderRefundReasonModel orderRefundReasonModelFromJson(String str) =>
    OrderRefundReasonModel.fromJson(json.decode(str));

String orderRefundReasonModelToJson(OrderRefundReasonModel data) =>
    json.encode(data.toJson());

class OrderRefundReasonModel {
  OrderRefundReasonModel({
    required this.reasons,
    required this.measege,
  });

  List<RefundReason> reasons;
  String measege;

  factory OrderRefundReasonModel.fromJson(Map<String, dynamic> json) =>
      OrderRefundReasonModel(
        reasons: List<RefundReason>.from(
            json["reasons"].map((x) => RefundReason.fromJson(x))),
        measege: json["measege"],
      );

  Map<String, dynamic> toJson() => {
        "reasons": List<dynamic>.from(reasons.map((x) => x.toJson())),
        "measege": measege,
      };
}

class RefundReason {
  late final DateTime createdAt;
  late final DateTime updatedAt;
  RefundReason(
      {required this.id,
      required this.reason,
      required this.createdAt,
      required this.updatedAt});

  int id;
  String reason;

  factory RefundReason.fromJson(Map<String, dynamic> json) => RefundReason(
        id: json["id"],
        reason: json["reason"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "reason": reason,
      };
}
