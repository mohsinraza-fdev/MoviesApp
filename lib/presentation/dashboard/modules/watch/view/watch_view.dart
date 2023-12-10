import 'package:flutter/material.dart';
import 'package:ten_twenty_test/app/core/core_view_models/core_view_model_widget.dart';
import 'package:ten_twenty_test/app/core/core_views/core_view.dart';
import 'package:ten_twenty_test/app/service_locator/locator.dart';
import 'package:ten_twenty_test/presentation/dashboard/modules/watch/view_model/watch_view_model.dart';
import 'package:ten_twenty_test/presentation/dashboard/modules/watch/widgets/upcomming_movie_card.dart';
import 'package:ten_twenty_test/shared/assets_gen/assets.gen.dart';
import 'package:ten_twenty_test/shared/enums/app_device_orientation_enum.dart';
import 'package:ten_twenty_test/shared/theme/app_colors.dart';
import 'package:ten_twenty_test/shared/theme/app_text_styles.dart';
import 'package:ten_twenty_test/shared/theme/app_theme.dart';
import 'package:ten_twenty_test/widgets/app_bars/primary_app_bar.dart';
import 'package:ten_twenty_test/widgets/builders/app_responsive_builder.dart';
import 'package:ten_twenty_test/widgets/others/app_loading_indicator.dart';

class WatchView extends CoreView<WatchViewModel> {
  const WatchView({super.key});

  @override
  Widget builder(
      BuildContext context, WatchViewModel viewModel, Widget? child) {
    return Scaffold(
      body: Column(
        children: [
          PrimaryAppBar(
            child: Row(
              children: [
                const SizedBox(width: 22),
                Text(
                  'Watch',
                  style: AppTextStyles.m16Poppins(AppColors.text),
                ),
                const Spacer(),
                GestureDetector(
                    onTap: viewModel.onSearch,
                    child: Assets.icons.search.svg(height: 36, width: 36)),
                const SizedBox(width: 13),
              ],
            ),
          ),
          const Expanded(
            child: WatchViewBody(),
          ),
        ],
      ),
    );
  }

  @override
  bool get disposeViewModel => false;

  @override
  WatchViewModel viewModelBuilder(BuildContext context) {
    return locator<WatchViewModel>();
  }
}

class WatchViewBody extends CoreViewModelWidget<WatchViewModel> {
  const WatchViewBody({super.key});

  @override
  Widget build(BuildContext context, WatchViewModel viewModel) {
    if (viewModel.movies.isEmpty && viewModel.isBusy) {
      return const AppLoadingIndicator();
    }

    if (viewModel.movies.isEmpty && viewModel.pageError != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            viewModel.pageError!,
            style: AppTextStyles.m14Poppins(AppTheme.colors(context).primary),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }
    return AppResponsiveBuilder(
        builder: (context, deviceType, deviceOrientation) {
      if (deviceOrientation == AppDeviceOrientation.potrait) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(height: 30),
                ...List.generate(
                  viewModel.movies.length,
                  (index) => Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: UpcommingMovieCard(
                      movie: viewModel.movies[index],
                      onTap: (movie) => viewModel.openMovieDetail(movie.id),
                    ),
                  ),
                ),
                const SizedBox(height: 75),
              ],
            ),
          ),
        );
      }
      return GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 335 / 180,
        padding: const EdgeInsets.only(
          top: 30,
          left: 20,
          right: 20,
          bottom: 95,
        ),
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        children: List.generate(
          viewModel.movies.length,
          (index) => UpcommingMovieCard(
            movie: viewModel.movies[index],
            onTap: (movie) => viewModel.openMovieDetail(movie.id),
          ),
        ),
      );
    });
  }
}
