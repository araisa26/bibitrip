import 'package:flutter/material.dart';
import 'package:bibitrip/ui/navigation/app_navigation.dart';
import 'package:bibitrip/resources/app_resources.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Bibitrip",
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: AppResources.mainColor,
          iconTheme: AppResources.iconColor,
        ),
      ),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ru', 'RU'),
        Locale('en', 'US'), //можно добавить локали при необходимости
      ],
      debugShowCheckedModeBanner: false,
      routes: AppNavigation.routes,
      initialRoute: RoutesName.loaderScreen,
    );
  }
}
