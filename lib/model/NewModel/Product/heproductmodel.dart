// import 'package:amazcart/model/NewModel/Product/GalleryImageData.dart';
// import 'package:amazcart/model/NewModel/Product/ProductType.dart';
// import 'package:amazcart/model/NewModel/Product/ProductVariantDetail.dart';
// import 'package:amazcart/model/NewModel/Seller/SellerData.dart';

// import 'HasDeal.dart';
// import 'ProductData.dart';
// import 'Review.dart';
// import 'Skus.dart';

class HeProductModel {
  HeProductModel({
    required this.productId,
    this.productName,
    this.thumImg,
    this.sellingPrice,
    this.hasDiscount,
    this.discountPrice,
    this.stock,
    this.url,
  });

  int productId;
  dynamic productName;
  dynamic thumImg;
  dynamic sellingPrice;
  dynamic hasDiscount;
  dynamic discountPrice;
  dynamic stock;
  dynamic url;

  factory HeProductModel.fromJson(Map<String, dynamic> json) => HeProductModel(
        productId: json['id'],
        productName: json["product_name"],
        thumImg: json["thumb_img"],
        hasDiscount: json['hasDiscount'],
        discountPrice: json['discount_price'],
        stock: json['stock'],
        url: json['url'],
      );

  Map<String, dynamic> toJson() => {
        "id": productId,
        "product_name": productName,
        "thumb_img": thumImg,
        "selling_price": sellingPrice,
        "hasDiscount": hasDiscount,
        "discount_price": discountPrice,
        "stock": stock,
        "url": url
      };
}
