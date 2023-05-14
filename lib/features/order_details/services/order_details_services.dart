import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:se_final_app/constants/global_variables.dart';
import 'package:se_final_app/models/order.dart';
import 'package:se_final_app/models/order_details.dart';
import 'package:se_final_app/provider/customer_provider.dart';
import 'package:se_final_app/utils/error_handler.dart';
import 'package:se_final_app/utils/utils.dart';
import 'package:http/http.dart' as http;

class OrderDetailsServices {
  Future<List<OrderDetails>> getOrderItemsList(
      {required BuildContext context, required Order order}) async {
    List<OrderDetails> detailsList = [];
    final customerProvider =
        Provider.of<CustomerProvider>(context, listen: false);
    try {
      http.Response res = await http.get(
        Uri.parse("$uri/api/Order/GetOrderDetails/${order.orderId}"),
        headers: {
          "Content-Type": "application/json; charset=UTF-8",
          "ngrok-skip-browser-warning": "true",
          "X-Auth-Token": customerProvider.customer.customerId.toString(),
        },
      );

      httpErrorHandler(
        context: context,
        res: res,
        onSuccess: () {
          final returnRes = jsonDecode(res.body)['value'];
          for (int i = 0; i < returnRes.length; i++) {
            detailsList.add(
              OrderDetails.fromJson(
                jsonEncode(
                  returnRes[i],
                ),
              ),
            );
          }
        },
      );
    } catch (e) {
      showSnackBar(
        context,
        e.toString(),
      );
    }
    return detailsList;
  }
}
