import 'package:flutter/material.dart';
import 'package:ten_twenty_test/app/core/core_view_models/core_view_model_widget.dart';
import 'package:ten_twenty_test/app/core/core_views/core_view.dart';
import 'package:ten_twenty_test/app/navigator/app_navigator.dart';
import 'package:ten_twenty_test/presentation/dashboard/modules/watch/modules/search_results/view_model/search_results_view_model.dart';
import 'package:ten_twenty_test/repositories/movies/use_cases/search_movies_by_genre_use_case.dart';
import 'package:ten_twenty_test/shared/assets_gen/assets.gen.dart';
import 'package:ten_twenty_test/shared/theme/app_colors.dart';
import 'package:ten_twenty_test/shared/theme/app_text_styles.dart';
import 'package:ten_twenty_test/shared/theme/app_theme.dart';
import 'package:ten_twenty_test/widgets/app_bars/primary_app_bar.dart';
import 'package:ten_twenty_test/widgets/list_tiles/movie_search_result_list_tile.dart';
import 'package:ten_twenty_test/widgets/others/app_loading_indicator.dart';

class SearchResultsView extends CoreView<SearchResultsViewModel> {
  final int genreId;
  const SearchResultsView({super.key, required this.genreId});

  @override
  Widget builder(
      BuildContext context, SearchResultsViewModel viewModel, Widget? child) {
    return Scaffold(
      body: Column(
        children: [
          PrimaryAppBar(
            child: Row(
              children: [
                const SizedBox(width: 13),
                GestureDetector(
                  onTap: () {
                    AppNavigator.pop(navigatorType: NavigatorType.dashboard);
                  },
                  child: Assets.icons.arrowBack.svg(
                    width: 30,
                    height: 30,
                    colorFilter: ColorFilter.mode(
                      AppColors.text,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                if (!viewModel.isBusy && (viewModel.pageError == null))
                  Text(
                    '${viewModel.searchResults.length} Results Found',
                    style: AppTextStyles.m16Poppins(AppColors.text),
                  ),
                const Spacer(),
              ],
            ),
          ),
          const Expanded(
            child: SearchResultsViewBody(),
          ),
        ],
      ),
    );
  }

  @override
  SearchResultsViewModel viewModelBuilder(BuildContext context) {
    return SearchResultsViewModel(
      genreId: genreId,
      searchMoviesByGenreUseCase: SearchMoviesByGenreUseCase(),
    );
  }
}

class SearchResultsViewBody
    extends CoreViewModelWidget<SearchResultsViewModel> {
  const SearchResultsViewBody({super.key});

  @override
  Widget build(BuildContext context, SearchResultsViewModel viewModel) {
    if (viewModel.isBusy) {
      return const AppLoadingIndicator();
    }
    if (viewModel.pageError != null) {
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
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 30),
          ...List.generate(
            viewModel.searchResults.length,
            (index) => Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: MovieSearchResultListTile(
                movie: viewModel.searchResults[index],
                onTap: () => viewModel
                    .openMovieDetail(viewModel.searchResults[index].id),
              ),
            ),
          ),
          const SizedBox(height: 75),
        ],
      ),
    );
  }
}
