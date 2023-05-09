import 'package:flutter/material.dart';
import '../../Cutomer to chef2/Dish.dart';

class Cart with ChangeNotifier {
  Map<Dish, int> _items = {};

  Map<Dish, int> get items => {..._items};

  int get itemCount => _items.length;

  double get totalAmount {
    var total = 0.0;
    _items.forEach((dish, quantity) {
      double price = double.parse(dish.price.toString());
      total += price * quantity;
    });
    return total;
  }

  void addItem(Dish dish) {
    if (_items.containsKey(dish)) {
      _items.update(dish, (existingValue) => existingValue + 1);
    } else {
      _items.putIfAbsent(dish, () => 1);
    }
    notifyListeners();
  }

  void removeItem(Dish dish) {
    if (_items.containsKey(dish)) {
      _items.update(dish, (existingValue) => existingValue - 1);
    } else {
      _items.putIfAbsent(dish, () => 1);
    }
    notifyListeners();
  }
}

//  void clear() {
//    notifyListeners();
//    _items = {};
//  }
//}
