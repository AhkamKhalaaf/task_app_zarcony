// To parse this JSON data, do
//
//     final addressesModel = addressesModelFromJson(jsonString);

import 'dart:convert';

AddressesModel addressesModelFromJson(String str) =>
    AddressesModel.fromJson(json.decode(str));

String addressesModelToJson(AddressesModel data) => json.encode(data.toJson());

class AddressesModel {
  AddressesModel({
    required this.addresses,
  });

  List<Address> addresses;

  factory AddressesModel.fromJson(Map<String, dynamic> json) => AddressesModel(
        addresses: List<Address>.from(
            json["addresses"].map((x) => Address.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "addresses": List<dynamic>.from(addresses.map((x) => x.toJson())),
      };
}

class Address {
  Address({
    required this.name,
    required this.region,
    required this.street,
    required this.color,
  });

  String name;
  String region;
  String street;
  String color;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        name: json["name"],
        region: json["region"],
        street: json["street"],
        color: json["color"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "region": region,
        "street": street,
        "color": color,
      };
}
