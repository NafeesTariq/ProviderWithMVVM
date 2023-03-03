import 'package:flutter/material.dart';
import 'package:mvvm_project/utils/routes/rotes_named.dart';
import 'package:mvvm_project/views/Screens/HomeScreen_view.dart';
import 'package:mvvm_project/views/Screens/Signup_view.dart';
import 'package:mvvm_project/views/Screens/login_view.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => const LoginScreen());

      case RoutesName.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HpomeScreen());
      case RoutesName.Signup:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SignupView());
      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text("No Route Defined"),
            ),
          );
        });
    }
  }
}
