import 'package:amazcart/model/NewModel/Product/GalleryImageData.dart';
import 'package:amazcart/model/NewModel/Product/producttype.dart';
import 'package:amazcart/model/NewModel/Product/productvariantdetail.dart';
import 'package:amazcart/model/NewModel/Seller/SellerData.dart';

import 'HasDeal.dart';
import 'ProductData.dart';
import 'Review.dart';
import 'Skus.dart';

class ProductModel {
  ProductModel(
      {this.id,
      this.userId,
      this.productId,
      this.tax,
      required this.taxType,
      required this.discount,
      this.discountType,
      this.discountStartDate,
      this.discountEndDate,
      required this.productName,
      required this.slug,
      this.thumImg,
      this.status,
      this.stockManage,
      this.isApproved,
      this.minSellPrice,
      this.maxSellPrice,
      required this.totalSale,
      this.avgRating,
      required this.maxSellingPrice,
      this.rating,
      required this.hasDeal,
      required this.hasDiscount,
      required this.product,
      required this.skus,
      required this.reviews,
      required this.variantDetails,
      required this.flashDeal,
      required this.seller,
      required this.productType,
      required this.giftCardSellingPrice,
      required this.giftCardThumbnailImage,
      required this.giftCardStartDate,
      required this.giftCardEndDate,
      required this.giftCardSku,
      required this.giftCardName,
      required this.giftCardDescription,
      required this.giftCardGalleryImages});

  dynamic id;
  dynamic userId;
  dynamic productId;
  dynamic tax;
  String taxType;
  double discount;
  dynamic discountType;
  dynamic discountStartDate;
  dynamic discountEndDate;
  String productName;
  String slug;
  dynamic thumImg;
  dynamic status;
  dynamic stockManage;
  dynamic isApproved;
  dynamic minSellPrice;
  dynamic maxSellPrice;
  int totalSale;
  dynamic avgRating;
  double maxSellingPrice;
  dynamic rating;
  HasDeal hasDeal;
  String hasDiscount;
  Product product;
  List<Skus> skus;
  List<Review> reviews;
  List<ProductVariantDetail> variantDetails;
  HasDeal flashDeal;
  SellerData seller;
  ProductType productType;
  double giftCardSellingPrice;
  String giftCardThumbnailImage;
  DateTime giftCardStartDate;
  DateTime giftCardEndDate;
  String giftCardSku;
  String giftCardName;
  String giftCardDescription;
  List<GalleryImageData> giftCardGalleryImages;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        userId: json["user_id"],
        productId: json["product_id"],
        tax: json["tax"],
        taxType: json["tax_type"],
        discount: json["discount"] == null ? null : json["discount"].toDouble(),
        discountType: json["discount_type"].toString(),
        discountStartDate: json["discount_start_date"],
        discountEndDate: json["discount_end_date"],
        productName: json["product_name"],
        slug: json["slug"],
        thumImg: json["thum_img"],
        status: json["status"],
        stockManage: json["stock_manage"],
        isApproved: json["is_approved"],
        minSellPrice: json["min_sell_price"] == null
            ? null
            : json["min_sell_price"].toDouble(),
        maxSellPrice: json["max_sell_price"] == null
            ? null
            : json["max_sell_price"].toDouble(),
        totalSale: json["total_sale"],
        avgRating: json["avg_rating"],
        variantDetails: json["variantDetails"],
        maxSellingPrice: json["MaxSellingPrice"],
        hasDeal: json["hasDeal"],
        rating: json["rating"] == null ? null : json["rating"],
        hasDiscount: json['hasDiscount'],
        // product:
        //     json["product"] ,
        seller: json["seller"],
        reviews: json["reviews"],
        skus: json["skus"],
        giftCardSellingPrice: json["selling_price"] == null
            ? null
            : json["selling_price"].toDouble(),
        giftCardThumbnailImage:
            json["thumbnail_image"] == null ? null : json["thumbnail_image"],
        giftCardStartDate: json["start_date"],
        giftCardSku: json['sku'] == null ? null : json['sku'],
        giftCardName: json['name'] == null ? null : json['name'],
        giftCardDescription:
            json['description'] == null ? null : json['description'],
        giftCardGalleryImages: json["galary_images"],
        flashDeal: json["flashDeal"],
        giftCardEndDate: json["giftCardEndDate"],
        productType: json["productType"],
        product: json["product"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "product_id": productId,
        "tax": tax,
        "tax_type": taxType,
        "discount": discount,
        "discount_type": discountType,
        "discount_start_date": discountStartDate,
        "discount_end_date": discountEndDate,
        "product_name": productName,
        "slug": slug,
        "thum_img": thumImg,
        "status": status,
        "stock_manage": stockManage,
        "is_approved": isApproved,
        "min_sell_price": minSellPrice,
        "max_sell_price": maxSellPrice,
        "total_sale": totalSale,
        "avg_rating": avgRating,
        "MaxSellingPrice": maxSellingPrice,
        "rating": rating,
        "hasDiscount": hasDiscount,
        "hasDeal": hasDeal == null ? null : hasDeal.toJson(),
        "flash_deal": flashDeal == null ? null : flashDeal.toJson(),
        "product": product == null ? null : product.toJson(),
        "seller": seller == null ? null : seller.toJson(),
        "skus": skus == null
            ? null
            : List<dynamic>.from(skus.map((x) => x.toJson())),
        "reviews": reviews == null
            ? null
            : List<dynamic>.from(reviews.map((x) => x.toJson())),
        "start_date": giftCardStartDate == null
            ? null
            : "${giftCardStartDate.year.toString().padLeft(4, '0')}-${giftCardStartDate.month.toString().padLeft(2, '0')}-${giftCardStartDate.day.toString().padLeft(2, '0')}",
        "end_date": giftCardEndDate == null
            ? null
            : "${giftCardEndDate.year.toString().padLeft(4, '0')}-${giftCardEndDate.month.toString().padLeft(2, '0')}-${giftCardEndDate.day.toString().padLeft(2, '0')}",
        "sku": giftCardSku == null ? null : giftCardSku,
        "name": giftCardName == null ? null : giftCardName,
        "description": giftCardDescription == null ? null : giftCardDescription,
        "galary_images": giftCardGalleryImages == null
            ? null
            : List<dynamic>.from(giftCardGalleryImages.map((x) => x.toJson())),
      };
}
