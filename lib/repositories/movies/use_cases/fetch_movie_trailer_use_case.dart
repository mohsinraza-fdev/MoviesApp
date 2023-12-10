import 'package:dio/dio.dart';
import 'package:ten_twenty_test/app/service_locator/locator.dart';
import 'package:ten_twenty_test/network/exceptions.dart';
import 'package:ten_twenty_test/repositories/movies/movies_repo.dart';

class FetchMovieTrailerUseCase {
  final repo = locator<MoviesRepo>();
  FetchMovieTrailerUseCase();

  Future<String?> call({
    required int movieId,
    CancelToken? cancelToken,
  }) async {
    try {
      final res = await repo.fetchMovieTrailer(
        movieId: movieId,
        cancelToken: cancelToken,
      );
      if (res == null) {
        return null;
      }
      return res;
    } on ServerException catch (e) {
      throw (e.message);
    } on ClientException catch (e) {
      throw (e.message);
    } catch (e) {
      throw (e.toString());
    }
  }
}
