class ApiConstances {
  static const String baseUrl = "https://api.themoviedb.org/3";
  static const String apiKey = "09eca30aedd25870ec3dfd2a9396dced";
  static const String baseImageUrl = "https://image.tmdb.org/t/p/w500";
  static const String nowPlayingPath =
      "$baseUrl/movie/now_playing?api_key=$apiKey";

  static const String popularMoviesPath =
      "$baseUrl/movie/popular?api_key=$apiKey";

  static const String topRatedMoviesPath =
      "$baseUrl/movie/top_rated?api_key=$apiKey";
  static String MovieDetailsPath(int id) =>
      "$baseUrl/movie/$id?api_key=$apiKey";
  static String MovieRecommandationPath(int id) =>
      "$baseUrl/movie/$id/recommendations?api_key=$apiKey";

  static imageUrl(String path) => "$baseImageUrl$path";
}
