import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:ten_twenty_test/app/navigator/app_navigator.dart';
import 'package:ten_twenty_test/app/service_locator/locator.dart';
import 'package:ten_twenty_test/network/api_client/api_client.dart';
import 'package:ten_twenty_test/shared/theme/app_theme.dart';

void main() async {
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('assets/fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });
  WidgetsFlutterBinding.ensureInitialized();
  AppTheme.setStatusBarColor(Colors.transparent);
  AppTheme.darkenStatusBar();
  await setupLocator();
  locator<ApiClient>().initialise();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ten Twenty Test',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      navigatorKey: AppNavigator.key,
      onGenerateRoute: AppNavigator.onGenerateRoute,
      navigatorObservers: [StackedService.routeObserver],
    );
  }
}
