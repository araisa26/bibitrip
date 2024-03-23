import 'package:flutter/material.dart';
import 'package:bibitrip/ui/navigation/app_navigation.dart';

class LoaderViewModel {
  BuildContext context;
  LoaderViewModel(this.context) {
    checkIsAuth();
  }

  //здесь должна быть проверка авторизованности, которая выводит либо экран авторизации либо главный экран
  checkIsAuth() {
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.of(context).pushReplacementNamed(RoutesName.authScreen);
    });
  }
}
