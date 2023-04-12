import 'package:flutter/cupertino.dart';
import 'dart:convert';

class CartProvider extends ChangeNotifier {
  final Map<String, int> _items = {};
  Map<String, int> get items => _items;

  List<String> cartItems = [];
  List<int> quantity = [];
  List<int> price = [];

  void addItem(String itemName, int itemPrice) {
    int i = cartItems.indexOf(itemName);
    if (i == -1) {
      cartItems.add(itemName);
      quantity.add(1);
      price.add(itemPrice);
    }
    else {
      quantity[i] += 1;
    }

    notifyListeners();
  }

}