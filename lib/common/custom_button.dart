import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.buttonText,
    required this.buttonColor,
    this.textColor = Colors.white,
    this.height = 50,
  });
  final VoidCallback onPressed;
  final String buttonText;
  final Color buttonColor;
  final double height;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        minimumSize: Size.fromHeight(height),
      ),
      child: Text(
        buttonText,
        style: TextStyle(
          fontSize: 20,
          color: textColor,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
