import 'package:flutter/material.dart';
import 'package:se_final_app/constants/global_variables.dart';
import 'package:se_final_app/features/order/services/order_services.dart';
import 'package:se_final_app/features/order/widgets/order_card.dart';
import 'package:se_final_app/features/order_details/screens/order_details_screen.dart';
import 'package:se_final_app/models/order.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});
  static const String routeName = '/order-screen';
  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  List<Order> orderList = [];
  final _orderServices = OrderServices();
  void getOrders() async {
    orderList = await _orderServices.getOrders(context: context);
    setState(() {});
  }

  void navigateToOrderDetails(Order order) {
    Navigator.pushNamed(
      context,
      OrderDetailsScreen.routeName,
      arguments: order,
    );
  }

  @override
  void initState() {
    super.initState();
    getOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(gradient: GlobalVariables.gradient),
          ),
          title: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(
                  left: 10,
                ),
                child: Image.asset(
                  "assets/images/brandLogo.png",
                  width: 40,
                  height: 40,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(
            8,
          ),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemBuilder: (_, index) {
                    final order = orderList[index];
                    return GestureDetector(
                      onTap: () => navigateToOrderDetails(order),
                      child: OrderCard(order: order),
                    );
                  },
                  itemCount: orderList.length,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
