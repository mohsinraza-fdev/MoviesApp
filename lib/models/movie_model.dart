import 'package:json_annotation/json_annotation.dart';
part 'movie_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Movie {
  final int id;
  final String title;
  final String? backdropPath;
  final String? posterath;
  final List<int> genreIds;

  Movie({
    required this.id,
    required this.title,
    this.backdropPath,
    this.posterath,
    required this.genreIds,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  Map<String, dynamic> toJson() => _$MovieToJson(this);
}
