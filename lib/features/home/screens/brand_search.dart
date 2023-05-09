import 'package:flutter/material.dart';
import 'package:se_final_app/constants/global_variables.dart';
import 'package:se_final_app/features/details/screens/phone_details_screen.dart';
import 'package:se_final_app/features/home/services/home_services.dart';
import 'package:se_final_app/features/home/widgets/phone_card.dart';
import 'package:se_final_app/models/phone.dart';

class BrandSearchScreen extends StatefulWidget {
  const BrandSearchScreen({
    super.key,
    required this.compId,
  });
  static const String routeName = '/brand-search-screen';
  final int compId;
  @override
  State<BrandSearchScreen> createState() => _BrandSearchScreenState();
}

class _BrandSearchScreenState extends State<BrandSearchScreen> {
  final _homeServices = HomeServices();
  List<Phone> phoneList = [];

  void getPhones() async {
    phoneList = await _homeServices.searchByManufacturer(
        context: context, manufacturerId: widget.compId);
    setState(() {});
  }

  void navigateToDetailsScreen(Phone phone) {
    Navigator.pushNamed(
      context,
      PhoneDetailsScreen.routeName,
      arguments: phone,
    );
  }

  @override
  void initState() {
    super.initState();
    getPhones();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.gradient,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 15,
        ),
        child: GridView.builder(
          itemCount: phoneList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 0.65),
          itemBuilder: (_, index) {
            return GestureDetector(
              onTap: () => navigateToDetailsScreen(
                phoneList[index],
              ),
              child: PhoneCard(
                phone: phoneList[index],
              ),
            );
          },
        ),
      ),
    );
  }
}
