import 'package:bibitrip/domain/api_client/api_client.dart';
import 'package:bibitrip/domain/entity/bus_trips.dart';
import 'package:bibitrip/ui/navigation/app_navigation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MainScreenModel extends ChangeNotifier {
  BusTrips? busTrips;
  final departureCity = TextEditingController();
  final destinationCity = TextEditingController();
  final departureDate = TextEditingController();
  String? errorMessage;
  bool startFindLoading = false;

  void exitApp(context) {
    Navigator.of(context)
        .pushNamedAndRemoveUntil(RoutesName.loaderScreen, (route) => false);
  }

  Future<void> selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2100));
    if (picked != null) {
      departureDate.text = picked.toString().split(' ')[0];
    }
  }

  Future<void> busSearchButton() async {
    if (departureCity.text.isEmpty ||
        destinationCity.text.isEmpty ||
        departureDate.text.isEmpty) {
      errorMessage = 'Заполните поля';
      notifyListeners();
    } else {
      errorMessage = null;
      startFindLoading = true;
      notifyListeners();
      busTrips = await ApiClient.getBusTrips(
          departureCity: departureCity.text,
          destinitionCity: destinationCity.text,
          departureDate: departureDate.text);
      startFindLoading = false;
      notifyListeners();
    }
  }

  Future<void> refresh() async {
    if (busTrips == null) {
      departureCity.text = '';
      destinationCity.text = '';
      departureDate.text = '';
      errorMessage = null;
      notifyListeners();
    } else {
      busTrips = await ApiClient.getBusTrips(
          departureCity: departureCity.text,
          destinitionCity: destinationCity.text,
          departureDate: departureDate.text);
      notifyListeners();
    }
  }

  String getDay(String? date) {
    if (date == null) {
      return '';
    } else {
      DateTime dateTime = DateTime.parse(date);
      String formattedDay = DateFormat('d MMM', 'ru').format(dateTime);
      return formattedDay;
    }
  }

  String getTime(String? date) {
    if (date == null) {
      return '';
    } else {
      DateTime dateTime = DateTime.parse(date);
      String formattedTime = DateFormat.Hm().format(dateTime);
      return formattedTime;
    }
  }
}
