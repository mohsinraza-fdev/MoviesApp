import 'package:flutter/material.dart';
import 'package:ten_twenty_test/app/core/core_view_models/core_view_model_widget.dart';
import 'package:ten_twenty_test/presentation/dashboard/view_model/dashboard_view_model.dart';
import 'package:ten_twenty_test/presentation/dashboard/widgets/navigation_item.dart';
import 'package:ten_twenty_test/shared/assets_gen/assets.gen.dart';
import 'package:ten_twenty_test/shared/theme/app_theme.dart';

class AppBottomNavigationBar extends CoreViewModelWidget<DashboardViewModel> {
  const AppBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context, DashboardViewModel viewModel) {
    return Container(
      height: 75,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppTheme.colors(context).primary,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(27),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 17),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                children: [
                  Expanded(
                    child: NavigationItem(
                      label: 'Dashboard',
                      icon: Assets.icons.dashboard,
                      iconHeight: 16,
                      topFlexSpacing: 4,
                      bottomFlexSpacing: 8,
                      isSelected: viewModel.currentIndex == 0,
                      onTap: () => viewModel.updateNavIndex(0),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                      child: NavigationItem(
                    label: 'Watch',
                    icon: Assets.icons.watch,
                    iconHeight: 18,
                    topFlexSpacing: 3,
                    bottomFlexSpacing: 7,
                    isSelected: viewModel.currentIndex == 1,
                    onTap: () => viewModel.updateNavIndex(1),
                  )),
                  const SizedBox(width: 8),
                  Expanded(
                      child: NavigationItem(
                    label: 'Media Library',
                    icon: Assets.icons.mediaLibrary,
                    iconHeight: 18,
                    topFlexSpacing: 3,
                    bottomFlexSpacing: 7,
                    isSelected: viewModel.currentIndex == 2,
                    onTap: () => viewModel.updateNavIndex(2),
                  )),
                  const SizedBox(width: 8),
                  Expanded(
                      child: NavigationItem(
                    label: 'More',
                    icon: Assets.icons.more,
                    iconHeight: 12.4,
                    topFlexSpacing: 60,
                    bottomFlexSpacing: 98,
                    isSelected: viewModel.currentIndex == 3,
                    onTap: () => viewModel.updateNavIndex(3),
                  )),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
