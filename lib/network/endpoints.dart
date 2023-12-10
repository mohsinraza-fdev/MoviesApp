class Endpoints {
  static String get baseUrl => 'https://api.themoviedb.org';
  static String get storageBaseUrl => 'https://image.tmdb.org/t/p/w500';
  static String get fetchUpcommingMovies => '/3/movie/upcoming';
  static String fetchMovieDetail(int movieId) => '/3/movie/$movieId';
  static String fetchMovieTrailer(int movieId) => '/3/movie/$movieId/videos';
  static String get searchMovies => '/3/search/movie';
  static String get searchMoviesByGenre => '/3/discover/movie';
}
