import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:se_final_app/common/customer_bottom_bar.dart';
import 'package:se_final_app/constants/global_variables.dart';
import 'package:se_final_app/models/cart.dart';
import 'package:se_final_app/models/phone.dart';
import 'package:se_final_app/provider/cart_provider.dart';
import 'package:se_final_app/provider/customer_provider.dart';
import 'package:se_final_app/utils/error_handler.dart';
import 'package:se_final_app/utils/utils.dart';

class PaymentServices {
  void createOrder(
      {required BuildContext context,
      required List<Phone> phones,
      required List<int> quantity}) async {
    final customerProvider = Provider.of<CustomerProvider>(
      context,
      listen: false,
    );
    try {
      List<Map<dynamic, dynamic>> phoneData = [];
      for (int i = 0; i < phones.length; i++) {
        phoneData.add(
          {
            "phoneId": phones[i].phoneId,
            "price": phones[i].price,
          },
        );
      }
      http.Response res = await http.post(
        Uri.parse("$uri/api/Order/CreateOrder"),
        headers: {
          "Content-Type": "application/json; charset=UTF-8",
          "ngrok-skip-browser-warning": "true",
          "X-Auth-Token": customerProvider.customer.customerId.toString(),
        },
        body: jsonEncode(
          {
            "phones": phoneData,
            "quantity": quantity,
          },
        ),
      );

      httpErrorHandler(
        context: context,
        res: res,
        onSuccess: () {
          final returnMess = jsonDecode(res.body)['value']['message'];
          showSnackBar(
            context,
            returnMess,
          );
          final cartProvider = Provider.of<CartProvider>(
            context,
            listen: false,
          );
          cartProvider.setCart = Cart(
            phone: [],
            quantity: [],
          );
          Navigator.pushNamedAndRemoveUntil(
            context,
            CustomerBottomBar.routeName,
            (route) => false,
          );
        },
      );
    } catch (e) {
      showSnackBar(
        context,
        e.toString(),
      );
    }
  }
}
