import 'package:stacked/stacked_annotations.dart';
import 'package:ten_twenty_test/presentation/dashboard/modules/watch/modules/movie_detail/view/movie_detail_view.dart';
import 'package:ten_twenty_test/presentation/dashboard/modules/watch/modules/search_movies/view/search_movies_view.dart';
import 'package:ten_twenty_test/presentation/dashboard/modules/watch/modules/search_results/view/search_results_view.dart';
import 'package:ten_twenty_test/presentation/dashboard/modules/watch/modules/watch_trailer/view/watch_trailer_view.dart';
import 'package:ten_twenty_test/presentation/dashboard/modules/watch/view/watch_view.dart';
import 'package:ten_twenty_test/presentation/dashboard/view/dashboard_view.dart';

@StackedApp(routes: [
  //Dashboard
  MaterialRoute(page: DashboardView, initial: true, children: [
    MaterialRoute(page: WatchView, initial: true),
    MaterialRoute(page: SearchMoviesView),
    MaterialRoute(page: SearchResultsView),
  ]),
  MaterialRoute(page: MovieDetailView),
  MaterialRoute(page: WatchTrailerView),
])
class AppSetup {}
