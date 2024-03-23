import 'package:bibitrip/domain/api_client/api_client.dart';
import 'package:bibitrip/domain/entity/bus_trips.dart';
import 'package:bibitrip/ui/navigation/app_navigation.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

abstract class MainScreenEvent {}

class BusTripsLoadEvent extends MainScreenEvent {
  MainScreenState state;
  BusTripsLoadEvent({
    required this.state,
  });
}

class CheckFailure extends MainScreenEvent {
  MainScreenState state;
  CheckFailure({
    required this.state,
  });
}

class ExitToAppEvent extends MainScreenEvent {
  final BuildContext context;

  ExitToAppEvent(this.context);
}

class MainScreenInitialEvent extends MainScreenEvent {
  MainScreenState state;
  MainScreenInitialEvent({
    required this.state,
  });
}

class MainScreenRefreshEvent extends MainScreenEvent {
  MainScreenState state;
  MainScreenRefreshEvent({
    required this.state,
  });
}

class MainScreenState {
  BusTrips? busTrips;
  TextEditingController departureCity = TextEditingController();
  TextEditingController destinationCity = TextEditingController();
  TextEditingController departureDate = TextEditingController();
  String? errorMessage;
  bool startFindLoading = false;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MainScreenState &&
          runtimeType == other.runtimeType &&
          departureCity == other.departureCity &&
          destinationCity == other.destinationCity &&
          departureDate == other.departureDate &&
          errorMessage == other.errorMessage &&
          startFindLoading == other.startFindLoading;

  MainScreenState copyWith({
    busTrips,
    departureCity,
    destinationCity,
    departureDate,
    errorMessage,
    startFindLoading,
  }) {
    return MainScreenState()
      ..busTrips = busTrips ?? this.busTrips
      ..departureCity = departureCity ?? this.departureCity
      ..destinationCity = destinationCity ?? this.destinationCity
      ..departureDate = departureDate ?? this.departureDate
      ..errorMessage = errorMessage ?? this.errorMessage
      ..startFindLoading = startFindLoading ?? this.startFindLoading;
  }
}

class MainScreenBloc extends Bloc<MainScreenEvent, MainScreenState> {
  BuildContext context;
  MainScreenBloc(this.context, MainScreenState initialState)
      : super(initialState) {
    Future.microtask(() {
      on<MainScreenEvent>((event, emit) async {
        if (event is MainScreenRefreshEvent) {
          emit(event.state);
        } else if (event is BusTripsLoadEvent) {
          emit(event.state);
        } else if (event is ExitToAppEvent) {
          exitApp(context);
        } else if (event is CheckFailure) {
          emit(event.state);
        }
      }, transformer: sequential());
    });
  }
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
      state.departureDate.text = picked.toString().split(' ')[0];
    }
  }

  Future<void> busSearchButton() async {
    if (state.departureCity.text.isEmpty ||
        state.destinationCity.text.isEmpty ||
        state.departureDate.text.isEmpty) {
      final failureState = MainScreenState()
        ..busTrips = state.busTrips
        ..departureCity = state.departureCity
        ..destinationCity = state.destinationCity
        ..departureDate = state.departureDate
        ..errorMessage = 'Заполните поля'
        ..startFindLoading = false;
      add(CheckFailure(state: failureState));
    } else {
      final circularProgresState = MainScreenState()
        ..busTrips = state.busTrips
        ..departureCity = state.departureCity
        ..destinationCity = state.destinationCity
        ..departureDate = state.departureDate
        ..errorMessage = null
        ..startFindLoading = true;
      add(BusTripsLoadEvent(state: circularProgresState));
      circularProgresState.busTrips = await ApiClient.getBusTrips(
          departureCity: circularProgresState.departureCity.text,
          destinitionCity: circularProgresState.destinationCity.text,
          departureDate: circularProgresState.departureDate.text);
      final downloadState = MainScreenState()
        ..busTrips = circularProgresState.busTrips
        ..departureCity = circularProgresState.departureCity
        ..destinationCity = circularProgresState.destinationCity
        ..departureDate = circularProgresState.departureDate
        ..errorMessage = null
        ..startFindLoading = false;
      add(BusTripsLoadEvent(state: downloadState));
    }
  }

  Future<void> refresh() async {
    if (state.busTrips == null) {
      state.departureCity.text = '';
      state.destinationCity.text = '';
      state.departureDate.text = '';
      final refreshState = MainScreenState()
        ..busTrips = state.busTrips
        ..departureCity = state.departureCity
        ..destinationCity = state.destinationCity
        ..departureDate = state.departureDate
        ..errorMessage = null
        ..startFindLoading = false;
      add(MainScreenRefreshEvent(state: refreshState));
    } else {
      state.busTrips = await ApiClient.getBusTrips(
          departureCity: state.departureCity.text,
          destinitionCity: state.destinationCity.text,
          departureDate: state.departureDate.text);
      final refreshState = MainScreenState()
        ..busTrips = state.busTrips
        ..departureCity = state.departureCity
        ..destinationCity = state.destinationCity
        ..departureDate = state.departureDate
        ..errorMessage = null
        ..startFindLoading = false;
      add(MainScreenRefreshEvent(state: refreshState));
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
