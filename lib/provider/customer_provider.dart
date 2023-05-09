import 'package:flutter/cupertino.dart';
import 'package:se_final_app/models/customer.dart';

class CustomerProvider extends ChangeNotifier {
  Customer _customer = Customer(
    customerId: 0,
    customerName: "",
    customerEmail: "",
    customerPassword: "",
    customerAddress: "",
  );

  Customer get customer => _customer;

  void setCustomer(dynamic customer) {
    _customer = Customer.fromMap(customer);
    notifyListeners();
  }

  void setCustomerFromModel(Customer customer) {
    _customer = customer;
    notifyListeners();
  }
}
