import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:se_final_app/common/customer_bottom_bar.dart';
import 'package:se_final_app/constants/global_variables.dart';
import 'package:se_final_app/models/customer.dart';
import 'package:se_final_app/provider/customer_provider.dart';
import 'package:se_final_app/utils/error_handler.dart';
import 'package:se_final_app/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthServices {
  void registerAccount(
      {required BuildContext context,
      required String email,
      required String name,
      required String password}) async {
    try {
      Customer customer = Customer(
        customerId: 0,
        customerName: name,
        customerEmail: email,
        customerPassword: password,
        customerAddress: "",
      );
      http.Response res = await http.post(
        Uri.parse("$uri/api/Customer/Register"),
        headers: {
          "Content-Type": "application/json; charset=UTF-8",
          "ngrok-skip-browser-warning": "true",
        },
        body: customer.toJson(),
      );

      httpErrorHandler(
        context: context,
        res: res,
        onSuccess: () {
          String msg = jsonDecode(res.body)['value']['message'];
          showSnackBar(
            context,
            msg,
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

  void login(
      {required BuildContext context,
      required String email,
      required String password}) async {
    CustomerProvider customerProvider =
        Provider.of<CustomerProvider>(context, listen: false);
    try {
      http.Response res = await http.post(
        Uri.parse(
          "$uri/api/Customer/Login",
        ),
        headers: {
          "Content-Type": "application/json; charset=UTF-8",
          "ngrok-skip-browser-warning": "true",
        },
        body: jsonEncode(
          {
            "email": email,
            "password": password,
          },
        ),
      );
      httpErrorHandler(
        context: context,
        res: res,
        onSuccess: () async {
          SharedPreferences sharedPreferences =
              await SharedPreferences.getInstance();
          await sharedPreferences.setInt(
            "X-Auth-Token",
            jsonDecode(res.body)['value']['customer']['customerId'],
          );
          customerProvider
              .setCustomer(jsonDecode(res.body)['value']['customer']);
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

  void getData({required BuildContext context}) async {
    final customerProvider =
        Provider.of<CustomerProvider>(context, listen: false);
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      final int? token = sharedPreferences.getInt("X-Auth-Token");
      if (token == null) {
        sharedPreferences.setInt("X-Auth-Token", 0);
        return;
      }
      http.Response res = await http.get(
        Uri.parse("$uri/api/Customer/GetData"),
        headers: {
          "Content-Type": "application/json; charset=UTF-8",
          "ngrok-skip-browser-warning": "true",
          "X-Auth-Token": token.toString(),
        },
      );

      httpErrorHandler(
        context: context,
        res: res,
        onSuccess: () {
          customerProvider.setCustomer(
            jsonDecode(res.body)['value']['customer'],
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
