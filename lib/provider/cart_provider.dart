import 'package:flutter/cupertino.dart';
import 'package:se_final_app/models/cart.dart';
import 'package:se_final_app/models/phone.dart';
import 'package:se_final_app/utils/utils.dart';

class CartProvider extends ChangeNotifier {
  Cart _cart = Cart(
    phone: [],
    quantity: [],
  );

  Cart get cart => _cart;

  set setCart(Cart cart) {
    _cart = cart;
  }

  void addToCart(BuildContext context, Phone phone, int quantity) {
    bool isContain = false;
    int index = -1;
    for (int i = 0; i < _cart.phone.length; i++) {
      if (_cart.phone[i].phoneId == phone.phoneId) {
        isContain = true;
        index = i;
        break;
      }
    }
    if (isContain) {
      _cart.quantity[index] += quantity;
    } else {
      _cart.phone.add(phone);
      _cart.quantity.add(quantity);
    }
    showSnackBar(
      context,
      "Added ${phone.phoneName} to cart successfully",
    );
    notifyListeners();
  }

  void removeFromCart(Phone phone, int quantity) {
    bool isContain = false;
    int index = -1;
    for (int i = 0; i < _cart.phone.length; i++) {
      if (phone.phoneId == _cart.phone[i].phoneId) {
        isContain = true;
        index = i;
        break;
      }
    }
    if (isContain) {
      _cart.quantity[index] -= quantity;
      if (_cart.quantity[index] == 0) {
        _cart.phone.removeAt(index);
        _cart.quantity.removeAt(index);
      }
    }
    notifyListeners();
  }
}
