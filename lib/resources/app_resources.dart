import 'package:flutter/material.dart';

abstract class AppResources {
  static const mainColor = Color.fromRGBO(90, 185, 158, 1);
  static const iconColor = IconThemeData(
    color: Colors.white,
  );
  static const appLogoStyle =
      TextStyle(color: Colors.white, fontWeight: FontWeight.w700);

  static final buttonStyle = ElevatedButton.styleFrom(
    backgroundColor: mainColor,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    padding: const EdgeInsets.symmetric(vertical: 15.0),
  );

  static const textFieldStylee = TextStyle(fontSize: (16), color: Colors.black);

  static const circularProgresIndicator = SizedBox(
    width: 20,
    height: 20,
    child: CircularProgressIndicator(
      color: Colors.white,
    ),
  );

  static const errorMessageStyle = TextStyle(color: Colors.red);

  static const busListCityTextStyle = TextStyle(
      fontStyle: FontStyle.italic, fontSize: 18, fontWeight: FontWeight.w500);

  static const busListOptionTextStyle =
      TextStyle(color: Color.fromRGBO(98, 98, 98, 1));
}
