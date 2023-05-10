// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:intl/intl.dart';

class Order {
  final int orderId;
  final int totalPrice;
  final DateTime orderedAt;
  final int customerId;

  Order({
    required this.orderId,
    required this.totalPrice,
    required this.orderedAt,
    required this.customerId,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'orderId': orderId,
      'totalPrice': totalPrice,
      'orderedAt': orderedAt.millisecondsSinceEpoch,
      'customerId': customerId,
    };
  }

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      orderId: map['orderId'].toInt() ?? 0,
      totalPrice: map['totalPrice'].toInt() ?? 0,
      orderedAt: DateFormat("yyyy-MM-dd").parse(
        map['orderedAt'].toString(),
      ),
      customerId: map['customerId'].toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Order.fromJson(String source) =>
      Order.fromMap(json.decode(source) as Map<String, dynamic>);
}
