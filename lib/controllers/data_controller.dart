import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:taskapp/models/Deal_of_days_model.dart';
import 'package:taskapp/models/address_model.dart';
import 'package:taskapp/models/category_model.dart';
import 'package:taskapp/models/offer_model.dart';


final getAllData =
    ChangeNotifierProvider<DataController>((ref) => DataController());

class DataController extends ChangeNotifier {
  List<Address> addressItemsList = [];
  List<Category> categoryItemsList = [];
  List<Deal> dealItemsList = [];
  List<Offer> offerItemsList = [];
  List<Deal> cartItemsList = [];
  double total = 0.0;

  DataController() {
    fetchAddressData();
    fetchCategoriesData();
    fetchDealsData();
    fetchOffersData();
    fetchCartItems();
  }

/////fetch data from mock json  functions start
  fetchAddressData() async {
    String data = await rootBundle.loadString(
      "assets/data/import_address.json",
    );
    addressItemsList = AddressesModel.fromJson(json.decode(data)).addresses;
    //print('${addressItemsList.length}....datat');
    notifyListeners();
  }

  fetchCategoriesData() async {
    String data = await rootBundle.loadString(
      "assets/data/import_category.json",
    );
    categoryItemsList = CategoriesModel.fromJson(json.decode(data)).categories;
    notifyListeners();
  }

  fetchDealsData() async {
    String data = await rootBundle.loadString(
      "assets/data/import_deals_of_day.json",
    );
    dealItemsList = DealsModel.fromJson(json.decode(data)).deals;
    notifyListeners();
  }

  fetchOffersData() async {
    String data = await rootBundle.loadString(
      "assets/data/import_offers.json",
    );
    offerItemsList = OfersModel.fromJson(json.decode(data)).offers;
    notifyListeners();
  }

  /////fetch data from mock json  functions end

  /////cart   functions start
  addDealToCart(Deal deal) {
    if (deal.isAddedToCArt == true) {
      Fluttertoast.showToast(
          msg: "the deal is already added",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      Fluttertoast.showToast(
          msg: "the deal is added successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      deal.isAddedToCArt = true;
      fetchCartItems();
      getTotalOfDeals();
      notifyListeners();
    }
  }

  fetchCartItems() {
    cartItemsList.clear();
    for (var element in dealItemsList) {
      if (element.isAddedToCArt == true) {
        cartItemsList.add(element);
      }
    }
    notifyListeners();
  }

  plusCounterDeal(Deal deal) {
    deal.count++;
     getTotalOfDeals();
    notifyListeners();
  }

  minusCounterDeal(Deal deal) {
    if (deal.count > 1) {
      deal.count--;
    }
     getTotalOfDeals();
    notifyListeners();
  }

  getTotalOfDeals() {
    total = 0.0;
     for (var element in cartItemsList) {
      total = total + (double.parse(element.newPrice) * element.count);
    }
    notifyListeners();

  }

/////cart   functions end
  /////favorite   functions start
  addAndDeleteFromFavorite(Deal deal) {
    deal.isFavorite = !deal.isFavorite;
    notifyListeners();
  }
/////favorite   functions end
}
