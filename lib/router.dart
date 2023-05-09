import 'package:flutter/material.dart';
import 'package:se_final_app/common/customer_bottom_bar.dart';
import 'package:se_final_app/features/auth/screens/auth_screen.dart';
import 'package:se_final_app/features/cart/screens/cart_screen.dart';
import 'package:se_final_app/features/details/screens/phone_details_screen.dart';
import 'package:se_final_app/features/home/screens/brand_search.dart';
import 'package:se_final_app/features/home/screens/home_screen.dart';
import 'package:se_final_app/features/home/screens/search_screen.dart';
import 'package:se_final_app/features/introductory/screens/introduction_screen.dart';
import 'package:se_final_app/features/order/screens/order_screen.dart';
import 'package:se_final_app/features/profile/screens/profile_screen.dart';
import 'package:se_final_app/models/phone.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case IntroductionScreen.routeName:
      {
        return MaterialPageRoute(
          builder: (_) => const IntroductionScreen(),
          settings: settings,
        );
      }
    case AuthScreen.routeName:
      {
        return MaterialPageRoute(
          builder: (_) => const AuthScreen(),
          settings: settings,
        );
      }
    case CustomerBottomBar.routeName:
      {
        return MaterialPageRoute(
          builder: (_) => const CustomerBottomBar(),
          settings: settings,
        );
      }
    case HomeScreen.routeName:
      {
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
          settings: settings,
        );
      }
    case CartScreen.routeName:
      {
        return MaterialPageRoute(
          builder: (_) => const CartScreen(),
          settings: settings,
        );
      }
    case OrderScreen.routeName:
      {
        return MaterialPageRoute(
          builder: (_) => const OrderScreen(),
          settings: settings,
        );
      }
    case ProfileScreen.routeName:
      {
        return MaterialPageRoute(
          builder: (_) => const ProfileScreen(),
          settings: settings,
        );
      }
    case SearchScreen.routeName:
      {
        final String name = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => SearchScreen(phoneName: name),
          settings: settings,
        );
      }
    case PhoneDetailsScreen.routeName:
      {
        final Phone phone = settings.arguments as Phone;
        return MaterialPageRoute(
          builder: (_) => PhoneDetailsScreen(phone: phone),
          settings: settings,
        );
      }
    case BrandSearchScreen.routeName:
      {
        final int compId = settings.arguments as int;
        return MaterialPageRoute(
          builder: (_) => BrandSearchScreen(compId: compId),
          settings: settings,
        );
      }
    default:
      {
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text(
                "Sorry, the page could not be found",
              ),
            ),
          ),
          settings: settings,
        );
      }
  }
}
