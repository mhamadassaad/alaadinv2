import 'AttributeColor.dart';

class AttributeValue {
  AttributeValue({
    required this.id,
    required this.value,
    required this.attributeId,
    required this.createdAt,
    required this.updatedAt,
    required this.color,
  });

  int id;
  String value;
  int attributeId;
  DateTime createdAt;
  DateTime updatedAt;
  AttributeColor color;

  factory AttributeValue.fromJson(Map<String, dynamic> json) => AttributeValue(
        id: json["id"],
        value: json["value"],
        attributeId: json["attribute_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"],
        color: json["color"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "value": value,
        "attribute_id": attributeId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "color": color == null ? null : color.toJson(),
      };
}
