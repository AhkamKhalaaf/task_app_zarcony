// To parse this JSON data, do
//
//     final ofersModel = ofersModelFromJson(jsonString);

import 'dart:convert';

OfersModel ofersModelFromJson(String str) =>
    OfersModel.fromJson(json.decode(str));

String ofersModelToJson(OfersModel data) => json.encode(data.toJson());

class OfersModel {
  OfersModel({
    required this.offers,
  });

  List<Offer> offers;

  factory OfersModel.fromJson(Map<String, dynamic> json) => OfersModel(
        offers: List<Offer>.from(json["offers"].map((x) => Offer.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "offers": List<dynamic>.from(offers.map((x) => x.toJson())),
      };
}

class Offer {
  Offer({
    required this.name,
    required this.description,
    required this.until,
    required this.newPrice,
    required this.oldPrice,
    required this.color,
  });

  String name;
  String description;
  String until;
  String newPrice;
  String oldPrice;
  String color;

  factory Offer.fromJson(Map<String, dynamic> json) => Offer(
        name: json["name"],
        description: json["description"],
        until: json["until"],
        newPrice: json["newPrice"],
        oldPrice: json["oldPrice"],
        color: json["color"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "until": until,
        "newPrice": newPrice,
        "oldPrice": oldPrice,
        "color": color,
      };
}
