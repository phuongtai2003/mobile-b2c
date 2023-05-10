import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:se_final_app/common/custom_button.dart';
import 'package:se_final_app/common/custom_text_field.dart';
import 'package:se_final_app/constants/global_variables.dart';
import 'package:se_final_app/features/address/services/address_services.dart';
import 'package:se_final_app/features/payment/screens/payment_screen.dart';
import 'package:se_final_app/provider/customer_provider.dart';
import 'package:se_final_app/utils/utils.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});
  static const String routeName = '/address-screen';
  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  final GlobalKey<FormState> addressFormKey = GlobalKey();
  final _numberController = TextEditingController();
  final _roadController = TextEditingController();
  final _wardController = TextEditingController();
  final _districtController = TextEditingController();
  final _cityController = TextEditingController();

  final _addressServices = AddressServices();

  void validAddress(String address) {
    if (addressFormKey.currentState!.validate()) {
      _addressServices.updateAddress(
        context: context,
        address: "${_numberController.text} - ${_roadController.text} - Ward ${_wardController.text} - District ${_districtController.text} - ${_cityController.text}" ,
        onSuccess: () {
          Navigator.pushNamed(
            context,
            PaymentScreen.routeName,
          );
          showSnackBar(
            context,
            "Update address successfully",
          );
        },
      );
    } else {
      if (address.isEmpty) {
        showSnackBar(
          context,
          "Please enter your address, you currently don't have one",
        );
      } else {
        Navigator.pushNamed(
          context,
          PaymentScreen.routeName,
        );
      }
    }
  }

  @override
  void dispose() {
    _numberController.dispose();
    _roadController.dispose();
    _districtController.dispose();
    _wardController.dispose();
    _cityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final customerProvider = Provider.of<CustomerProvider>(context);
    String currentAddress = customerProvider.customer.customerAddress;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.gradient,
            ),
          ),
          title: const Text(
            "Address Information",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: true,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: addressFormKey,
            child: Padding(
              padding: const EdgeInsets.all(
                8,
              ),
              child: Column(
                children: [
                  CustomTextField(
                    textEditingController: _numberController,
                    hintText: "House Number",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    textEditingController: _roadController,
                    hintText: "Street Name",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    textEditingController: _wardController,
                    hintText: "Ward",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    textEditingController: _districtController,
                    hintText: "District",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    textEditingController: _cityController,
                    hintText: "City",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomButton(
                    onPressed: () {
                      validAddress(
                        currentAddress,
                      );
                    },
                    buttonText: "Save Changes",
                    buttonColor: GlobalVariables.secondaryColor,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
