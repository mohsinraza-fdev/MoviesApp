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

class LandscapeMovieDetailBody
    extends CoreViewModelWidget<MovieDetailViewModel> {
  final Color Function(int) chipColor;
  const LandscapeMovieDetailBody({
    super.key,
    required this.chipColor,
  });

  @override
  Widget build(BuildContext context, MovieDetailViewModel viewModel) {
    return Row(
      children: [
        Expanded(
          flex: 375,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.grey,
                  image: viewModel.movie?.posterPath != null
                      ? DecorationImage(
                          alignment: Alignment.center,
                          image: NetworkImage(
                            '${Endpoints.storageBaseUrl}${viewModel.movie!.posterPath}',
                          ),
                          fit: BoxFit.cover,
                        )
                      : null,
                ),
              ),
              const Column(
                children: [
                  HeaderShadow(),
                ],
              ),
              if (viewModel.movie != null)
                Container(
                  height:
                      screenHeight(context) - (150 + statusBarHeight(context)),
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
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'In Theaters ${DateFormat('MMMM dd, yyyy').format(viewModel.movie!.releaseDate)}',
                        style: AppTextStyles.m16Poppins(AppColors.white),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          const SizedBox(width: 14),
                          Expanded(
                            child: PrimaryButton(
                              label: 'Get Tickets',
                              onTap: () {},
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: AppSecondaryButton(
                              label: 'Watch Trailer',
                              icon: Assets.icons.play.svg(
                                width: 8,
                                height: 12,
                              ),
                              onTap: viewModel.startTrailer,
                            ),
                          ),
                          const SizedBox(width: 14),
                        ],
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              Positioned(
                left: 0,
                top: 0,
                right: 0,
                child: Container(
                  height: 51 + statusBarHeight(context),
                  padding: EdgeInsets.only(top: statusBarHeight(context)),
                  alignment: Alignment.topLeft,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
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
              )
            ],
          ),
        ),
        Expanded(
          flex: 437,
          child: Container(
            color: Colors.white,
            alignment: Alignment.center,
            child: viewModel.isBusy
                ? const AppLoadingIndicator()
                : viewModel.pageError != null
                    ? Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            viewModel.pageError!,
                            style: AppTextStyles.m14Poppins(
                                AppTheme.colors(context).primary),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    : Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: statusBarHeight(context)),
                          child: SingleChildScrollView(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 7),
                                  Text(
                                    'Genres',
                                    style: AppTextStyles.m16Poppins(
                                        AppColors.text),
                                  ),
                                  const SizedBox(height: 14),
                                  Wrap(
                                    spacing: 5,
                                    runSpacing: 5,
                                    children: List.generate(
                                      viewModel.movie!.genres.length,
                                      (index) => GenreChip(
                                        label: viewModel.movie!.genres[index]
                                            .toString(),
                                        chipColor: chipColor(index),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 15),
                                  Container(
                                    height: 1,
                                    alignment: Alignment.center,
                                    color: Colors.black.withOpacity(0.05),
                                  ),
                                  const SizedBox(height: 22),
                                  Text(
                                    'Overview',
                                    style: AppTextStyles.m16Poppins(
                                        AppColors.text),
                                  ),
                                  const SizedBox(height: 14),
                                  Text(
                                    viewModel.movie!.overview,
                                    style: AppTextStyles.r12Poppins(
                                      const Color(0xFF8F8F8F),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
          ),
        ),
      ],
    );
  }
}
