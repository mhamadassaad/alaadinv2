// To parse this JSON data, do
//
//     final customerAddress = customerAddressFromJson(jsonString);

import 'dart:convert';

CustomerAddress customerAddressFromJson(String str) =>
    CustomerAddress.fromJson(json.decode(str));

String customerAddressToJson(CustomerAddress data) =>
    json.encode(data.toJson());

class CustomerAddress {
  CustomerAddress({
    required this.addresses,
    required this.message,
  });

  List<Address> addresses;
  String message;

  factory CustomerAddress.fromJson(Map<String, dynamic> json) =>
      CustomerAddress(
        addresses: List<Address>.from(
            json["addresses"].map((x) => Address.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "addresses": List<dynamic>.from(addresses.map((x) => x.toJson())),
        "message": message,
      };
}

class Address {
  Address({
    required this.id,
    required this.customerId,
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    required this.city,
    required this.state,
    required this.country,
    required this.postalCode,
    required this.isShippingDefault,
    required this.isBillingDefault,
    required this.createdAt,
    required this.updatedAt,
    required this.getCountry,
    required this.getState,
    required this.getCity,
  });

  int id;
  int customerId;
  String name;
  String email;
  String phone;
  String address;
  String city;
  String state;
  String country;
  String postalCode;
  int isShippingDefault;
  int isBillingDefault;
  DateTime createdAt;
  DateTime updatedAt;
  GetCountry getCountry;
  GetStateOrCity getState;
  GetStateOrCity getCity;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        id: json["id"],
        customerId: json["customer_id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        address: json["address"],
        city: json["city"],
        state: json["state"],
        country: json["country"],
        postalCode: json["postal_code"],
        isShippingDefault: json["is_shipping_default"],
        isBillingDefault: json["is_billing_default"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        getCountry: json["get_country"],
        getState: json["get_state"],
        getCity: json["get_city"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "customer_id": customerId,
        "name": name,
        "email": email,
        "phone": phone,
        "address": address,
        "city": city,
        "state": state,
        "country": country,
        "postal_code": postalCode,
        "is_shipping_default": isShippingDefault,
        "is_billing_default": isBillingDefault,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "get_country": getCountry.toJson(),
        "get_state": getState.toJson(),
        "get_city": getCity.toJson(),
      };
}

class GetStateOrCity {
  GetStateOrCity({
    required this.id,
    required this.name,
    required this.stateId,
    required this.status,
    this.createdAt,
    this.updatedAt,
    required this.countryId,
  });

  int id;
  String name;
  int stateId;
  int status;
  dynamic createdAt;
  dynamic updatedAt;
  int countryId;

  factory GetStateOrCity.fromJson(Map<String, dynamic> json) => GetStateOrCity(
        id: json["id"],
        name: json["name"],
        stateId: json["state_id"] == null ? null : json["state_id"],
        status: json["status"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        countryId: json["country_id"] == null ? null : json["country_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "state_id": stateId == null ? null : stateId,
        "status": status,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "country_id": countryId == null ? null : countryId,
      };
}

class GetCountry {
  GetCountry({
    required this.id,
    required this.code,
    required this.name,
    required this.phonecode,
    required this.flag,
    required this.status,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String code;
  String name;
  String phonecode;
  String flag;
  int status;
  dynamic createdAt;
  dynamic updatedAt;

  factory GetCountry.fromJson(Map<String, dynamic> json) => GetCountry(
        id: json["id"],
        code: json["code"],
        name: json["name"],
        phonecode: json["phonecode"],
        flag: json["flag"],
        status: json["status"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "code": code,
        "name": name,
        "phonecode": phonecode,
        "flag": flag,
        "status": status,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
