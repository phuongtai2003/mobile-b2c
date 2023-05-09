import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:se_final_app/constants/global_variables.dart';
import 'package:se_final_app/models/phone.dart';
import 'package:se_final_app/provider/customer_provider.dart';
import 'package:se_final_app/utils/error_handler.dart';
import 'package:se_final_app/utils/utils.dart';
import 'package:http/http.dart' as http;

class PhoneDetailsServices {
  void rateProduct(
      {required BuildContext context,
      required Phone phone,
      required double rating}) async {
    final customerProvider = Provider.of<CustomerProvider>(
      context,
      listen: false,
    );
    try {
      int token = customerProvider.customer.customerId;
      http.Response res = await http.post(
        Uri.parse("$uri/api/Phone/Rate"),
        body: jsonEncode(
          {
            'phoneId': phone.phoneId,
            'rating': rating,
          },
        ),
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
          showSnackBar(
            context,
            jsonDecode(res.body)['value']['message'],
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

  void getAverageRating(
      {required BuildContext context,
      required Phone phone,
      required Function(double) onSuccess}) async {
    try {
      http.Response res = await http.get(
        Uri.parse("$uri/api/Phone/Average/${phone.phoneId}"),
        headers: {
          "Content-Type": "application/json; charset=UTF-8",
          "ngrok-skip-browser-warning": "true",
        },
      );
      httpErrorHandler(
        context: context,
        res: res,
        onSuccess: () {
          final returnRes = jsonDecode(res.body)['value'];
          if (returnRes.length != 0) {
            onSuccess(returnRes[0]['average']);
          } else {
            onSuccess(0);
          }
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
