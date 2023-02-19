// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:movie_rev_clean_arch/core/error/fallure.dart';
import 'package:movie_rev_clean_arch/core/usecase/base_usecase.dart';
import 'package:movie_rev_clean_arch/movies/data/models/recomanded_movies_model.dart';
import 'package:movie_rev_clean_arch/movies/domain/entities/recommendation.dart';
import 'package:movie_rev_clean_arch/movies/domain/repository/base_movie_repository.dart';

class MovieRecommandationUsecase extends BaseUsecase<List<MovieRecommendation>,
    MovieRecommendationUsecaseParameters> {
  final BaseMovieRepository baseMovieRepository;

  MovieRecommandationUsecase(this.baseMovieRepository);
  @override
  Future<Either<Failure, List<MovieRecommendation>>> call(
      MovieRecommendationUsecaseParameters parameters) async {
    return await baseMovieRepository.getRecomandedMovies(parameters);
  }
}

class MovieRecommendationUsecaseParameters {
  final int id;

  MovieRecommendationUsecaseParameters(this.id);

  @override
  bool operator ==(covariant MovieRecommendationUsecaseParameters other) {
    if (identical(this, other)) return true;

    return other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
