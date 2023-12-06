import 'package:amazcart/model/NewModel/Brand/BrandData.dart';
import 'package:amazcart/model/NewModel/Category/CategoryData.dart';
import 'package:amazcart/model/NewModel/Product/GstGroup.dart';
import 'package:amazcart/model/NewModel/Product/RelatedProduct.dart';
import 'package:amazcart/model/NewModel/Product/UpSalesProduct.dart';
import 'package:amazcart/model/NewModel/Product/crosssaleproduct.dart';
import 'package:amazcart/model/NewModel/ShippingMethod/ShippingMethodElement.dart';
import 'package:amazcart/model/NewModel/Tags/TagData.dart';

import 'GalleryImageData.dart';
import 'ProductSkus.dart';

class Product {
  Product({
    this.id,
    required this.productName,
    this.productType,
    this.unitTypeId,
    this.brandId,
    this.categoryId,
    required this.thumbnailImageSource,
    required this.barcodeType,
    required this.modelNumber,
    this.shippingType,
    this.shippingCost,
    required this.discountType,
    this.discount,
    required this.taxType,
    required this.tax,
    required this.pdf,
    required this.videoProvider,
    required this.videoLink,
    required this.description,
    required this.specification,
    this.minimumOrderQty,
    this.maxOrderQty,
    required this.metaTitle,
    required this.metaDescription,
    this.metaImage,
    this.isPhysical,
    this.isApproved,
    this.status,
    this.displayInDetails,
    this.requestedBy,
    this.createdBy,
    required this.skus,
    required this.brand,
    required this.categories,
    required this.tags,
    required this.gallaryImages,
    required this.shippingMethods,
    required this.relatedProducts,
    required this.upSalesProducts,
    required this.crossSalesProducts,
    required this.gstGroup,
  });

  dynamic id;
  String productName;
  dynamic productType;
  dynamic unitTypeId;
  dynamic brandId;
  dynamic categoryId;
  String thumbnailImageSource;
  String barcodeType;
  String modelNumber;
  dynamic shippingType;
  dynamic shippingCost;
  String discountType;
  dynamic discount;
  String taxType;
  double tax;
  dynamic pdf;
  String videoProvider;
  String videoLink;
  String description;
  String specification;
  dynamic minimumOrderQty;
  dynamic maxOrderQty;
  String metaTitle;
  String metaDescription;
  dynamic metaImage;
  dynamic isPhysical;
  dynamic isApproved;
  dynamic status;
  dynamic displayInDetails;
  dynamic requestedBy;
  dynamic createdBy;
  List<ProductSku> skus;
  BrandData brand;
  List<CategoryData> categories;
  List<TagData> tags;
  List<GalleryImageData> gallaryImages;
  List<ShippingMethodElement> shippingMethods;
  List<RelatedProduct> relatedProducts;
  List<UpSalesProduct> upSalesProducts;
  List<CrossSalesProduct> crossSalesProducts;
  GstGroup gstGroup;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        productName: json["product_name"],
        productType: json["product_type"],
        unitTypeId: json["unit_type_id"],
        brandId: json["brand_id"] == null ? null : json["brand_id"],
        categoryId: json["category_id"],
        thumbnailImageSource: json["thumbnail_image_source"],
        barcodeType: json["barcode_type"],
        modelNumber: json["model_number"] == null ? null : json["model_number"],
        shippingType: json["shipping_type"],
        shippingCost: json["shipping_cost"],
        discountType: json["discount_type"],
        discount: json["discount"],
        taxType: json["tax_type"],
        tax: json["tax"].toDouble(),
        pdf: json["pdf"] == null ? null : json["pdf"],
        videoProvider: json["video_provider"],
        videoLink: json["video_link"] == null ? null : json["video_link"],
        description: json["description"] == null ? null : json["description"],
        specification:
            json["specification"] == null ? null : json["specification"],
        minimumOrderQty: json["minimum_order_qty"],
        maxOrderQty:
            json["max_order_qty"] == null ? null : json["max_order_qty"],
        metaTitle: json["meta_title"] == null ? null : json["meta_title"],
        metaDescription:
            json["meta_description"] == null ? null : json["meta_description"],
        metaImage: json["meta_image"],
        isPhysical: json["is_physical"],
        isApproved: json["is_approved"],
        status: json["status"],
        displayInDetails: json["display_in_details"],
        requestedBy: json["requested_by"],
        createdBy: json["created_by"],
        gstGroup: json["gst_group"],
        skus: json["skus"],
        brand: json["brand"],
        categories: json["categories"],
        tags: json["tags"],
        gallaryImages: json["gallary_images"],
        shippingMethods: json["shipping_methods"],
        relatedProducts: json["related_products"],
        upSalesProducts: json["up_sales"],
        crossSalesProducts: json["cross_sales"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_name": productName,
        "product_type": productType,
        "unit_type_id": unitTypeId,
        "brand_id": brandId == null ? null : brandId,
        "category_id": categoryId,
        "thumbnail_image_source": thumbnailImageSource,
        "barcode_type": barcodeType,
        "model_number": modelNumber == null ? null : modelNumber,
        "shipping_type": shippingType,
        "shipping_cost": shippingCost,
        "discount_type": discountType,
        "discount": discount,
        "tax_type": taxType,
        "tax": tax,
        "pdf": pdf,
        "video_provider": videoProvider,
        "gst_group": gstGroup == null ? null : gstGroup,
        "video_link": videoLink == null ? null : videoLink,
        "description": description == null ? null : description,
        "specification": specification == null ? null : specification,
        "minimum_order_qty": minimumOrderQty,
        "max_order_qty": maxOrderQty == null ? null : maxOrderQty,
        "meta_title": metaTitle == null ? null : metaTitle,
        "meta_description": metaDescription,
        "meta_image": metaImage,
        "is_physical": isPhysical,
        "is_approved": isApproved,
        "status": status,
        "display_in_details": displayInDetails,
        "requested_by": requestedBy,
        "created_by": createdBy,
        "brand": brand == null ? null : brand.toJson(),
        "categories": categories == null
            ? null
            : List<dynamic>.from(categories.map((x) => x.toJson())),
        "tags": tags == null
            ? null
            : List<dynamic>.from(tags.map((x) => x.toJson())),
        "gallary_images": gallaryImages == null
            ? null
            : List<dynamic>.from(gallaryImages.map((x) => x.toJson())),
        "shipping_methods": shippingMethods == null
            ? null
            : List<dynamic>.from(shippingMethods.map((x) => x.toJson())),
        "related_products": relatedProducts == null
            ? null
            : List<dynamic>.from(relatedProducts.map((x) => x.toJson())),
      };
}
