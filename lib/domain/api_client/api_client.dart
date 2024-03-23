import 'dart:io';
import 'package:bibitrip/domain/entity/bus_trips.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';

abstract class ApiClient {
  static Future<BusTrips> getBusTrips(
      {required String departureCity,
      required String destinitionCity,
      required String departureDate}) async {
    Dio dio = Dio();
    (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () =>
        HttpClient()
          ..badCertificateCallback =
              (X509Certificate cert, String host, int port) => true;
    final request = await dio.get(
        'http://bibiptrip.com/api/avibus/search_trips_cities/?departure_city=$departureCity&destination_city=$destinitionCity&date=$departureDate');
    return BusTrips.fromJson(request.data);
  }
}
