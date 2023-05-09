import 'package:flutter/material.dart';
import 'package:se_final_app/common/custom_button.dart';
import 'package:se_final_app/constants/global_variables.dart';
import 'package:se_final_app/features/auth/screens/auth_screen.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({super.key});
  static const String routeName = '/introduction-screen';

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  void navigateToAuthScreen() {
    Navigator.pushNamed(
      context,
      AuthScreen.routeName,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                child: Image.asset(
                  "assets/images/brand.png",
                  height: 400,
                  fit: BoxFit.cover,
                ),
              ),
              const Text(
                "We bring forth the utmost experience to you!",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  color: GlobalVariables.textColor,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              CustomButton(
                onPressed: navigateToAuthScreen,
                buttonText: "Let's get started",
                buttonColor: GlobalVariables.textColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
