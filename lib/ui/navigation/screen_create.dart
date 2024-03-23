import 'package:provider/provider.dart';
import 'package:bibitrip/ui/auth/auth_model.dart';
import 'package:bibitrip/ui/auth/auth_widget.dart';
import 'package:bibitrip/ui/loader_widget/loader_view_model.dart';
import 'package:bibitrip/ui/loader_widget/loader_widget.dart';
import 'package:bibitrip/ui/main_screen/main_screen_model.dart';
import 'package:bibitrip/ui/main_screen/main_screen_widget.dart';

abstract class ScreenCreate {
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

  static mainScreen() {
    return ChangeNotifierProvider(
      create: (context) => MainScreenModel(),
      child: const MainScreenWidget(),
    );
  }
}
