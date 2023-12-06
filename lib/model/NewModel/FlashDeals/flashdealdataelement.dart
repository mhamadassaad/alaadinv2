import 'package:amazcart/model/NewModel/Product/productmodel.dart';

class FlashDealDataElement {
  FlashDealDataElement({
    required this.id,
    required this.flashDealId,
    required this.sellerProductId,
    required this.discount,
    required this.discountType,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.product,
  });

  int id;
  int flashDealId;
  int sellerProductId;
  int discount;
  int discountType;
  int status;
  DateTime createdAt;
  DateTime updatedAt;
  ProductModel product;

  factory FlashDealDataElement.fromJson(Map<String, dynamic> json) =>
      FlashDealDataElement(
        id: json["id"],
        flashDealId: json["flash_deal_id"],
        sellerProductId: json["seller_product_id"],
        discount: json["discount"],
        discountType: json["discount_type"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        product: ProductModel.fromJson(json["product"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "flash_deal_id": flashDealId,
        "seller_product_id": sellerProductId,
        "discount": discount,
        "discount_type": discountType,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "product": product.toJson(),
      };
}
