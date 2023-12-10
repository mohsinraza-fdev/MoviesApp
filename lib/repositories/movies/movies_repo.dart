import 'package:dio/dio.dart';
import 'package:ten_twenty_test/app/service_locator/locator.dart';
import 'package:ten_twenty_test/models/movie_detail_model.dart';
import 'package:ten_twenty_test/models/movie_model.dart';
import 'package:ten_twenty_test/network/api_client/api_client.dart';
import 'package:ten_twenty_test/network/endpoints.dart';
import 'package:ten_twenty_test/shared/helpers/utils.dart';

class MoviesRepo {
  final client = locator<ApiClient>();

  Future<List<Movie>?> fetchUpcommingMovies({CancelToken? cancelToken}) async {
    try {
      Map<String, dynamic>? resp = await client.get<Map<String, dynamic>>(
        Endpoints.fetchUpcommingMovies,
        cancelToken: cancelToken,
      );
      if (resp == null) {
        return null;
      }
      return parseModel<List<Movie>>(
        () => (resp["results"] as List).map((e) => Movie.fromJson(e)).toList(),
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<MovieDetail?> fetchMovieDetails({
    required int movieId,
    CancelToken? cancelToken,
  }) async {
    try {
      Map<String, dynamic>? resp = await client.get<Map<String, dynamic>>(
        Endpoints.fetchMovieDetail(movieId),
        cancelToken: cancelToken,
      );
      if (resp == null) {
        return null;
      }
      return parseModel<MovieDetail>(
        () => MovieDetail.fromJson(resp),
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<String?> fetchMovieTrailer({
    required int movieId,
    CancelToken? cancelToken,
  }) async {
    try {
      Map<String, dynamic>? resp = await client.get<Map<String, dynamic>>(
        Endpoints.fetchMovieTrailer(movieId),
        cancelToken: cancelToken,
      );
      if (resp == null) {
        return null;
      }
      List officialMovies = (resp["results"] as List)
          .where((element) => element["official"] == true)
          .toList();
      if (officialMovies.isEmpty) {
        throw ('trailer_not_found');
      }
      return (officialMovies[0]["key"] as String);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Movie>?> searchMovies({
    String keyword = '',
    CancelToken? cancelToken,
  }) async {
    try {
      Map<String, dynamic>? resp = await client.get<Map<String, dynamic>>(
        Endpoints.searchMovies,
        cancelToken: cancelToken,
        queryParameters: {
          "query": keyword,
        },
      );
      if (resp == null) {
        return null;
      }
      return parseModel<List<Movie>>(
        () => (resp["results"] as List).map((e) => Movie.fromJson(e)).toList(),
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Movie>?> searchMoviesByGenre({
    required int genreId,
    CancelToken? cancelToken,
  }) async {
    try {
      Map<String, dynamic>? resp = await client.get<Map<String, dynamic>>(
        Endpoints.searchMoviesByGenre,
        cancelToken: cancelToken,
        queryParameters: {
          "with_genres": genreId,
        },
      );
      if (resp == null) {
        return null;
      }
      return parseModel<List<Movie>>(
        () => (resp["results"] as List).map((e) => Movie.fromJson(e)).toList(),
      );
    } catch (e) {
      rethrow;
    }
  }
}
