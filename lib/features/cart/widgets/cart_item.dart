import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:se_final_app/constants/global_variables.dart';
import 'package:se_final_app/models/phone.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
    required this.phone,
    required this.quantity,
    required this.onAdd,
    required this.onRemove,
  });
  final Phone phone;
  final int quantity;
  final VoidCallback onRemove;
  final VoidCallback onAdd;

  @override
  Widget build(BuildContext context) {
    final f = NumberFormat("#,##0");
    int total = phone.price * quantity;
    return Container(
      padding: const EdgeInsets.all(
        8,
      ),
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: GlobalVariables.secondaryColor,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            child: Image.network(
              phone.image,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                phone.phoneName,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: GlobalVariables.secondaryColor,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                phone.manufacturer['manufacturerName'],
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  color: GlobalVariables.secondaryColor,
                ),
              ),
              Text(
                "${f.format(total)} VNĐ",
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  color: GlobalVariables.secondaryColor,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(0),
                          ),
                        ),
                      ),
                      onPressed: onRemove,
                      child: const Icon(
                        Icons.remove,
                      ),
                    ),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: GlobalVariables.secondaryColor,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        quantity.toString(),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(0),
                          ),
                        ),
                      ),
                      onPressed: onAdd,
                      child: const Icon(
                        Icons.add,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
