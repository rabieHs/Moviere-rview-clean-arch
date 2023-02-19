import 'package:movie_rev_clean_arch/movies/data/models/genres_model.dart';
import 'package:movie_rev_clean_arch/movies/domain/entities/genres.dart';
import 'package:movie_rev_clean_arch/movies/domain/entities/movie_details.dart';

class MovieDetailsModel extends MovieDetails {
  MovieDetailsModel(
      {required super.backdropPath,
      required super.genres,
      required super.id,
      required super.overview,
      required super.title,
      required super.releaseDate,
      required super.runtime,
      required super.voteAverage});

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) =>
      MovieDetailsModel(
        backdropPath: json['backdrop_path'],
        genres: List<GenresModel>.from(
            json['genres'].map((e) => GenresModel.fromJson(e))),
        id: json['id'],
        overview: json['overview'],
        title: json['title'],
        releaseDate: json['release_date'],
        runtime: json['runtime'],
        voteAverage: json['vote_average'].toDouble(),
      );
}
