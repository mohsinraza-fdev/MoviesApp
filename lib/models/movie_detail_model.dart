import 'package:json_annotation/json_annotation.dart';
import 'package:ten_twenty_test/models/genre_model.dart';
part 'movie_detail_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class MovieDetail {
  final int id;
  final String title;
  final String overview;
  final String? backdropPath;
  final String? posterPath;
  final DateTime releaseDate;
  final List<Genre> genres;

  MovieDetail({
    required this.id,
    required this.title,
    required this.overview,
    this.backdropPath,
    this.posterPath,
    required this.releaseDate,
    required this.genres,
  });

  factory MovieDetail.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDetailToJson(this);
}
