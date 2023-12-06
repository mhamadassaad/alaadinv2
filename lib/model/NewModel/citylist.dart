class AllCity {
  int id;
  String code;
  String name;
  String phonecode;
  String flag;
  int status;
  dynamic createdAt;
  dynamic updatedAt;

  AllCity({
    required this.id,
    required this.code,
    required this.name,
    required this.phonecode,
    required this.flag,
    required this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory AllCity.fromJson(Map<String, dynamic> json) {
    return AllCity(
      id: json["id"],
      code: json["code"],
      name: json["name"],
      phonecode: json["phonecode"],
      flag: json["flag"] == null ? null : json["flag"],
      status: json["status"],
      createdAt: json["created_at"],
      updatedAt: json["updated_at"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "code": code,
        "name": name,
        "phonecode": phonecode,
        "flag": flag == null ? null : flag,
        "status": status,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}

class CityList {
  List<AllCity> cities = [];

  CityList({required this.cities});

  factory CityList.fromJson(List<dynamic> json) {
    List<AllCity> cityList;

    cityList = json.map((i) => AllCity.fromJson(i)).toList();

    return CityList(cities: cityList);
  }
}
