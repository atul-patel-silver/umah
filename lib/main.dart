import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:umah/screen/MainScreen/discover_screen.dart';
import 'package:umah/screen/MainScreen/list_screen.dart';
import 'package:umah/screen/MainScreen/main_page.dart';
import 'package:umah/screen/OnboardingScreens/Onboarding_Page.dart';
import 'package:umah/screen/Product/product_scan.dart';
import 'package:umah/screen/login_screen.dart';
import 'package:umah/screen/splash/main_splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/mainSplash",
      defaultTransition: Transition.leftToRight,
      getPages: [
        GetPage(name: "/mainSplash", page: () => const MainSplashScreen()),
        GetPage(name: "/login", page: () => const LoginScreen()),
        GetPage(name: "/mainPage", page: () =>  MainPage()),
        GetPage(name: "/discover", page: () =>  DiscoverScreen()),
        GetPage(name: "/list", page: () =>  const ListScreen()),
        GetPage(name: "/onboardingPage", page: () => const Onboarding()),
        GetPage(name: "/productscan", page: () => const ProductScan()),
      ],
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
