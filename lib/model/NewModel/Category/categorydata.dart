import 'package:amazcart/model/NewModel/Category/parentCategory.dart';

import '../Product/allproducts.dart';
import 'CategoryImage.dart';

class CategoryData {
  CategoryData({
    required this.id,
    required this.name,
    required this.slug,
    required this.parentId,
    required this.depthLevel,
    required this.icon,
    required this.searchable,
    required this.status,
    required this.allProducts,
    required this.categoryImage,
    required this.parentCategory,
    required this.subCategories,
  });

  int id;
  String name;
  String slug;
  int parentId;
  int depthLevel;
  String icon;
  int searchable;
  int status;
  AllProducts allProducts;
  CategoryImage categoryImage;
  ParentCategory parentCategory;
  List<ParentCategory> subCategories;

  factory CategoryData.fromJson(Map<String, dynamic> json) => CategoryData(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        parentId: json["parent_id"],
        depthLevel: json["depth_level"],
        icon: json["icon"] == null ? null : json["icon"],
        searchable: json["searchable"],
        status: json["status"],
        allProducts: json["AllProducts"],
        categoryImage: json["category_image"],
        parentCategory: json["parent_category"],
        subCategories: json["sub_categories"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "parent_id": parentId,
        "depth_level": depthLevel,
        "icon": icon == null ? null : icon,
        "searchable": searchable,
        "status": status,
        "AllProducts": allProducts == null ? null : allProducts.toJson(),
        "category_image": categoryImage == null ? null : categoryImage.toJson(),
        "parent_category":
            parentCategory == null ? null : parentCategory.toJson(),
        "sub_categories": subCategories == null
            ? null
            : List<dynamic>.from(subCategories.map((x) => x.toJson())),
      };
}
