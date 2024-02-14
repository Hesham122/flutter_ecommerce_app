import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/model/logic.dart';

class Cart with ChangeNotifier {
  // ignore: non_constant_identifier_names
  List SelectedProduct = [];
  double price = 0;
  addProduct(Books value) {
    SelectedProduct.add(value);
    price += value.price.round();
    notifyListeners();
  }

  removeProduct(Books value) {
    SelectedProduct.remove(value);
    price -= value.price.round();
    notifyListeners();
  }
}
