// import 'dart:ffi';
import 'package:flutter/cupertino.dart';
import 'package:pizza_planet/utils.dart';

setCartString(name,qty,price) {
  var cartString="{";
  for (var v=0;v<name.length;v++){
    cartString+= name[v]+"|"+qty[v].toString()+"|"+price[v].toString()+",";
  }
  cartString+="}";
  // print(cartString);
  return cartString;
}

getCartString() async {
  List<String> name=[];
  List<int> qty=[];
  List<int> price=[];
  try {
    String myCartString = await SharedPref.getStringValuesSF("myCart");
    bool nameDone=false;
    bool qtyDone=false;
    String itemName="";
    String itemQty="";
    String itemPrice="";
    for (int v=0;v<myCartString.length;v++){
      if (myCartString[v]=="{" || myCartString[v]=="}"){
        continue;
      }
      else if (myCartString[v]==','){
        name.add(itemName);
        itemName="";
        qty.add(int.parse(itemQty));
        itemQty="";
        price.add(int.parse(itemPrice));
        itemPrice="";
        nameDone=false;
        qtyDone=false;
      }
      else if (myCartString[v]=='|') {
        nameDone==true;
      }
      else if (nameDone==false){
        itemName+=myCartString[v];
      }
      else if (myCartString[v]=='|'){
        qtyDone=true;
      }
      else if (qtyDone==false){
        itemQty+=myCartString[v];
      }
      else {
        itemPrice+=myCartString[v];
      }
      // print(myCartString[v]);
    }
  } catch (e) {
    print(e);
  }
  print(name);
  print(qty);
  print(price);
}

class CartProvider extends ChangeNotifier {

  final Map<String, int> _items = {};
  Map<String, int> get items => _items;

  List<String> cartItems = [];
  List<int> quantity = [];
  List<int> price = [];
  void addItem(String itemName, int itemPrice) {
    int i = cartItems.indexOf(itemName);
    if (i == -1 || itemPrice!=price[i]) {
      cartItems.add(itemName);
      quantity.add(1);
      price.add(itemPrice);
    }
    else {
      quantity[i] += 1;
    }
    notifyListeners();
    SharedPref.addStringToSF("myCart", setCartString(cartItems, quantity, price));
    // getCartString();
  }
}