import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:ten_twenty_test/app/navigator/app.router.dart';
import 'package:ten_twenty_test/app/service_locator/locator.dart';

class AppNavigator {
  static final NavigationService _navigationService =
      locator<NavigationService>();

  static GlobalKey<NavigatorState>? get key => StackedService.navigatorKey;
  static Route<dynamic>? Function(RouteSettings) get onGenerateRoute =>
      StackedRouter().onGenerateRoute;

  static GlobalKey<NavigatorState>? get dashboardKey =>
      StackedService.nestedNavigationKey(1);
  static Route<dynamic>? Function(RouteSettings) get onGenerateDashboardRoute =>
      DashboardViewRouter().onGenerateRoute;

  static BuildContext? get currentContext => key?.currentContext;
  static String get currentRoute => _navigationService.currentRoute;
  static String get previousRoute => _navigationService.previousRoute;

  static Future<T?>? navigateTo<T>(
    String routeName, {
    dynamic arguments,
    NavigatorType navigatorType = NavigatorType.main,
  }) =>
      _navigationService.navigateTo<T>(
        routeName,
        arguments: arguments,
        id: _getNavigatorKeyFromType(navigatorType),
      );

  static Future<T?>? navigateWithTransition<T>(
    Widget page, {
    String? routeName,
    Duration? duration,
    Curve? curve,
    Transition? transitionStyle,
    NavigatorType navigatorType = NavigatorType.main,
  }) =>
      _navigationService.navigateWithTransition<T>(
        page,
        routeName: routeName,
        duration: duration,
        curve: curve,
        transitionStyle: transitionStyle,
        id: _getNavigatorKeyFromType(navigatorType),
      );

  static Future<T?>? replaceWith<T>(
    String routeName, {
    dynamic arguments,
    NavigatorType navigatorType = NavigatorType.main,
  }) =>
      _navigationService.replaceWith<T>(
        routeName,
        arguments: arguments,
        id: _getNavigatorKeyFromType(navigatorType),
      );

  static Future<T?>? clearStackAndShow<T>(
    String routeName, {
    dynamic arguments,
    NavigatorType navigatorType = NavigatorType.main,
  }) =>
      _navigationService.clearStackAndShow<T>(
        routeName,
        arguments: arguments,
        id: _getNavigatorKeyFromType(navigatorType),
      );

  static void popUntill(
    String routeName, {
    NavigatorType navigatorType = NavigatorType.main,
  }) =>
      _navigationService.popUntil(
        ModalRoute.withName(routeName),
        id: _getNavigatorKeyFromType(navigatorType),
      );

  static void popRepeated(
    int popTimes,
  ) =>
      _navigationService.popRepeated(popTimes);

  static bool pop({
    dynamic result,
    NavigatorType navigatorType = NavigatorType.main,
  }) =>
      _navigationService.back(
        result: result,
        id: _getNavigatorKeyFromType(navigatorType),
      );

  static int? _getNavigatorKeyFromType(NavigatorType type) {
    switch (type) {
      case NavigatorType.main:
        return null;
      case NavigatorType.dashboard:
        return 1;
    }
  }
}

enum NavigatorType {
  main,
  dashboard,
}
