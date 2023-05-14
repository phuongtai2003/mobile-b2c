import 'package:flutter/material.dart';
import 'package:se_final_app/constants/global_variables.dart';
import 'package:se_final_app/features/order_details/services/order_details_services.dart';
import 'package:se_final_app/features/order_details/widgets/order_details_item.dart';
import 'package:se_final_app/models/order.dart';
import 'package:intl/intl.dart';
import 'package:se_final_app/models/order_details.dart';
import 'package:se_final_app/utils/loader.dart';

class OrderDetailsScreen extends StatefulWidget {
  const OrderDetailsScreen({
    super.key,
    required this.order,
  });
  static const String routeName = '/order-details-screen';
  final Order order;
  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  final format = NumberFormat("#,##0");
  List<OrderDetails> orderItemsList = [];

  final _orderDetailsServices = OrderDetailsServices();
  void getItemList() async {
    orderItemsList = await _orderDetailsServices.getOrderItemsList(
      context: context,
      order: widget.order,
    );
    setState(() {});
  }

  @override
  void initState() {
    getItemList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(
          60,
        ),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.gradient,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(
            8,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                "Order Details",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Order Id: ${widget.order.orderId}",
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Ordered Date: ${DateFormat('d/M/y').format(widget.order.orderedAt)}",
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Total Price: ${format.format(widget.order.totalPrice)} VND",
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              orderItemsList.isNotEmpty
                  ? Expanded(
                      child: ListView.builder(
                        itemCount: orderItemsList.length,
                        itemBuilder: (_, index) {
                          final orderDetailsItem = orderItemsList[index];
                          return OrderDetailsItem(
                            orderDetails: orderDetailsItem,
                          );
                        },
                      ),
                    )
                  : const Loader(),
            ],
          ),
        ),
      ),
    );
  }
}
