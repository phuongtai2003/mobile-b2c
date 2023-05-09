import 'package:flutter/material.dart';
import 'package:se_final_app/constants/global_variables.dart';
import 'package:se_final_app/features/cart/screens/cart_screen.dart';
import 'package:se_final_app/features/home/screens/home_screen.dart';
import 'package:se_final_app/features/order/screens/order_screen.dart';
import 'package:se_final_app/features/profile/screens/profile_screen.dart';

class CustomerBottomBar extends StatefulWidget {
  const CustomerBottomBar({super.key});
  static const String routeName = '/customer-bottom-bar';
  @override
  State<CustomerBottomBar> createState() => _CustomerBottomBarState();
}

class _CustomerBottomBarState extends State<CustomerBottomBar> {
  int pageIndex = 0;
  double bottomBarItemWidth = 50;

  List<Widget> pageList = [
    const HomeScreen(),
    const ProfileScreen(),
    const CartScreen(),
    const OrderScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageList[pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          if (value != pageIndex) {
            setState(() {
              pageIndex = value;
            });
          }
        },
        currentIndex: pageIndex,
        selectedItemColor: GlobalVariables.secondaryColor,
        unselectedItemColor: GlobalVariables.primaryColor,
        items: [
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarItemWidth,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 2,
                    color: pageIndex == 0
                        ? GlobalVariables.secondaryColor
                        : GlobalVariables.primaryColor,
                  ),
                ),
              ),
              child: const Icon(
                Icons.house_outlined,
                size: 30,
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarItemWidth,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 2,
                    color: pageIndex == 1
                        ? GlobalVariables.secondaryColor
                        : GlobalVariables.primaryColor,
                  ),
                ),
              ),
              child: const Icon(
                Icons.person_outline,
                size: 30,
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarItemWidth,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 2,
                    color: pageIndex == 2
                        ? GlobalVariables.secondaryColor
                        : GlobalVariables.primaryColor,
                  ),
                ),
              ),
              child: const Icon(
                Icons.shopping_cart,
                size: 30,
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarItemWidth,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 2,
                    color: pageIndex == 3
                        ? GlobalVariables.secondaryColor
                        : GlobalVariables.primaryColor,
                  ),
                ),
              ),
              child: const Icon(
                Icons.payment,
                size: 30,
              ),
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
