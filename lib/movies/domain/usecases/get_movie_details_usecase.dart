// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:movie_rev_clean_arch/core/error/fallure.dart';
import 'package:movie_rev_clean_arch/core/usecase/base_usecase.dart';
import 'package:movie_rev_clean_arch/movies/domain/entities/movie_details.dart';
import 'package:movie_rev_clean_arch/movies/domain/repository/base_movie_repository.dart';

class GetMovieDetailsUseCase
    extends BaseUsecase<MovieDetails, MovieDetailsUsecaseParameters> {
  final BaseMovieRepository repository;

  GetMovieDetailsUseCase(this.repository);
  @override
  Future<Either<Failure, MovieDetails>> call(
      MovieDetailsUsecaseParameters parameters) async {
    return await repository.getMovieDetails(parameters);
  }
}

class MovieDetailsUsecaseParameters {
  final int movieId;

  MovieDetailsUsecaseParameters({required this.movieId});

  @override
  bool operator ==(covariant MovieDetailsUsecaseParameters other) {
    if (identical(this, other)) return true;

    return other.movieId == movieId;
  }

  @override
  int get hashCode => movieId.hashCode;
}
