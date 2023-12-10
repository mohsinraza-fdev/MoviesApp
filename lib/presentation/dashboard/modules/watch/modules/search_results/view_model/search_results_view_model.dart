import 'package:dio/dio.dart';
import 'package:ten_twenty_test/app/core/core_view_models/core_view_model.dart';
import 'package:ten_twenty_test/app/navigator/app.router.dart';
import 'package:ten_twenty_test/app/navigator/app_navigator.dart';
import 'package:ten_twenty_test/models/movie_model.dart';
import 'package:ten_twenty_test/network/exceptions.dart';
import 'package:ten_twenty_test/repositories/movies/use_cases/search_movies_by_genre_use_case.dart';
import 'package:ten_twenty_test/shared/theme/app_theme.dart';

class SearchResultsViewModel extends CoreViewModel {
  int genreId;
  SearchMoviesByGenreUseCase searchMoviesByGenreUseCase;
  SearchResultsViewModel({
    required this.genreId,
    required this.searchMoviesByGenreUseCase,
  });

  List<Movie> searchResults = [];
  String? pageError;
  CancelToken? cancelToken;

  searchMoviesByGenreId() async {
    if (isBusy) {
      return;
    }
    cancelToken?.cancel();
    cancelToken = CancelToken();
    pageError = null;
    setBusy(true);
    try {
      final res = await searchMoviesByGenreUseCase.call(
        genreId: genreId,
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
    setBusy(false);
  }

  openMovieDetail(int movieId) {
    AppTheme.brightenStatusBar();
    AppNavigator.navigateTo(
      Routes.movieDetailView,
      arguments: MovieDetailViewArguments(movieId: movieId),
    )?.then((value) => AppTheme.darkenStatusBar());
  }

  @override
  Future<void> initialise() {
    searchMoviesByGenreId();
    return super.initialise();
  }

  @override
  void dispose() {
    cancelToken?.cancel();
    super.dispose();
  }
}
