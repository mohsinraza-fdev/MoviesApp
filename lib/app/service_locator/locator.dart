import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:ten_twenty_test/network/api_client/api_client.dart';
import 'package:ten_twenty_test/presentation/dashboard/modules/watch/view_model/watch_view_model.dart';
import 'package:ten_twenty_test/repositories/movies/movies_repo.dart';
import 'package:ten_twenty_test/repositories/movies/use_cases/fetch_upcomming_movies_use_case.dart';
import 'package:ten_twenty_test/services/preference_service.dart';

final locator = StackedLocator.instance;

Future<void> setupLocator() async {
  locator.registerLazySingleton(
    () => NavigationService(),
  );

  final sharedPreferenceInstance = await SharedPreferences.getInstance();
  locator.registerLazySingleton(
    () => PreferenceService(sharedPreferenceInstance),
  );

  final dioInstance = Dio();
  locator.registerLazySingleton(
    () => ApiClient(dioInstance),
  );

  //Repositories
  locator.registerLazySingleton(() => MoviesRepo());

  //View Models
  final fetchUpcommingMoviesUseCase = FetchUpcommingMoviesUseCase();
  locator.registerLazySingleton(
    () => WatchViewModel(
      fetchUpcommingMoviesUseCase: fetchUpcommingMoviesUseCase,
    ),
  );
}

void reInitialiseLocator() {}
