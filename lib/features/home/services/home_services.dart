import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:se_final_app/constants/global_variables.dart';
import 'package:se_final_app/models/phone.dart';
import 'package:se_final_app/utils/error_handler.dart';
import 'package:se_final_app/utils/utils.dart';
import 'package:http/http.dart' as http;

class HomeServices {
  Future<List<Phone>> search(
      {required BuildContext context, required String query}) async {
    List<Phone> phoneList = [];
    try {
      http.Response res = await http.get(
        Uri.parse("$uri/api/Phone/Search?name=$query"),
        headers: {
          "Content-Type": "application/json; charset=UTF-8",
          "ngrok-skip-browser-warning": "true",
        },
      );
      httpErrorHandler(
        context: context,
        res: res,
        onSuccess: () {
          final result = jsonDecode(res.body)['value'];
          for (int i = 0; i < result.length; i++) {
            phoneList.add(Phone.fromJson((jsonEncode(result[i]))));
          }
        },
      );
    } catch (e) {
      showSnackBar(
        context,
        e.toString(),
      );
    }
    return phoneList;
  }

  Future<List<Phone>> getFivePhones({required BuildContext context}) async {
    List<Phone> phoneList = [];
    try {
      http.Response res = await http.get(
        Uri.parse("$uri/api/Phone/GetFive"),
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
          for (int i = 0; i < returnRes.length; i++) {
            phoneList.add(
              Phone.fromJson(
                jsonEncode(returnRes[i]),
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
    return phoneList;
  }

  Future<List<Phone>> searchByManufacturer(
      {required BuildContext context, required int manufacturerId}) async {
    List<Phone> phonesList = [];
    try {
      http.Response res = await http.get(
        Uri.parse("$uri/api/Manufacturer/Search/$manufacturerId"),
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

          for (int i = 0; i < returnRes.length; i++) {
            phonesList.add(
              Phone.fromJson(
                jsonEncode(returnRes[i]),
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
    return phonesList;
  }
}
