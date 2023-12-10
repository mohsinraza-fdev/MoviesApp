import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ten_twenty_test/app/core/core_view_models/core_view_model.dart';
import 'package:ten_twenty_test/app/navigator/app.router.dart';
import 'package:ten_twenty_test/app/navigator/app_navigator.dart';
import 'package:ten_twenty_test/models/genre_model.dart';
import 'package:ten_twenty_test/models/movie_model.dart';
import 'package:ten_twenty_test/network/exceptions.dart';
import 'package:ten_twenty_test/repositories/movies/use_cases/search_movies_use_case.dart';
import 'package:ten_twenty_test/shared/theme/app_theme.dart';

class SearchMoviesViewModel extends CoreViewModel {
  SearchMoviesUseCase searchMoviesUseCase;
  SearchMoviesViewModel({
    required this.searchMoviesUseCase,
  });

  late TextEditingController searchController = getTextEditingController();
  late FocusNode searchFocus = getFocusNode();

  List<Movie> searchResults = [];
  String? pageError;
  CancelToken? cancelToken;

  int funcId = 0;
  searchMovies() async {
    cancelToken?.cancel();
    cancelToken = CancelToken();
    int id = ++funcId;
    searchResults.clear();
    pageError = null;
    if (searchController.text.isEmpty) {
      setBusy(false);
      return;
    }
    setBusy(true);
    try {
      final res = await searchMoviesUseCase.call(
        keyword: searchController.text,
        cancelToken: cancelToken,
      );
      if (res != null) {
        searchResults =
            res.where((element) => element.genreIds.isNotEmpty).toList();
      }
    } catch (e) {
      if (e is! CancelTokenException) {
        pageError = e.toString();
      }
    }
    if (id == funcId) {
      setBusy(false);
    }
  }

  openMovieDetail(int movieId) {
    AppNavigator.navigateTo(
      Routes.movieDetailView,
      arguments: MovieDetailViewArguments(movieId: movieId),
    );
  }

  searchMoviesByGenre(Genre genre) {
    AppTheme.brightenStatusBar();
    AppNavigator.navigateTo(
      DashboardViewRoutes.searchResultsView,
      arguments: NestedSearchResultsViewArguments(genreId: genre.id),
      navigatorType: NavigatorType.dashboard,
    )?.then((value) => AppTheme.darkenStatusBar());
  }

  @override
  void dispose() {
    cancelToken?.cancel();
    super.dispose();
  }
}
