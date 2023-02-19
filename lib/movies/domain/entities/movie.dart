// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';

class Movie {
  final int id;
  final String title;
  final String backdropPath;
  final List<int> genderIds;
  final String overview;
  final double voteAverage;
  final String releaseDate;

  const Movie({
    required this.id,
    required this.releaseDate,
    required this.title,
    required this.backdropPath,
    required this.genderIds,
    required this.overview,
    required this.voteAverage,
  });

  @override
  bool operator ==(covariant Movie other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.backdropPath == backdropPath &&
        listEquals(other.genderIds, genderIds) &&
        other.overview == overview &&
        other.voteAverage == voteAverage &&
        other.releaseDate == releaseDate;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        backdropPath.hashCode ^
        genderIds.hashCode ^
        overview.hashCode ^
        voteAverage.hashCode ^
        releaseDate.hashCode;
  }
}
