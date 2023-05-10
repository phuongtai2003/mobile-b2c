import 'package:flutter/material.dart';

class PaymentButton extends StatelessWidget {
  const PaymentButton({
    super.key,
    required this.image,
    required this.buttonName,
    required this.onTap,
    this.buttonColor = Colors.white,
  });
  final String image;
  final String buttonName;
  final VoidCallback onTap;
  final Color buttonColor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(4),
          ),
        ),
        minimumSize: const Size.fromHeight(
          50,
        ),
        backgroundColor: buttonColor,
        elevation: 1,
      ),
      onPressed: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            width: 50,
            height: 50,
          ),
          const SizedBox(
            width: 30,
          ),
          Text(
            buttonName,
          ),
        ],
      ),
    );
  }
}
