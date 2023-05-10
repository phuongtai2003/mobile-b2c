import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:se_final_app/constants/global_variables.dart';
import 'package:se_final_app/models/order.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({
    super.key,
    required this.order,
  });
  final Order order;

  @override
  Widget build(BuildContext context) {
    final f = NumberFormat("#,##0");
    return Container(
      margin: const EdgeInsets.only(
        top: 5,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          4,
        ),
        border: Border.all(
          color: GlobalVariables.primaryColor,
        ),
      ),
      padding: const EdgeInsets.all(
        8,
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Order Invoice",
                style: TextStyle(
                  fontSize: 22,
                  color: GlobalVariables.secondaryColor,
                ),
              ),
              Text(
                "Order Id: ${order.orderId}",
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
                "Order Date: ${DateFormat('yyyy-MM-dd').format(order.orderedAt)}",
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
                "Total Price: ${f.format(order.totalPrice)} VNĐ",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: GlobalVariables.secondaryColor,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
