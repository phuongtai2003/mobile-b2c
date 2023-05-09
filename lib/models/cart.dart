// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:se_final_app/models/phone.dart';

class Cart {
  List<Phone> phone;
  List<int> quantity;
  Cart({required this.phone, required this.quantity});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'phone': phone.map((x) => x.toMap()).toList(),
      'quantity': quantity,
    };
  }

  factory Cart.fromMap(Map<String, dynamic> map) {
    return Cart(
      phone: List<Phone>.from(
        (map['phone'] as List<Phone>).map<Phone>(
          (x) => Phone.fromMap(x as Map<String, dynamic>),
        ),
      ),
      quantity: List<int>.from((map['quantity'] as List<int>)),
    );
  }

  String toJson() => json.encode(toMap());

  factory Cart.fromJson(String source) =>
      Cart.fromMap(json.decode(source) as Map<String, dynamic>);
}
