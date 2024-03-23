import 'package:bibitrip/ui/main_screen/main_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:bibitrip/ui/auth/auth_model.dart';
import 'package:bibitrip/ui/auth/auth_widget.dart';
import 'package:bibitrip/ui/loader_widget/loader_view_model.dart';
import 'package:bibitrip/ui/loader_widget/loader_widget.dart';
import 'package:bibitrip/ui/main_screen/main_screen_widget.dart';

class ScreenCreate {
  static loaderScreen() {
    return Provider(
      create: (context) => LoaderViewModel(context),
      lazy: false,
      child: const LoaderWidget(),
    );
  }

  static authScreen() {
    return ChangeNotifierProvider(
      create: (context) => AuthModel(),
      child: const AuthWidget(),
    );
  }

  Widget mainScreen() {
    return BlocProvider<MainScreenBloc>(
      create: (context) {
        return MainScreenBloc(context, MainScreenState());
      },
      lazy: false,
      child: const MainScreenWidget(),
    );
  }
}
