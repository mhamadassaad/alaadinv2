// To parse this JSON data, do
//
//     final generalSettingsModel = generalSettingsModelFromJson(jsonString);

import 'dart:convert';

import 'package:amazcart/model/NewModel/currency.dart';
import 'package:amazcart/model/NewModel/shippingmethodmodel.dart';

GeneralSettingsModel generalSettingsModelFromJson(String str) =>
    GeneralSettingsModel.fromJson(json.decode(str));

String generalSettingsModelToJson(GeneralSettingsModel data) =>
    json.encode(data.toJson());

class GeneralSettingsModel {
  GeneralSettingsModel({
    required this.settings,
    required this.currencies,
    required this.vendorType,
    required this.otpConfiguration,
    required this.modules,
    required this.pickupLocations,
    required this.freeShipping,
    required this.msg,
  });

  Setting settings;
  List<Currency> currencies;
  String vendorType;
  List<OtpConfiguration> otpConfiguration;
  Map<String, bool> modules;
  List<PickupLocation> pickupLocations;
  Shipping freeShipping;
  String msg;

  factory GeneralSettingsModel.fromJson(Map<String, dynamic> json) =>
      GeneralSettingsModel(
        settings: Setting.fromJson(json['settings']),
        currencies: List<Currency>.from(
            json["currencies"].map((x) => Currency.fromJson(x))),
        vendorType: json["vendorType"],
        freeShipping: json["free_shipping"],
        pickupLocations: json["pickup_locations"],
        otpConfiguration: json["otp_configuration"],
        modules: json["modules"],
        msg: json["msg"],
      );

  Map<String, dynamic> toJson() => {
        "settings": settings.toJson(),
        "currencies": List<dynamic>.from(currencies.map((x) => x.toJson())),
        "vendorType": vendorType,
        "pickup_locations":
            List<dynamic>.from(pickupLocations.map((x) => x.toJson())),
        "free_shipping": freeShipping == null ? null : freeShipping.toJson(),
        "otp_configuration": otpConfiguration == null
            ? null
            : List<dynamic>.from(otpConfiguration.map((x) => x.toJson())),
        "modules":
            Map.from(modules).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "msg": msg,
      };
}

class Setting {
  Setting({
    required this.siteTitle,
    required this.companyName,
    required this.countryName,
    required this.zipCode,
    required this.address,
    required this.phone,
    required this.email,
    required this.currencySymbol,
    required this.logo,
    required this.favicon,
    required this.currencyCode,
    required this.copyrightText,
    required this.languageCode,
    required this.cityId,
    required this.countryId,
    required this.stateId,
  });

  String siteTitle;
  String companyName;
  String countryName;
  String zipCode;
  String address;
  String phone;
  String email;
  String currencySymbol;
  String logo;
  String favicon;
  String currencyCode;
  String copyrightText;
  String languageCode;
  int countryId;
  int stateId;
  int cityId;

  factory Setting.fromJson(Map<String, dynamic> json) => Setting(
        siteTitle: json["site_title"],
        companyName: json["company_name"],
        countryName: json["country_name"],
        zipCode: json["zip_code"],
        address: json["address"],
        phone: json["phone"],
        email: json["email"],
        currencySymbol: json["currency_symbol"],
        logo: json["logo"],
        favicon: json["favicon"],
        currencyCode: json["currency_code"],
        copyrightText: json["copyright_text"],
        languageCode: json["language_code"],
        countryId: json["country_id"],
        stateId: json["state_id"],
        cityId: json["city_id"],
      );

  Map<String, dynamic> toJson() => {
        "site_title": siteTitle,
        "company_name": companyName,
        "country_name": countryName,
        "zip_code": zipCode,
        "address": address,
        "phone": phone,
        "email": email,
        "currency_symbol": currencySymbol,
        "logo": logo,
        "favicon": favicon,
        "currency_code": currencyCode,
        "copyright_text": copyrightText,
        "language_code": languageCode,
        "country_id": countryId,
        "state_id": stateId,
        "city_id": cityId,
      };
}

class OtpConfiguration {
  OtpConfiguration({
    required this.type,
    this.value,
  });

  String type;
  dynamic value;

  factory OtpConfiguration.fromJson(Map<String, dynamic> json) =>
      OtpConfiguration(
        type: json["type"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "value": value,
      };
}

class PickupLocation {
  PickupLocation({
    required this.id,
    required this.pickupLocation,
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    this.address2,
    required this.cityId,
    required this.stateId,
    required this.countryId,
    required this.pinCode,
    required this.status,
    required this.isDefault,
  });

  int id;
  String pickupLocation;
  String name;
  String email;
  String phone;
  String address;
  dynamic address2;
  int cityId;
  int stateId;
  int countryId;
  int pinCode;
  int status;
  int isDefault;

  factory PickupLocation.fromJson(Map<String, dynamic> json) => PickupLocation(
        id: json["id"],
        pickupLocation: json["pickup_location"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        address: json["address"],
        address2: json["address_2"],
        cityId: json["city_id"],
        stateId: json["state_id"],
        countryId: json["country_id"],
        pinCode: json["pin_code"],
        status: json["status"],
        isDefault: json["is_default"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "pickup_location": pickupLocation,
        "name": name,
        "email": email,
        "phone": phone,
        "address": address,
        "address_2": address2,
        "city_id": cityId,
        "state_id": stateId,
        "country_id": countryId,
        "pin_code": pinCode,
        "status": status,
        "is_default": isDefault,
      };
}