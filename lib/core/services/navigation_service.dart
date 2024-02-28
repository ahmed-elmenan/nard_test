import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static NavigationService get instance =>
      GetIt.instance.get<NavigationService>();

  BuildContext get context => navigatorKey.currentState!.context;

  goBack({result}) {
    if (navigatorKey.currentState!.canPop()) {
      navigatorKey.currentState!.pop(result);
    }
  }

  void popAll() => navigatorKey.currentState!
      .popUntil((route) => route.settings.name == null);

  goBackUntil({required String namedRoute, bool? result}) =>
      navigatorKey.currentState!.pushNamedAndRemoveUntil(
          namedRoute, (Route<dynamic> route) => false,
          arguments: result);
}
