import 'package:movie_rev_clean_arch/movies/domain/entities/movie.dart';

class MovieModel extends Movie {
  const MovieModel(
      {required super.id,
      required super.releaseDate,
      required super.title,
      required super.backdropPath,
      required super.genderIds,
      required super.overview,
      required super.voteAverage});

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        id: json['id'],
        releaseDate: json['release_date'],
        title: json['title'],
        backdropPath: json["backdrop_path"],
        genderIds: List<int>.from(json['genre_ids'].map((e) => e)),
        overview: json['overview'],

        /// TODO : CHECK THIS
        voteAverage: json['vote_average'].toDouble(),
      );
}
