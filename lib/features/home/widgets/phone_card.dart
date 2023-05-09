import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:se_final_app/constants/global_variables.dart';
import 'package:se_final_app/models/phone.dart';

class PhoneCard extends StatelessWidget {
  const PhoneCard({super.key, required this.phone});
  final Phone phone;
  @override
  Widget build(BuildContext context) {
    final format = NumberFormat("#,##0", "en_US");
    return Material(
      borderRadius: const BorderRadius.all(
        Radius.circular(
          8,
        ),
      ),
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(
          10,
        ),
        child: Column(
          children: [
            Image.network(
              phone.image,
              width: 120,
              height: 120,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              phone.phoneName,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: GlobalVariables.secondaryColor,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "${format.format(phone.price)} VND",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
