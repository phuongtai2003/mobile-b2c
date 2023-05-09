// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Phone {
  final int phoneId;
  final String phoneName;
  final String phoneDescription;
  final int phoneYear;
  final int price;
  final String image;
  final Map<dynamic, dynamic> manufacturer;

  Phone({
    required this.phoneId,
    required this.phoneName,
    required this.phoneDescription,
    required this.phoneYear,
    required this.price,
    required this.manufacturer,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'phoneId': phoneId,
      'phoneName': phoneName,
      'phoneDescription': phoneDescription,
      'phoneYear': phoneYear,
      'price': price,
      'manufacturer': manufacturer,
      'image': image,
    };
  }

  factory Phone.fromMap(Map<String, dynamic> map) {
    return Phone(
      phoneId: map['phoneId'].toInt() ?? 0,
      phoneName: map['phoneName'] as String,
      phoneDescription: map['phoneDescription'] as String,
      phoneYear: map['phoneYear'].toInt() ?? 0,
      price: map['price'].toInt() ?? 0,
      manufacturer: Map<dynamic, dynamic>.from(
        (map['manufacturer'] as Map<dynamic, dynamic>),
      ),
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Phone.fromJson(String source) =>
      Phone.fromMap(json.decode(source) as Map<String, dynamic>);
}
