import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:se_final_app/constants/global_variables.dart';
import 'package:se_final_app/models/phone.dart';

class ProductReviewCard extends StatelessWidget {
  const ProductReviewCard({
    super.key,
    required this.phone,
    required this.quantity,
  });
  final Phone phone;
  final int quantity;
  @override
  Widget build(BuildContext context) {
    final f = NumberFormat("#,##0");
    int total = phone.price * quantity;
    return Container(
      padding: const EdgeInsets.all(
        8,
      ),
      margin: const EdgeInsets.only(
        top: 5,
        left: 5,
        right: 5,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: GlobalVariables.primaryColor,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(
              5,
            ),
            child: Image.network(
              phone.image,
              height: 100,
              width: 100,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                phone.phoneName,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: GlobalVariables.secondaryColor,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                phone.manufacturer['manufacturerName'],
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: GlobalVariables.secondaryColor,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "Quantity: $quantity",
                style: const TextStyle(
                  color: GlobalVariables.secondaryColor,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "Total Price: ${f.format(total)} VNĐ",
                style: const TextStyle(
                  color: GlobalVariables.secondaryColor,
                ),
              ),
              
            ],
          ),
        ],
      ),
    );
  }
}
