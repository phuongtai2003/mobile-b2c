import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:se_final_app/utils/utils.dart';

void httpErrorHandler(
    {required BuildContext context,
    required http.Response res,
    required VoidCallback onSuccess}) {
  switch (res.statusCode) {
    case 200:
      onSuccess();
      break;
    case 400:
      showSnackBar(
        context,
        jsonDecode(res.body)['value']['msg'],
      );
      break;
    case 500:
      showSnackBar(
        context,
        jsonDecode(res.body)['value']['error'],
      );
      break;
    default:
      showSnackBar(
        context,
        res.body,
      );
  }
}
