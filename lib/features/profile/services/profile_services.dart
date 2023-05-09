import 'package:flutter/cupertino.dart';
import 'package:se_final_app/features/auth/screens/auth_screen.dart';
import 'package:se_final_app/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileServices {
  void logout({required BuildContext context}) async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setInt(
        "X-Auth-Token",
        0,
      );
      // ignore: use_build_context_synchronously
      Navigator.pushNamedAndRemoveUntil(
        context,
        AuthScreen.routeName,
        (route) => false,
      );
    } catch (e) {
      showSnackBar(
        context,
        e.toString(),
      );
    }
  }
}
