// ignore: file_names

// ignore_for_file: file_names

import 'dart:convert';

DealsModel dealsModelFromJson(String str) =>
    DealsModel.fromJson(json.decode(str));

String dealsModelToJson(DealsModel data) => json.encode(data.toJson());

class DealsModel {
  DealsModel({
    required this.deals,
  });

  List<Deal> deals;

  factory DealsModel.fromJson(Map<String, dynamic> json) => DealsModel(
        deals: List<Deal>.from(json["deals"].map((x) => Deal.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "deals": List<dynamic>.from(deals.map((x) => x.toJson())),
      };
}

class Deal {
  Deal({
    required this.name,
    required this.pieces,
    required this.place,
    required this.newPrice,
    required this.oldPrice,
    required this.color,
  });

  String name;
  String pieces;
  String place;
  String newPrice;
  String oldPrice;
  String color;
  int count = 1;
  bool isAddedToCArt = false;
  bool isFavorite = false;

  factory Deal.fromJson(Map<String, dynamic> json) => Deal(
        name: json["name"],
        pieces: json["pieces"],
        place: json["place"],
        newPrice: json["newPrice"],
        oldPrice: json["oldPrice"],
        color: json["color"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "pieces": pieces,
        "place": place,
        "newPrice": newPrice,
        "oldPrice": oldPrice,
        "color": color,
      };
}
