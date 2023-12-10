import 'package:flutter/material.dart';
import 'package:ten_twenty_test/app/core/core_view_models/core_view_model_widget.dart';
import 'package:ten_twenty_test/app/core/core_views/core_view.dart';
import 'package:ten_twenty_test/models/genre_model.dart';
import 'package:ten_twenty_test/presentation/dashboard/modules/watch/modules/search_movies/view_model/search_movies_view_model.dart';
import 'package:ten_twenty_test/presentation/dashboard/modules/watch/modules/search_movies/widgets/genre_card.dart';
import 'package:ten_twenty_test/repositories/movies/use_cases/search_movies_use_case.dart';
import 'package:ten_twenty_test/shared/assets_gen/assets.gen.dart';
import 'package:ten_twenty_test/shared/enums/app_device_orientation_enum.dart';
import 'package:ten_twenty_test/shared/theme/app_colors.dart';
import 'package:ten_twenty_test/shared/theme/app_text_styles.dart';
import 'package:ten_twenty_test/shared/theme/app_theme.dart';
import 'package:ten_twenty_test/widgets/app_bars/primary_app_bar.dart';
import 'package:ten_twenty_test/widgets/builders/app_responsive_builder.dart';
import 'package:ten_twenty_test/widgets/fields/app_search_field.dart';
import 'package:ten_twenty_test/widgets/list_tiles/movie_search_result_list_tile.dart';
import 'package:ten_twenty_test/widgets/others/app_loading_indicator.dart';

class SearchMoviesView extends CoreView<SearchMoviesViewModel> {
  const SearchMoviesView({super.key});

  @override
  Widget builder(
      BuildContext context, SearchMoviesViewModel viewModel, Widget? child) {
    return Scaffold(
      body: Column(
        children: [
          PrimaryAppBar(
            height: 85,
            child: Column(
              children: [
                const SizedBox(height: 8.5),
                AppSearchField(
                  controller: viewModel.searchController,
                  focusNode: viewModel.searchFocus,
                  textInputAction: TextInputAction.go,
                  hint: 'TV shows, movies and more',
                  onChanged: (text) {
                    viewModel.searchMovies();
                  },
                ),
              ],
            ),
          ),
          const Expanded(
            child: SearchMoviesViewBody(),
          ),
        ],
      ),
    );
  }

  @override
  SearchMoviesViewModel viewModelBuilder(BuildContext context) {
    return SearchMoviesViewModel(
      searchMoviesUseCase: SearchMoviesUseCase(),
    );
  }
}

class SearchMoviesViewBody extends CoreViewModelWidget<SearchMoviesViewModel> {
  const SearchMoviesViewBody({super.key});

  @override
  Widget build(BuildContext context, SearchMoviesViewModel viewModel) {
    if (viewModel.searchController.text.isEmpty) {
      return AppResponsiveBuilder(
        builder: (context, deviceType, deviceOrientation) {
          return GridView.count(
            crossAxisCount:
                deviceOrientation == AppDeviceOrientation.landscape ? 4 : 2,
            childAspectRatio: 163 / 100,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 30,
              bottom: 95,
            ),
            children: [
              (
                Genre.fromJson({"id": 35}),
                Assets.images.comedies.path,
                viewModel.searchMoviesByGenre
              ),
              (
                Genre.fromJson({"id": 80}),
                Assets.images.crime.path,
                viewModel.searchMoviesByGenre
              ),
              (
                Genre.fromJson({"id": 10751}),
                Assets.images.family.path,
                viewModel.searchMoviesByGenre
              ),
              (
                Genre.fromJson({"id": 99}),
                Assets.images.documentaries.path,
                viewModel.searchMoviesByGenre
              ),
              (
                Genre.fromJson({"id": 18}),
                Assets.images.dramas.path,
                viewModel.searchMoviesByGenre
              ),
              (
                Genre.fromJson({"id": 14}),
                Assets.images.fantacy.path,
                viewModel.searchMoviesByGenre
              ),
              (
                Genre.fromJson({"id": 9648}),
                Assets.images.mystery.path,
                viewModel.searchMoviesByGenre
              ),
              (
                Genre.fromJson({"id": 27}),
                Assets.images.horror.path,
                viewModel.searchMoviesByGenre
              ),
              (
                Genre.fromJson({"id": 878}),
                Assets.images.scifi.path,
                viewModel.searchMoviesByGenre
              ),
              (
                Genre.fromJson({"id": 53}),
                Assets.images.thriller.path,
                viewModel.searchMoviesByGenre
              ),
            ]
                .map((e) => GenreCard(
                      genre: e.$1,
                      image: e.$2,
                      onTap: e.$3,
                    ))
                .toList(),
          );
        },
      );
    }

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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Top Results',
              style: AppTextStyles.m12Poppins(AppColors.text),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            height: 1,
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            color: Colors.black.withOpacity(0.11),
          ),
          const SizedBox(height: 20),
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
