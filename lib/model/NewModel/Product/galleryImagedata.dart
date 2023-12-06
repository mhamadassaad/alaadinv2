class GalleryImageData {
  GalleryImageData({
    required this.id,
    required this.productId,
    required this.giftCardId,
    required this.imagesSource,
    required this.giftCardImage,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  int productId;
  int giftCardId;
  String imagesSource;
  String giftCardImage;
  DateTime createdAt;
  DateTime updatedAt;

  factory GalleryImageData.fromJson(Map<String, dynamic> json) =>
      GalleryImageData(
        id: json["id"],
        productId: json["product_id"] ?? 0,
        giftCardId: json["gift_card_id"] ?? 0,
        imagesSource: json["images_source"] ?? "",
        giftCardImage: json["image_name"] ?? "",
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "images_source": imagesSource,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
