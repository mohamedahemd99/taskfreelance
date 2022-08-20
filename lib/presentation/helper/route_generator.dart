import 'package:flutter/material.dart';
import 'package:your_app_name/presentation/screens/home_screen.dart';
import 'package:your_app_name/presentation/screens/login_screen.dart';
import 'package:your_app_name/presentation/screens/verify_email_screen.dart';

import '../resources/app_strings.dart';


class Routes {
  static const String loginRoute = '/';
  static const String homeRoute = '/home';
  static const String verifyRoute = '/verify';

}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.loginRoute:
        return MaterialPageRoute(
          builder: (context) =>  LoginScreen(),
        );
        case Routes.homeRoute:
        return MaterialPageRoute(
          builder: (context) =>   HomeScreen(),
        );
        case Routes.verifyRoute:
        return MaterialPageRoute(
          builder: (context) =>  const VerifyScreen(),
        );


      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.noRouteFound),
        ),
        body: const Center(
          child: Text(AppStrings.noRouteFound),
        ),
      ),
    );
  }
}
