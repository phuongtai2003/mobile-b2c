// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Customer {
  final int customerId;
  final String customerName;
  final String customerEmail;
  final String customerPassword;
  final String customerAddress;

  Customer({
    required this.customerId,
    required this.customerName,
    required this.customerEmail,
    required this.customerPassword,
    required this.customerAddress,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'customerId': customerId,
      'customerName': customerName,
      'customerEmail': customerEmail,
      'customerPassword': customerPassword,
      'customerAddress': customerAddress,
    };
  }

  factory Customer.fromMap(Map<String, dynamic> map) {
    return Customer(
      customerId: map['customerId'].toInt() ?? 0,
      customerName: map['customerName'] as String,
      customerEmail: map['customerEmail'] as String,
      customerPassword: map['customerPassword'] as String,
      customerAddress: map['customerAddress'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Customer.fromJson(String source) =>
      Customer.fromMap(json.decode(source) as Map<String, dynamic>);
}
