class ParentCategory {
  ParentCategory({
    required this.id,
    required this.name,
    required this.slug,
    required this.parentId,
    required this.depthLevel,
    required this.icon,
    required this.createdAt,
    required this.updatedAt,
    required this.subCategories,
  });

  int id;
  String name;
  String slug;
  int parentId;
  int depthLevel;
  String icon;
  DateTime createdAt;
  DateTime updatedAt;
  List<ParentCategory> subCategories;

  factory ParentCategory.fromJson(Map<String, dynamic> json) => ParentCategory(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        parentId: json["parent_id"],
        depthLevel: json["depth_level"],
        icon: json["icon"] == null ? null : json["icon"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        subCategories: json["sub_categories"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "parent_id": parentId,
        "depth_level": depthLevel,
        "icon": icon == null ? null : icon,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "sub_categories": subCategories == null
            ? null
            : List<dynamic>.from(subCategories.map((x) => x.toJson())),
      };
}
