import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:se_final_app/common/custom_button.dart';
import 'package:se_final_app/constants/global_variables.dart';
import 'package:se_final_app/features/address/screens/address_screen.dart';
import 'package:se_final_app/features/cart/widgets/cart_item.dart';
import 'package:se_final_app/provider/cart_provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});
  static const String routeName = '/cart-screen';
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final f = NumberFormat("#,##0");

  void navigateToAddressScreen() {
    Navigator.pushNamed(
      context,
      AddressScreen.routeName,
    );
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = context.watch<CartProvider>();
    int total = 0;
    for (int i = 0; i < cartProvider.cart.phone.length; i++) {
      total = total +
          (cartProvider.cart.phone[i].price * cartProvider.cart.quantity[i]);
    }
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(gradient: GlobalVariables.gradient),
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
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cartProvider.cart.phone.length,
                itemBuilder: (_, index) {
                  final phone = cartProvider.cart.phone[index];
                  final quantity = cartProvider.cart.quantity[index];
                  return CartItem(
                    phone: phone,
                    quantity: quantity,
                    onRemove: () {
                      cartProvider.removeFromCart(phone, 1);
                    },
                    onAdd: () {
                      cartProvider.addToCart(context, phone, 1);
                    },
                  );
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(
                10,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: GlobalVariables.secondaryColor,
                ),
              ),
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                      left: 10,
                    ),
                    child: Text(
                      "${f.format(total)} VNĐ",
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: CustomButton(
                      onPressed: navigateToAddressScreen,
                      buttonText: "Order",
                      buttonColor: GlobalVariables.secondaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
