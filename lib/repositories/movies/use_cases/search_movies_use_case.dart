import 'package:dio/dio.dart';
import 'package:ten_twenty_test/app/service_locator/locator.dart';
import 'package:ten_twenty_test/models/movie_model.dart';
import 'package:ten_twenty_test/network/exceptions.dart';
import 'package:ten_twenty_test/repositories/movies/movies_repo.dart';

class SearchMoviesUseCase {
  final repo = locator<MoviesRepo>();
  SearchMoviesUseCase();

  Future<List<Movie>?> call({
    String keyword = '',
    CancelToken? cancelToken,
  }) async {
    try {
      final res = await repo.searchMovies(
        keyword: keyword,
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
