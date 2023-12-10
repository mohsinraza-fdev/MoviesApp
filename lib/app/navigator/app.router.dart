// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i5;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i9;
import 'package:ten_twenty_test/presentation/dashboard/modules/watch/modules/movie_detail/view/movie_detail_view.dart'
    as _i3;
import 'package:ten_twenty_test/presentation/dashboard/modules/watch/modules/search_movies/view/search_movies_view.dart'
    as _i7;
import 'package:ten_twenty_test/presentation/dashboard/modules/watch/modules/search_results/view/search_results_view.dart'
    as _i8;
import 'package:ten_twenty_test/presentation/dashboard/modules/watch/modules/watch_trailer/view/watch_trailer_view.dart'
    as _i4;
import 'package:ten_twenty_test/presentation/dashboard/modules/watch/view/watch_view.dart'
    as _i6;
import 'package:ten_twenty_test/presentation/dashboard/view/dashboard_view.dart'
    as _i2;

class Routes {
  static const dashboardView = '/';

  static const movieDetailView = '/movie-detail-view';

  static const watchTrailerView = '/watch-trailer-view';

  static const all = <String>{
    dashboardView,
    movieDetailView,
    watchTrailerView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.dashboardView,
      page: _i2.DashboardView,
    ),
    _i1.RouteDef(
      Routes.movieDetailView,
      page: _i3.MovieDetailView,
    ),
    _i1.RouteDef(
      Routes.watchTrailerView,
      page: _i4.WatchTrailerView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.DashboardView: (data) {
      return _i5.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.DashboardView(),
        settings: data,
      );
    },
    _i3.MovieDetailView: (data) {
      final args = data.getArgs<MovieDetailViewArguments>(nullOk: false);
      return _i5.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i3.MovieDetailView(key: args.key, movieId: args.movieId),
        settings: data,
      );
    },
    _i4.WatchTrailerView: (data) {
      final args = data.getArgs<WatchTrailerViewArguments>(nullOk: false);
      return _i5.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i4.WatchTrailerView(key: args.key, linkCode: args.linkCode),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class MovieDetailViewArguments {
  const MovieDetailViewArguments({
    this.key,
    required this.movieId,
  });

  final _i5.Key? key;

  final int movieId;

  @override
  String toString() {
    return '{"key": "$key", "movieId": "$movieId"}';
  }

  @override
  bool operator ==(covariant MovieDetailViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.movieId == movieId;
  }

  @override
  int get hashCode {
    return key.hashCode ^ movieId.hashCode;
  }
}

class WatchTrailerViewArguments {
  const WatchTrailerViewArguments({
    this.key,
    required this.linkCode,
  });

  final _i5.Key? key;

  final String linkCode;

  @override
  String toString() {
    return '{"key": "$key", "linkCode": "$linkCode"}';
  }

  @override
  bool operator ==(covariant WatchTrailerViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.linkCode == linkCode;
  }

  @override
  int get hashCode {
    return key.hashCode ^ linkCode.hashCode;
  }
}

class DashboardViewRoutes {
  static const watchView = '';

  static const searchMoviesView = 'search-movies-view';

  static const searchResultsView = 'search-results-view';

  static const all = <String>{
    watchView,
    searchMoviesView,
    searchResultsView,
  };
}

class DashboardViewRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      DashboardViewRoutes.watchView,
      page: _i6.WatchView,
    ),
    _i1.RouteDef(
      DashboardViewRoutes.searchMoviesView,
      page: _i7.SearchMoviesView,
    ),
    _i1.RouteDef(
      DashboardViewRoutes.searchResultsView,
      page: _i8.SearchResultsView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i6.WatchView: (data) {
      return _i5.MaterialPageRoute<dynamic>(
        builder: (context) => const _i6.WatchView(),
        settings: data,
      );
    },
    _i7.SearchMoviesView: (data) {
      return _i5.MaterialPageRoute<dynamic>(
        builder: (context) => const _i7.SearchMoviesView(),
        settings: data,
      );
    },
    _i8.SearchResultsView: (data) {
      final args =
          data.getArgs<NestedSearchResultsViewArguments>(nullOk: false);
      return _i5.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i8.SearchResultsView(key: args.key, genreId: args.genreId),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class NestedSearchResultsViewArguments {
  const NestedSearchResultsViewArguments({
    this.key,
    required this.genreId,
  });

  final _i5.Key? key;

  final int genreId;

  @override
  String toString() {
    return '{"key": "$key", "genreId": "$genreId"}';
  }

  @override
  bool operator ==(covariant NestedSearchResultsViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.genreId == genreId;
  }

  @override
  int get hashCode {
    return key.hashCode ^ genreId.hashCode;
  }
}

extension NavigatorStateExtension on _i9.NavigationService {
  Future<dynamic> navigateToDashboardView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.dashboardView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToMovieDetailView({
    _i5.Key? key,
    required int movieId,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.movieDetailView,
        arguments: MovieDetailViewArguments(key: key, movieId: movieId),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToWatchTrailerView({
    _i5.Key? key,
    required String linkCode,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.watchTrailerView,
        arguments: WatchTrailerViewArguments(key: key, linkCode: linkCode),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToNestedWatchViewInDashboardViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(DashboardViewRoutes.watchView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToNestedSearchMoviesViewInDashboardViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(DashboardViewRoutes.searchMoviesView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToNestedSearchResultsViewInDashboardViewRouter({
    _i5.Key? key,
    required int genreId,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(DashboardViewRoutes.searchResultsView,
        arguments: NestedSearchResultsViewArguments(key: key, genreId: genreId),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithDashboardView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.dashboardView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithMovieDetailView({
    _i5.Key? key,
    required int movieId,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.movieDetailView,
        arguments: MovieDetailViewArguments(key: key, movieId: movieId),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithWatchTrailerView({
    _i5.Key? key,
    required String linkCode,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.watchTrailerView,
        arguments: WatchTrailerViewArguments(key: key, linkCode: linkCode),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithNestedWatchViewInDashboardViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(DashboardViewRoutes.watchView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithNestedSearchMoviesViewInDashboardViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(DashboardViewRoutes.searchMoviesView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithNestedSearchResultsViewInDashboardViewRouter({
    _i5.Key? key,
    required int genreId,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(DashboardViewRoutes.searchResultsView,
        arguments: NestedSearchResultsViewArguments(key: key, genreId: genreId),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
