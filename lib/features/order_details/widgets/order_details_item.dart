import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:se_final_app/constants/global_variables.dart';
import 'package:se_final_app/models/order_details.dart';

class OrderDetailsItem extends StatelessWidget {
  const OrderDetailsItem({
    super.key,
    required this.orderDetails,
  });
  final OrderDetails orderDetails;
  @override
  Widget build(BuildContext context) {
    final f = NumberFormat("#,##0");
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: GlobalVariables.primaryColor,
        ),
        borderRadius: BorderRadius.circular(
          4,
        ),
      ),
      padding: const EdgeInsets.all(
        8,
      ),
      margin: const EdgeInsets.only(
        top: 5,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            orderDetails.phone.image,
            height: 100,
            width: 100,
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                orderDetails.phone.phoneName,
                style: const TextStyle(
                  fontSize: 18,
                  color: GlobalVariables.secondaryColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                orderDetails.phone.manufacturer['manufacturerName'],
                style: const TextStyle(
                  fontSize: 16,
                  color: GlobalVariables.secondaryColor,
                ),
              ),
              Text(
                "Qty: ${orderDetails.quantity}",
                style: const TextStyle(
                  fontSize: 16,
                  color: GlobalVariables.secondaryColor,
                ),
              ),
              Text(
                "Price: ${f.format(orderDetails.price)} VNĐ",
                style: const TextStyle(
                  fontSize: 16,
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
