import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:se_final_app/constants/global_variables.dart';
import 'package:se_final_app/features/details/screens/phone_details_screen.dart';
import 'package:se_final_app/features/home/screens/brand_search.dart';
import 'package:se_final_app/features/home/screens/search_screen.dart';
import 'package:se_final_app/features/home/services/home_services.dart';
import 'package:se_final_app/features/home/widgets/company_icon.dart';
import 'package:se_final_app/features/home/widgets/phone_card.dart';
import 'package:se_final_app/models/phone.dart';
import 'package:se_final_app/utils/utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = '/home-screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void navigateToSearchScreen(String? phoneName) {
    if (phoneName == null || phoneName.isEmpty) {
      showSnackBar(
        context,
        "Please enter the search bar",
      );
    } else {
      Navigator.pushNamed(
        context,
        SearchScreen.routeName,
        arguments: phoneName,
      );
    }
  }

  void navigateToPhoneDetails(Phone phone) {
    Navigator.pushNamed(
      context,
      PhoneDetailsScreen.routeName,
      arguments: phone,
    );
  }

  void navigateToBrandSearchScreen(int compId) {
    Navigator.pushNamed(
      context,
      BrandSearchScreen.routeName,
      arguments: compId,
    );
  }

  final _homeServices = HomeServices();

  List<Phone> phoneList = [];
  void getFivePhones() async {
    phoneList = await _homeServices.getFivePhones(context: context);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getFivePhones();
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
              Expanded(
                child: Container(
                  height: 40,
                  margin: const EdgeInsets.only(
                    left: 15,
                  ),
                  child: Material(
                    elevation: 2,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(
                        15,
                      ),
                    ),
                    child: TextFormField(
                      onFieldSubmitted: navigateToSearchScreen,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          color: GlobalVariables.secondaryColor,
                          size: 25,
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        contentPadding: EdgeInsets.only(top: 10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                          borderSide: BorderSide(
                            width: 2,
                            color: GlobalVariables.secondaryColor,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                          borderSide: BorderSide(
                            width: 2,
                            color: GlobalVariables.secondaryColor,
                          ),
                        ),
                        hintText: "Search MMT",
                        hintStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.black12,
              ),
              height: 90,
              child: ListView.builder(
                itemCount: GlobalVariables.companyList.length,
                itemExtent: 100,
                itemBuilder: (_, index) {
                  final image = GlobalVariables.companyList[index]['image'];
                  final name =
                      GlobalVariables.companyList[index]['companyName'];
                  final compId =
                      GlobalVariables.companyList[index]['compId'].toInt();
                  return CompanyIcon(
                    image: image,
                    name: name,
                    compId: compId,
                    onTap: () {
                      navigateToBrandSearchScreen(compId);
                    },
                  );
                },
                scrollDirection: Axis.horizontal,
              ),
            ),
            SizedBox(
              height: 250,
              child: CarouselSlider(
                items: GlobalVariables.carouselImages.map((e) {
                  return Builder(
                      builder: (context) => Image.network(
                            e,
                            height: 250,
                            fit: BoxFit.cover,
                          ));
                }).toList(),
                options: CarouselOptions(
                  height: 250,
                  viewportFraction: 1,
                  autoPlay: true,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.only(
                left: 10,
              ),
              child: const Text(
                "Top deals of the day",
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 250,
              child: ListView.builder(
                itemBuilder: (_, index) {
                  return GestureDetector(
                    onTap: () => navigateToPhoneDetails(phoneList[index]),
                    child: PhoneCard(
                      phone: phoneList[index],
                    ),
                  );
                },
                itemCount: phoneList.length,
                scrollDirection: Axis.horizontal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
