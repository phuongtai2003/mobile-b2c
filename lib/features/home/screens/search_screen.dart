import 'package:flutter/material.dart';
import 'package:se_final_app/constants/global_variables.dart';
import 'package:se_final_app/features/details/screens/phone_details_screen.dart';
import 'package:se_final_app/features/home/services/home_services.dart';
import 'package:se_final_app/features/home/widgets/phone_card.dart';
import 'package:se_final_app/models/phone.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({
    super.key,
    required this.phoneName,
  });
  static const String routeName = '/search-screen';
  final String phoneName;
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Phone> phoneList = [];
  final HomeServices _homeServices = HomeServices();
  @override
  void initState() {
    super.initState();
    getPhoneList(
      widget.phoneName,
    );
  }

  void getPhoneList(String phoneName) async {
    phoneList = await _homeServices.search(context: context, query: phoneName);
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
          title: const Text(
            "Search Results",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          centerTitle: true,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 10,
          ),
          child: Column(
            children: [
              Expanded(
                child: GridView.builder(
                  itemCount: phoneList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.65,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                  ),
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () => navigateToDetailsScreen(
                      phoneList[index],
                    ),
                    child: PhoneCard(
                      phone: phoneList[index],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
