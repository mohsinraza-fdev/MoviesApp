import 'package:flutter/material.dart';
import 'package:ten_twenty_test/app/core/core_views/core_view.dart';
import 'package:ten_twenty_test/presentation/dashboard/modules/watch/modules/movie_detail/view_model/movie_detail_view_model.dart';
import 'package:ten_twenty_test/presentation/dashboard/modules/watch/modules/movie_detail/widgets/landscape_movie_detail_body.dart';
import 'package:ten_twenty_test/presentation/dashboard/modules/watch/modules/movie_detail/widgets/potrait_movie_detail_body.dart';
import 'package:ten_twenty_test/repositories/movies/use_cases/fetch_movie_detail_use_case.dart';
import 'package:ten_twenty_test/repositories/movies/use_cases/fetch_movie_trailer_use_case.dart';
import 'package:ten_twenty_test/shared/enums/app_device_orientation_enum.dart';
import 'package:ten_twenty_test/widgets/builders/app_responsive_builder.dart';

class MovieDetailView extends CoreView<MovieDetailViewModel> {
  final int movieId;
  const MovieDetailView({
    super.key,
    required this.movieId,
  });

  @override
  Widget builder(
      BuildContext context, MovieDetailViewModel viewModel, Widget? child) {
    return AppResponsiveBuilder(
        builder: (context, deviceType, deviceOrientation) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: deviceOrientation == AppDeviceOrientation.landscape
            ? LandscapeMovieDetailBody(chipColor: _colorFromIndex)
            : PotraitMovieDetailBody(chipColor: _colorFromIndex),
      );
    });
  }

  Color _colorFromIndex(int index) {
    List<Color> colorList = [
      const Color(0xFF15D2BC),
      const Color(0xFFE26CA5),
      const Color(0xFF564CA3),
      const Color(0xFFCD9D0F),
      const Color(0xFF2E86C1),
      const Color(0xFFCB4335),
    ];
    return colorList[(index) % 6];
  }

  @override
  MovieDetailViewModel viewModelBuilder(BuildContext context) {
    return MovieDetailViewModel(
      movieId: movieId,
      fetchMovieDetailUseCase: FetchMovieDetailUseCase(),
      fetchMovieTrailerUseCase: FetchMovieTrailerUseCase(),
    );
  }
}
