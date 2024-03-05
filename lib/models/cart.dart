
import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier{

  // list of items on sale
  final List _shopItems=[
    ["Avocado","4.00","lib/images/avocado.png",Colors.green],
    ["Banana","2.50","lib/images/banana.png",Colors.yellow],
    ["Chicken","9.00","lib/images/chicken.png",Colors.orange],
    ["water","3.00","lib/images/water.png",Colors.lightBlue]
  ];
  get shopItems => _shopItems;
  //list of cart items

  List _cartItems=[];
  
  get cartItems=>_cartItems;

  void additem(int index){
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }
  void removeItem(int index){
    _cartItems.removeAt(index);
    notifyListeners();
  }
   String calculateTotal() {
    double totalPrice = 0;
    for (int i = 0; i < _cartItems.length; i++) {
      totalPrice += double.parse(_cartItems[i][1].toString());
    }
    return totalPrice.toStringAsFixed(2);
  }
}