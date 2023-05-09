import 'package:flutter/material.dart';
import 'package:se_final_app/common/custom_button.dart';
import 'package:se_final_app/common/custom_text_field.dart';
import 'package:se_final_app/constants/global_variables.dart';
import 'package:se_final_app/features/auth/services/auth_services.dart';

enum Auth {
  signUp,
  signIn,
}

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});
  static const String routeName = '/auth-screen';

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final GlobalKey<FormState> _signUpFormKey = GlobalKey();
  final GlobalKey<FormState> _signInFormKey = GlobalKey();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _nameTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();

  @override
  void dispose() {
    _emailTextController.dispose();
    _nameTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }

  Auth authState = Auth.signUp;
  final AuthServices _authServices = AuthServices();

  void formButtonPress() {
    if (authState == Auth.signUp) {
      if (_signUpFormKey.currentState!.validate()) {
        _authServices.registerAccount(
          context: context,
          email: _emailTextController.text,
          name: _nameTextController.text,
          password: _passwordTextController.text,
        );
      }
    } else if (authState == Auth.signIn) {
      if (_signInFormKey.currentState!.validate()) {
        _authServices.login(
          context: context,
          email: _emailTextController.text,
          password: _passwordTextController.text,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 15,
            ),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Image.asset(
                    "assets/images/brand.png",
                    fit: BoxFit.cover,
                    height: 300,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        onPressed: () {
                          setState(() {
                            authState = Auth.signUp;
                          });
                        },
                        buttonText: "Register",
                        buttonColor: authState == Auth.signUp
                            ? GlobalVariables.textColor
                            : Colors.white,
                        textColor: authState == Auth.signUp
                            ? Colors.white
                            : GlobalVariables.textColor,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: CustomButton(
                        onPressed: () {
                          setState(() {
                            authState = Auth.signIn;
                          });
                        },
                        buttonColor: authState == Auth.signIn
                            ? GlobalVariables.textColor
                            : Colors.white,
                        textColor: authState == Auth.signIn
                            ? Colors.white
                            : GlobalVariables.textColor,
                        buttonText: "Login",
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Form(
                  key: authState == Auth.signUp
                      ? _signUpFormKey
                      : _signInFormKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        textEditingController: _emailTextController,
                        hintText: "Email",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      if (authState == Auth.signUp)
                        Container(
                          margin: const EdgeInsets.only(
                            bottom: 10,
                          ),
                          child: CustomTextField(
                            textEditingController: _nameTextController,
                            hintText: 'Name',
                          ),
                        ),
                      CustomTextField(
                        textEditingController: _passwordTextController,
                        hintText: "Password",
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomButton(
                        onPressed: formButtonPress,
                        buttonText: "Submit",
                        buttonColor: GlobalVariables.textColor,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
