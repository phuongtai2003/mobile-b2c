import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:se_final_app/common/customer_bottom_bar.dart';
import 'package:se_final_app/constants/global_variables.dart';
import 'package:se_final_app/features/auth/services/auth_services.dart';
import 'package:se_final_app/features/introductory/screens/introduction_screen.dart';
import 'package:se_final_app/provider/cart_provider.dart';
import 'package:se_final_app/provider/customer_provider.dart';
import 'package:se_final_app/router.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CustomerProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => CartProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthServices _authServices = AuthServices();

  @override
  void initState() {
    _authServices.getData(
      context: context,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "MMT Ecommerce App",
      theme: ThemeData.light(useMaterial3: true).copyWith(
        scaffoldBackgroundColor: GlobalVariables.bgColor,
        appBarTheme: const AppBarTheme(
          color: GlobalVariables.primaryColor,
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black12,
          ),
        ),
        colorScheme: const ColorScheme.light().copyWith(
          primary: GlobalVariables.secondaryColor,
        ),
      ),
      onGenerateRoute: (settings) => onGenerateRoute(settings),
      home: Provider.of<CustomerProvider>(context).customer.customerId == 0
          ? const IntroductionScreen()
          : const CustomerBottomBar(),
    );
  }
}
