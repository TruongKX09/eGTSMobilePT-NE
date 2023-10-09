import 'package:egtspt/resources/home_page.dart';
import 'package:egtspt/resources/login_page.dart';
import 'package:flutter/material.dart';

String sPreApiUrl = "https://egts2.azurewebsites.net/api";

class PageRouteNames {
  static const String login = '/login';
  static const String home = '/home_page';
}

const TextStyle textStyle = TextStyle(
  color: Colors.black,
  fontSize: 13.0,
  decoration: TextDecoration.none,
);

Map<String, WidgetBuilder> routes = {
  PageRouteNames.login: (context) => const LoginPage(),
  PageRouteNames.home: (context) => const HomePage(),
};
