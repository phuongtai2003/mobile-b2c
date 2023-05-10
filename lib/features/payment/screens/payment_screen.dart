import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:se_final_app/constants/global_variables.dart';
import 'package:se_final_app/features/payment/services/payment_services.dart';
import 'package:se_final_app/features/payment/widgets/payment_button.dart';
import 'package:se_final_app/features/payment/widgets/product_review_card.dart';
import 'package:se_final_app/models/phone.dart';
import 'package:se_final_app/provider/cart_provider.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});
  static const String routeName = '/payment-screen';
  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final f = NumberFormat("#,##0");
  final _paymentServices = PaymentServices();

  void createOrder(List<Phone> phones, List<int> quantity) {
    _paymentServices.createOrder(
      context: context,
      phones: phones,
      quantity: quantity,
    );
  }
  
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context, listen: false).cart;
    int total = 0;
    for (int i = 0; i < cart.phone.length; i++) {
      total = total + cart.phone[i].price * cart.quantity[i];
    }
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
            "Payment",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: true,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(
            8,
          ),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemBuilder: (_, index) {
                    final phone = cart.phone[index];
                    final quantity = cart.quantity[index];
                    return ProductReviewCard(
                      phone: phone,
                      quantity: quantity,
                    );
                  },
                  itemCount: cart.phone.length,
                ),
              ),
              Text(
                "Total: ${f.format(total)} VNĐ",
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 40,
              ),
              PaymentButton(
                image: "assets/images/vnpay.webp",
                buttonName: "Pay with VN Pay",
                onTap: () {
                  createOrder(
                    cart.phone,
                    cart.quantity,
                  );
                },
              ),
              const SizedBox(
                height: 10,
              ),
              PaymentButton(
                image: "assets/images/money.png",
                buttonName: "Pay with Cash",
                onTap: () {
                  createOrder(
                    cart.phone,
                    cart.quantity,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
