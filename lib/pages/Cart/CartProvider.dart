import 'package:flutter/cupertino.dart';

import '../../Cutomer to chef2/Dish.dart';
import 'Cart_Class.dart';

class CartProvider extends ChangeNotifier {

  final _cart = Cart();

  Cart get cart => _cart;

  get orders => null;

  void addItem(Dish dish) {
    _cart.addItem(dish);
    notifyListeners();
  }

  void removeItem(Dish dish) {
    _cart.removeItem(dish);
    notifyListeners();
  }

  void decrementQuantity(int index) {
    // implement the necessary functionality
  }
  void removeItemCompletely(Dish dish) {
    _cart.removeItem(dish);
    notifyListeners();
  }
}
