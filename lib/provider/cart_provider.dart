import 'package:flutter/cupertino.dart';
import 'package:se_final_app/models/cart.dart';
import 'package:se_final_app/models/phone.dart';

class CartProvider extends ChangeNotifier {
  Cart _cart = Cart(
    phone: [],
    quantity: [],
  );

  Cart get cart => _cart;

  set cart(Cart cart) {
    _cart = cart;
  }

  void addToCart(Phone phone, int quantity) {
    final isContain = _cart.phone.contains(phone);
    if (isContain) {
      final index = _cart.phone.indexOf(phone);
      _cart.quantity[index] += quantity;
    } else {
      _cart.phone.add(phone);
      _cart.quantity.add(quantity);
    }
    notifyListeners();
  }

  void removeFromCart(Phone phone, int quantity) {
    final isContain = _cart.phone.contains(phone);
    if (isContain) {
      final index = _cart.phone.indexOf(phone);
      _cart.quantity[index] -= quantity;
      if (_cart.quantity[index] == 0) {
        _cart.phone.removeAt(index);
        _cart.quantity.removeAt(index);
      }
    }
    notifyListeners();
  }
}
