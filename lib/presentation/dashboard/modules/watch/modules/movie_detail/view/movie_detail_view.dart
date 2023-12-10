import 'package:flutter/material.dart';
import 'package:ten_twenty_test/app/core/core_views/core_view.dart';
import 'package:ten_twenty_test/app/navigator/app_navigator.dart';
import 'package:ten_twenty_test/network/endpoints.dart';
import 'package:ten_twenty_test/presentation/dashboard/modules/watch/modules/movie_detail/view_model/movie_detail_view_model.dart';
import 'package:ten_twenty_test/repositories/movies/use_cases/fetch_movie_detail_use_case.dart';
import 'package:ten_twenty_test/repositories/movies/use_cases/fetch_movie_trailer_use_case.dart';
import 'package:ten_twenty_test/shared/assets_gen/assets.gen.dart';
import 'package:ten_twenty_test/shared/helpers/utils.dart';
import 'package:ten_twenty_test/shared/theme/app_colors.dart';
import 'package:ten_twenty_test/shared/theme/app_text_styles.dart';
import 'package:intl/intl.dart';
import 'package:ten_twenty_test/shared/theme/app_theme.dart';
import 'package:ten_twenty_test/widgets/others/app_loading_indicator.dart';

class MovieDetailView extends CoreView<MovieDetailViewModel> {
  final int movieId;
  const MovieDetailView({
    super.key,
    required this.movieId,
  });

  @override
  Widget builder(
      BuildContext context, MovieDetailViewModel viewModel, Widget? child) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
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
          Column(
            children: [
              Container(
                height: 164,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black.withOpacity(0.5),
                      Colors.black.withOpacity(0),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ],
          ),
          if (viewModel.isBusy) const AppLoadingIndicator(),
          if (viewModel.pageError != null)
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  viewModel.pageError!,
                  style: AppTextStyles.m14Poppins(
                      AppTheme.colors(context).primary),
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
                      Container(
                        height: 50,
                        width: 243,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: AppColors.blue,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          'Get Tickets',
                          style: AppTextStyles.s14Poppins(AppColors.white),
                        ),
                      ),
                      const SizedBox(height: 10),
                      GestureDetector(
                        onTap: () => viewModel.startTrailer(),
                        child: Container(
                          height: 50,
                          width: 243,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(10),
                              border:
                                  Border.all(width: 1, color: AppColors.blue)),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Assets.icons.play.svg(
                                width: 8,
                                height: 12,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'Watch Trailer',
                                style:
                                    AppTextStyles.s14Poppins(AppColors.white),
                              ),
                            ],
                          ),
                        ),
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
                                (index) => Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: _colorFromIndex(index),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Text(
                                    viewModel.movie!.genres[index].toString(),
                                    style: AppTextStyles.s12Poppins(
                                        AppColors.white),
                                  ),
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
                    onTap: () => AppNavigator.pop(
                        navigatorType: NavigatorType.dashboard),
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
      ),
    );
  }

  Color _colorFromIndex(int index) {
    List<Color> colorList = [
      const Color(0xFF15D2BC),
      const Color(0xFFE26CA5),
      const Color(0xFF564CA3),
      const Color(0xFFCD9D0F),
      const Color(0xFF2E86C1),
      const Color(0xFFCB4335),
    ];
    return colorList[(index) % 6];
  }

  @override
  MovieDetailViewModel viewModelBuilder(BuildContext context) {
    return MovieDetailViewModel(
      movieId: movieId,
      fetchMovieDetailUseCase: FetchMovieDetailUseCase(),
      fetchMovieTrailerUseCase: FetchMovieTrailerUseCase(),
    );
  }
}
