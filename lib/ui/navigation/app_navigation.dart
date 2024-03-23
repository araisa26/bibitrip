import 'package:flutter/material.dart';
import 'package:bibitrip/ui/navigation/screen_create.dart';

abstract class RoutesName {
  static const loaderScreen = "/";
  static const authScreen = "/auth_screen";
  static const mainScreen = "/main_screen";
}

abstract class AppNavigation {
  static Map<String, WidgetBuilder> routes = {
    RoutesName.loaderScreen: (_) => ScreenCreate.loaderScreen(),
    RoutesName.authScreen: (_) => ScreenCreate.authScreen(),
    RoutesName.mainScreen: (_) => ScreenCreate().mainScreen(),
  };
}
