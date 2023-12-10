import 'package:dio/dio.dart';
import 'package:ten_twenty_test/app/core/core_view_models/core_view_model.dart';
import 'package:ten_twenty_test/app/navigator/app.router.dart';
import 'package:ten_twenty_test/app/navigator/app_navigator.dart';
import 'package:ten_twenty_test/models/movie_model.dart';
import 'package:ten_twenty_test/network/exceptions.dart';
import 'package:ten_twenty_test/repositories/movies/use_cases/fetch_upcomming_movies_use_case.dart';
import 'package:ten_twenty_test/shared/theme/app_theme.dart';

class WatchViewModel extends CoreViewModel {
  FetchUpcommingMoviesUseCase fetchUpcommingMoviesUseCase;
  WatchViewModel({
    required this.fetchUpcommingMoviesUseCase,
  });

  onSearch() {
    AppNavigator.navigateTo(
      DashboardViewRoutes.searchMoviesView,
      navigatorType: NavigatorType.dashboard,
    );
  }

  List<Movie> movies = [];
  String? pageError;
  CancelToken? cancelToken;

  fetchMovies() async {
    if (isBusy) {
      return;
    }
    if (cancelToken?.isCancelled ?? true) {
      cancelToken = CancelToken();
    }
    pageError = null;
    setBusy(true);
    try {
      final res = await fetchUpcommingMoviesUseCase.call(
        cancelToken: cancelToken,
      );
      if (res != null) {
        movies = res;
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
    fetchMovies();
    return super.initialise();
  }

  @override
  void dispose() {
    cancelToken?.cancel();
    super.dispose();
  }
}
