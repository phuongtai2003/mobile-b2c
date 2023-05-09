// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Manufacturer {
  final int manufacturerId;
  final String manufacturerName;
  final int manufacturerYear;

  Manufacturer({
    required this.manufacturerId,
    required this.manufacturerName,
    required this.manufacturerYear,
  });
  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'manufacturerId': manufacturerId,
      'manufacturerName': manufacturerName,
      'manufacturerYear': manufacturerYear,
    };
  }

  factory Manufacturer.fromMap(Map<String, dynamic> map) {
    return Manufacturer(
      manufacturerId: map['manufacturerId'].toInt() ?? 0,
      manufacturerName: map['manufacturerName'] as String,
      manufacturerYear: map['manufacturerYear'].toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Manufacturer.fromJson(String source) => Manufacturer.fromMap(json.decode(source) as Map<String, dynamic>);
}
