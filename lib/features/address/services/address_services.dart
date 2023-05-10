import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:se_final_app/constants/global_variables.dart';
import 'package:se_final_app/utils/error_handler.dart';
import 'package:se_final_app/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddressServices {
  void updateAddress(
      {required BuildContext context,
      required String address,
      required VoidCallback onSuccess}) async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      int? token = sharedPreferences.getInt("X-Auth-Token");
      http.Response res = await http.put(
        Uri.parse("$uri/api/Customer/UpdateAddress"),
        headers: {
          "Content-Type": "application/json; charset=UTF-8",
          "ngrok-skip-browser-warning": "true",
          "X-Auth-Token": token!.toString(),
        },
        body: jsonEncode(
          {
            "address": address,
          },
        ),
      );
      httpErrorHandler(
        context: context,
        res: res,
        onSuccess: onSuccess,
      );
    } catch (e) {
      showSnackBar(
        context,
        e.toString(),
      );
    }
  }
}
