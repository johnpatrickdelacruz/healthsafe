import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String routeName, bool predicate,
      {dynamic arguments}) async {
    return navigatorKey.currentState!.pushNamedAndRemoveUntil(
        routeName, (Route<dynamic> route) => predicate,
        arguments: arguments);
  }

  void goBack({dynamic argument}) {
    navigatorKey.currentState!.pop(argument);
  }

  Future<dynamic> popUntil(String routeName, bool predicate,
          {dynamic arguments}) async =>
      navigatorKey.currentState!
          .popUntil((Route<dynamic> route) => route.isFirst);
}
