import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:bibitrip/ui/navigation/app_navigation.dart';
import 'package:url_launcher/url_launcher.dart';

class AuthModel extends ChangeNotifier {
  final login = TextEditingController();
  final password = TextEditingController();
  String? errorMessage;
  bool startAuthorizationLoading = false;

  Future<void> toStart(BuildContext context) async {
    if (login.text.isEmpty || password.text.isEmpty) {
      errorMessage = 'Заполните логин или пароль';
      notifyListeners();
    } else {
      startAuthorizationLoading = true;
      notifyListeners();
      if (login.text == 'admin' && password.text == 'password') {
        Future.delayed(const Duration(seconds: 1), () {
          Navigator.of(context).pushReplacementNamed(RoutesName.mainScreen);
        });
      } else {
        startAuthorizationLoading = false;
        errorMessage = 'Неверный логин или пароль';
        notifyListeners();
      }
    }
  }

  Future<void> termsAndConditions() async {
    final url = Uri.parse('https://example.com');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      errorMessage = 'Could not launch $url';
      notifyListeners();
    }
  }

  Future<void> privacyPolicy() async {
    final url = Uri.parse('https://example.com');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      errorMessage = 'Could not launch $url';
      notifyListeners();
    }
  }
}
