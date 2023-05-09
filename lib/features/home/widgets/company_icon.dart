import 'package:flutter/material.dart';

class CompanyIcon extends StatelessWidget {
  const CompanyIcon({
    super.key,
    required this.image,
    required this.name,
    required this.compId,
    required this.onTap,
  });
  final String image;
  final String name;
  final int compId;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(
          5,
        ),
        child: Column(
          children: [
            Image.asset(
              image,
              width: 50,
              height: 50,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              name,
            ),
          ],
        ),
      ),
    );
  }
}
