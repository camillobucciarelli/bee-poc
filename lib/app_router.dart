import 'presentation/apiaries/apiaries_page.dart';
import 'presentation/login/login_page.dart';
import 'package:flutter/material.dart';

class AppRouter {
  AppRouter._();

  static const initialRoute = LoginPage.routeName;

  static RouteFactory get generateAppRoute => (settings) => {
        LoginPage.routeName: MaterialPageRoute<dynamic>(
          builder: (_) => const LoginPage(),
          settings: settings,
        ),
        ApiariesPage.routeName: MaterialPageRoute<dynamic>(
          builder: (_) => const ApiariesPage(),
          settings: settings,
        ),
      }[settings.name];
}
