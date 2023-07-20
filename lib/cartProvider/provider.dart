// import 'dart:ffi';
import 'package:flutter/cupertino.dart';
import 'package:pizza_planet/utils.dart';

class CartProvider extends ChangeNotifier {
  final Map<String, int> _items = {};
  Map<String, int> get items => _items;

  List<String> cartItems = [];
  List<int> quantity = [];
  List<int> price = [];
  void addItem(String itemName, int itemPrice) {
    int i = cartItems.indexOf(itemName);
    if (i == -1 || itemPrice != price[i]) {
      cartItems.add(itemName);
      quantity.add(1);
      price.add(itemPrice);
    } else {
      quantity[i] += 1;
    }
    notifyListeners();
  }

  void removeItem(String itemName) {
    int i = cartItems.indexOf(itemName);
    quantity[i] -= 1;
    if (quantity[i] == 0) {
      cartItems.removeAt(i);
      quantity.removeAt(i);
      price.removeAt(i);
    }
    notifyListeners();
  }

  void empty_cart(){
    cartItems = []; quantity = []; price = [];
    notifyListeners();
  }
}
