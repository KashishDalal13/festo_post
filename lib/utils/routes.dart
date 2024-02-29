import 'package:flutter/material.dart';

class NavigationService {

  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static Future<dynamic> routeToNamed(String route, {dynamic arguments}) async {
    return navigatorKey.currentState?.pushNamed(route, arguments: arguments);
  }

  static Future<dynamic> replaceToNamed(String route, {dynamic arguments}) async {
    return navigatorKey.currentState?.pushReplacementNamed(route, arguments: arguments);
  }

  static Future<dynamic> replaceAllToNamed(String route, {dynamic arguments}) async {
    return navigatorKey.currentState?.pushNamedAndRemoveUntil(route, (Route<dynamic> route) => false, arguments: arguments);
  }

  static Future<dynamic> routeTo(Route route) async {
    return navigatorKey.currentState?.push(route);
  }

  static dynamic goBack() {
    return navigatorKey.currentState?.pop();
  }
}