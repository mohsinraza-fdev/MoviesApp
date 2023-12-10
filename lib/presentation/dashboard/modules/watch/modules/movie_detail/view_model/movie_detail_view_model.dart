import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:ten_twenty_test/app/core/core_view_models/core_view_model.dart';
import 'package:ten_twenty_test/app/navigator/app.router.dart';
import 'package:ten_twenty_test/app/navigator/app_navigator.dart';
import 'package:ten_twenty_test/models/movie_detail_model.dart';
import 'package:ten_twenty_test/network/exceptions.dart';
import 'package:ten_twenty_test/repositories/movies/use_cases/fetch_movie_detail_use_case.dart';
import 'package:ten_twenty_test/repositories/movies/use_cases/fetch_movie_trailer_use_case.dart';

class MovieDetailViewModel extends CoreViewModel {
  int movieId;
  FetchMovieDetailUseCase fetchMovieDetailUseCase;
  FetchMovieTrailerUseCase fetchMovieTrailerUseCase;
  MovieDetailViewModel({
    required this.movieId,
    required this.fetchMovieDetailUseCase,
    required this.fetchMovieTrailerUseCase,
  });

  MovieDetail? movie;
  String? trailer;

  String? pageError;
  CancelToken? cancelToken;

  fetchMovieDetail() async {
    if (isBusy) {
      return;
    }
    if (cancelToken?.isCancelled ?? true) {
      cancelToken = CancelToken();
    }
    pageError = null;
    setBusy(true);
    try {
      final res = await fetchMovieDetailUseCase.call(
        movieId: movieId,
        cancelToken: cancelToken,
      );
      trailer = await fetchMovieTrailerUseCase.call(
        movieId: movieId,
        cancelToken: cancelToken,
      );
      if (res != null) {
        movie = res;
      }
    } catch (e) {
      if (e == 'trailer_not_found') {
        pageError = 'Failed to fetch movie details';
        movie = null;
      }
      if (e is! CancelTokenException) {
        pageError = e.toString();
      }
    }
    setBusy(false);
  }

  startTrailer() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    AppNavigator.navigateTo(
      Routes.watchTrailerView,
      arguments: WatchTrailerViewArguments(
        linkCode: trailer!,
      ),
    )?.then((value) =>
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge));
  }

  @override
  Future<void> initialise() {
    fetchMovieDetail();
    return super.initialise();
  }

  @override
  void dispose() {
    cancelToken?.cancel();
    super.dispose();
  }
}
