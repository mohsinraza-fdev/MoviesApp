import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ten_twenty_test/app/core/core_view_models/core_view_model_widget.dart';
import 'package:ten_twenty_test/app/navigator/app_navigator.dart';
import 'package:ten_twenty_test/network/endpoints.dart';
import 'package:ten_twenty_test/presentation/dashboard/modules/watch/modules/movie_detail/view_model/movie_detail_view_model.dart';
import 'package:ten_twenty_test/presentation/dashboard/modules/watch/modules/movie_detail/widgets/genre_chip.dart';
import 'package:ten_twenty_test/presentation/dashboard/modules/watch/modules/movie_detail/widgets/header_shadow.dart';
import 'package:ten_twenty_test/shared/assets_gen/assets.gen.dart';
import 'package:ten_twenty_test/shared/helpers/utils.dart';
import 'package:ten_twenty_test/shared/theme/app_colors.dart';
import 'package:ten_twenty_test/shared/theme/app_text_styles.dart';
import 'package:ten_twenty_test/shared/theme/app_theme.dart';
import 'package:ten_twenty_test/widgets/buttons/app_primary_button.dart';
import 'package:ten_twenty_test/widgets/buttons/app_secondary_button.dart';
import 'package:ten_twenty_test/widgets/others/app_loading_indicator.dart';

class PotraitMovieDetailBody extends CoreViewModelWidget<MovieDetailViewModel> {
  final Color Function(int) chipColor;
  const PotraitMovieDetailBody({
    super.key,
    required this.chipColor,
  });

  @override
  Widget build(BuildContext context, MovieDetailViewModel viewModel) {
    return Stack(
      fit: StackFit.expand,
      children: [
        if (!viewModel.isBusy && viewModel.pageError == null)
          Column(
            children: [
              Container(
                height: screenHeight(context, multiplier: 480 / 812),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.grey,
                  image: viewModel.movie?.posterPath != null
                      ? DecorationImage(
                          image: NetworkImage(
                            '${Endpoints.storageBaseUrl}${viewModel.movie!.posterPath}',
                          ),
                          fit: BoxFit.cover,
                        )
                      : null,
                ),
              )
            ],
          ),
        const Column(
          children: [
            HeaderShadow(),
          ],
        ),
        if (viewModel.isBusy) const AppLoadingIndicator(),
        if (viewModel.pageError != null)
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                viewModel.pageError!,
                style:
                    AppTextStyles.m14Poppins(AppTheme.colors(context).primary),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        if (viewModel.movie != null)
          Column(
            children: [
              SizedBox(
                height: 51 + 12 + statusBarHeight(context),
              ),
              Container(
                height: screenHeight(context, multiplier: 480 / 812) -
                    (51 + 12 + statusBarHeight(context)),
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black.withOpacity(0.5),
                      Colors.black.withOpacity(0),
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'In Theaters ${DateFormat('MMMM dd, yyyy').format(viewModel.movie!.releaseDate)}',
                      style: AppTextStyles.m16Poppins(AppColors.white),
                    ),
                    const SizedBox(height: 15),
                    PrimaryButton(
                      label: 'Get Tickets',
                      width: 243,
                      onTap: () {},
                    ),
                    const SizedBox(height: 10),
                    AppSecondaryButton(
                      label: 'Watch Trailer',
                      width: 243,
                      icon: Assets.icons.play.svg(
                        width: 8,
                        height: 12,
                      ),
                      onTap: viewModel.startTrailer,
                    ),
                    const SizedBox(height: 34),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.white,
                  alignment: Alignment.topCenter,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 27),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: Text(
                            'Genres',
                            style: AppTextStyles.m16Poppins(AppColors.text),
                          ),
                        ),
                        const SizedBox(height: 14),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: Wrap(
                            spacing: 5,
                            runSpacing: 5,
                            children: List.generate(
                              viewModel.movie!.genres.length,
                              (index) => GenreChip(
                                label:
                                    viewModel.movie!.genres[index].toString(),
                                chipColor: chipColor(index),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 22),
                        Container(
                          height: 1,
                          alignment: Alignment.center,
                          margin: const EdgeInsets.symmetric(horizontal: 40),
                          color: Colors.black.withOpacity(0.05),
                        ),
                        const SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: Text(
                            'Overview',
                            style: AppTextStyles.m16Poppins(AppColors.text),
                          ),
                        ),
                        const SizedBox(height: 14),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: Text(
                            viewModel.movie!.overview,
                            style: AppTextStyles.r12Poppins(
                              const Color(0xFF8F8F8F),
                            ),
                          ),
                        ),
                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        Positioned(
          left: 0,
          top: 0,
          right: 0,
          child: Container(
            height: 51 + 12 + statusBarHeight(context),
            padding: EdgeInsets.only(top: statusBarHeight(context)),
            alignment: Alignment.center,
            child: Row(
              children: [
                const SizedBox(width: 13),
                GestureDetector(
                  onTap: () => AppNavigator.pop(),
                  child: Assets.icons.arrowBack.svg(
                    height: 30,
                    width: 30,
                    colorFilter: ColorFilter.mode(
                      AppColors.white,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Text(
                  'Watch',
                  style: AppTextStyles.m16Poppins(AppColors.white),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
