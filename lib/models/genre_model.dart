import 'package:json_annotation/json_annotation.dart';
part 'genre_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Genre {
  final int id;
  final String? name;

  Genre({
    required this.id,
    this.name,
  });

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);

  Map<String, dynamic> toJson() => _$GenreToJson(this);

  Map<int, dynamic> get baseGenres => {
        28: "Action",
        12: "Adventure",
        16: "Animation",
        35: "Comedy",
        80: "Crime",
        99: "Documentary",
        18: "Drama",
        10751: "Family",
        14: "Fantasy",
        36: "History",
        27: "Horror",
        10402: "Music",
        9648: "Mystery",
        10749: "Romance",
        878: "Science Fiction",
        10770: "TV Movie",
        53: "Thriller",
        10752: "War",
        37: "Western"
      };

  @override
  String toString() {
    return name ?? baseGenres[id] ?? '<Unknown>';
  }
}
