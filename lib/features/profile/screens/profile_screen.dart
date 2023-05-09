import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:se_final_app/common/custom_button.dart';
import 'package:se_final_app/constants/global_variables.dart';
import 'package:se_final_app/features/profile/services/profile_services.dart';
import 'package:se_final_app/provider/customer_provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  static const String routeName = '/profile-screen';

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _profileServices = ProfileServices();
  void logout() {
    _profileServices.logout(context: context);
  }

  @override
  Widget build(BuildContext context) {
    final customer = context.watch<CustomerProvider>().customer;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(
          60,
        ),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.gradient,
            ),
          ),
          title: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(
                  left: 10,
                ),
                child: Image.asset(
                  "assets/images/brandLogo.png",
                  width: 40,
                  height: 40,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello ${customer.customerName}",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: GlobalVariables.secondaryColor,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      onPressed: () {},
                      buttonText: "View Order",
                      buttonColor: GlobalVariables.primaryColor,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: CustomButton(
                      onPressed: logout,
                      buttonText: "Logout",
                      buttonColor: GlobalVariables.primaryColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
