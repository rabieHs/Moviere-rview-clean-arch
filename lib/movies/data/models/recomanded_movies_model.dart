import 'dart:convert';

import 'package:movie_rev_clean_arch/movies/domain/entities/recommendation.dart';

class RecomandedMoviesModel extends MovieRecommendation {
  RecomandedMoviesModel({super.backdropPath, required super.id});

  factory RecomandedMoviesModel.fromJson(Map<String, dynamic> json) =>
      RecomandedMoviesModel(
          backdropPath:
              json['backdrop_path'] ?? '/nmGWzTLMXy9x7mKd8NKPLmHtWGa.jpg',
          id: json['id']);
}
