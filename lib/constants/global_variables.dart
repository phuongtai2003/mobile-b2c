import 'package:flutter/material.dart';

String uri = "https://9b4c-123-20-80-16.ngrok-free.app";

class GlobalVariables {
  static const Color bgColor = Colors.white;
  static const Color primaryColor = Color.fromRGBO(145, 239, 255, 1);
  static const Color secondaryColor = Color.fromRGBO(56, 151, 168, 1);
  static const Color textColor = Color.fromRGBO(15, 97, 230, 1);
  static const Gradient gradient = LinearGradient(
    colors: [
      Color.fromRGBO(145, 239, 255, 1),
      Color.fromRGBO(40, 140, 157, 1),
    ],
    stops: [
      0.5,
      1,
    ],
  );
  static const carouselImages = [
    'https://static.vecteezy.com/system/resources/previews/003/776/458/original/super-sale-blue-banner-offer-template-marketing-poster-for-magazine-advertising-discount-sales-shops-email-newsletters-free-vector.jpg',
    'https://img.freepik.com/premium-vector/50perce-off-discount-creative-elements-promotion-business-sale-special-discount-blue-background_36059-443.jpg?w=2000',
    'https://thumbs.dreamstime.com/b/boxes-shopping-cart-blue-background-concept-online-shopping-e-commerce-delivery-goods-copy-space-boxes-137915957.jpg',
  ];
  static const List<Map<dynamic, dynamic>> companyList = [
    {
      'companyName': "Apple",
      "image": "assets/images/apple.png",
      "compId": 5,
    },
    {
      'companyName': "Samsung",
      "image": "assets/images/samsung.png",
      "compId": 4,
    },
    {
      'companyName': "Oppo",
      "image": "assets/images/oppo.png",
      "compId": 3,
    },
    {
      'companyName': "RealMe",
      "image": "assets/images/realme.jpg",
      "compId": 7,
    },
  ];
}
