// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';

import 'package:movie_rev_clean_arch/movies/domain/entities/genres.dart';

class MovieDetails {
  final String backdropPath;
  final int id;
  final List<Genres> genres;
  final String overview;
  final String title;
  final String releaseDate;
  final int runtime;
  final double voteAverage;

  const MovieDetails(
      {required this.backdropPath,
      required this.genres,
      required this.id,
      required this.overview,
      required this.title,
      required this.releaseDate,
      required this.runtime,
      required this.voteAverage});

  @override
  bool operator ==(covariant MovieDetails other) {
    if (identical(this, other)) return true;

    return other.backdropPath == backdropPath &&
        other.id == id &&
        listEquals(other.genres, genres) &&
        other.overview == overview &&
        other.title == title &&
        other.releaseDate == releaseDate &&
        other.runtime == runtime &&
        other.voteAverage == voteAverage;
  }

  @override
  int get hashCode {
    return backdropPath.hashCode ^
        id.hashCode ^
        genres.hashCode ^
        overview.hashCode ^
        title.hashCode ^
        releaseDate.hashCode ^
        runtime.hashCode ^
        voteAverage.hashCode;
  }
}
