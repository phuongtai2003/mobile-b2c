// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:se_final_app/models/phone.dart';

class OrderDetails {
  final Phone phone;
  final int quantity;
  final int price;

  OrderDetails({
    required this.phone,
    required this.quantity,
    required this.price,
  });

  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'phone': phone.toMap(),
      'quantity': quantity,
      'price': price,
    };
  }

  factory OrderDetails.fromMap(Map<String, dynamic> map) {
    return OrderDetails(
      phone: Phone.fromMap(map['phone'] as Map<String,dynamic>),
      quantity: map['quantity'].toInt() ?? 0,
      price: map['price'].toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderDetails.fromJson(String source) => OrderDetails.fromMap(json.decode(source) as Map<String, dynamic>);
}
