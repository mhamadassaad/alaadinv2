import 'package:amazcart/model/NewModel/Customer/CustomerData.dart';
import 'package:amazcart/model/NewModel/Product/producttype.dart';

class Review {
  Review({
    required this.id,
    required this.customerId,
    required this.sellerId,
    required this.productId,
    required this.orderId,
    required this.packageId,
    required this.type,
    required this.review,
    required this.rating,
    required this.isAnonymous,
    required this.status,
    required this.customer,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  int customerId;
  int sellerId;
  int productId;
  int orderId;
  int packageId;
  ProductType type;
  String review;
  int rating;
  int isAnonymous;
  int status;
  DateTime createdAt;
  DateTime updatedAt;
  CustomerData customer;

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        id: json["id"],
        customerId: json["customer_id"],
        sellerId: json["seller_id"],
        productId: json["product_id"],
        orderId: json["order_id"],
        packageId: json["package_id"],
        type: json["type"],
        review: json["review"],
        rating: json["rating"],
        isAnonymous: json["is_anonymous"],
        status: json["status"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        customer: json["customer"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "customer_id": customerId,
        "seller_id": sellerId,
        "product_id": productId,
        "order_id": orderId,
        "package_id": packageId,
        "type": [type],
        "review": review,
        "rating": rating,
        "is_anonymous": isAnonymous,
        "status": status,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": createdAt == null ? null : updatedAt.toIso8601String(),
        "customer": customer == null ? null : customer.toJson(),
      };
}
