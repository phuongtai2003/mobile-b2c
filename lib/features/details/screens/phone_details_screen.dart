import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:se_final_app/common/custom_button.dart';
import 'package:se_final_app/constants/global_variables.dart';
import 'package:se_final_app/features/details/services/phone_details_services.dart';
import 'package:se_final_app/models/cart.dart';
import 'package:se_final_app/models/phone.dart';
import 'package:se_final_app/provider/cart_provider.dart';
import 'package:se_final_app/utils/utils.dart';

class PhoneDetailsScreen extends StatefulWidget {
  const PhoneDetailsScreen({
    super.key,
    required this.phone,
  });
  final Phone phone;
  static const String routeName = '/phone-details-screen';
  @override
  State<PhoneDetailsScreen> createState() => _PhoneDetailsScreenState();
}

class _PhoneDetailsScreenState extends State<PhoneDetailsScreen> {
  final format = NumberFormat("#,##0", "en_US");
  final _detailsServices = PhoneDetailsServices();

  void ratePhone(double rating) {
    _detailsServices.rateProduct(
      context: context,
      phone: widget.phone,
      rating: rating,
    );
  }

  double averageRating = 0;
  void getPhoneAverage() {
    _detailsServices.getAverageRating(
      context: context,
      phone: widget.phone,
      onSuccess: (value) {
        averageRating = value;
        setState(() {});
      },
    );
  }

  @override
  void initState() {
    super.initState();
    getPhoneAverage();
  }

  @override
  Widget build(BuildContext context) {
    final manufacturerName = widget.phone.manufacturer['manufacturerName'];
    final cartProvider = context.watch<CartProvider>();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.gradient,
            ),
          ),
          title: Text(
            widget.phone.phoneName,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          centerTitle: true,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(
                  10,
                ),
                alignment: Alignment.center,
                child: Image.network(
                  widget.phone.image,
                  width: 300,
                  height: 300,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(
                  10,
                ),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(31, 219, 219, 219),
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(8),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RatingBar.builder(
                      initialRating: averageRating,
                      minRating: 0,
                      itemCount: 5,
                      allowHalfRating: true,
                      itemPadding: const EdgeInsets.only(
                        right: 5,
                      ),
                      glow: false,
                      itemBuilder: (context, index) => const Icon(
                        Icons.star,
                        color: GlobalVariables.secondaryColor,
                      ),
                      onRatingUpdate: ratePhone,
                    ),
                    Text(
                      widget.phone.phoneName,
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Brand: $manufacturerName",
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Price: ${format.format(widget.phone.price)} VND",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      widget.phone.phoneDescription,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomButton(
                      onPressed: () {
                        cartProvider.addToCart(widget.phone, 1);
                      },
                      buttonText: "Add To Cart",
                      buttonColor: GlobalVariables.primaryColor,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
