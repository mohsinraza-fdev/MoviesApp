import 'package:flutter/material.dart';
import 'package:ten_twenty_test/app/core/core_views/core_view.dart';
import 'package:ten_twenty_test/app/navigator/app_navigator.dart';
import 'package:ten_twenty_test/presentation/dashboard/view_model/dashboard_view_model.dart';
import 'package:ten_twenty_test/presentation/dashboard/widgets/app_bottom_navigation_bar.dart';
import 'package:ten_twenty_test/widgets/builders/app_responsive_builder.dart';

class DashboardView extends CoreView<DashboardViewModel> {
  const DashboardView({super.key});

  @override
  Widget builder(
      BuildContext context, DashboardViewModel viewModel, Widget? child) {
    return AppResponsiveBuilder(
      builder: (context, deviceType, deviceOrientation) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: [
              WillPopScope(
                onWillPop: () async {
                  if (AppNavigator.dashboardKey?.currentState?.canPop() ??
                      false) {
                    AppNavigator.pop(
                      navigatorType: NavigatorType.dashboard,
                    );
                    return false;
                  }
                  return true;
                },
                child: Navigator(
                  key: AppNavigator.dashboardKey,
                  onGenerateRoute: AppNavigator.onGenerateDashboardRoute,
                ),
              ),
              const Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: AppBottomNavigationBar(),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  DashboardViewModel viewModelBuilder(BuildContext context) {
    return DashboardViewModel();
  }
}
