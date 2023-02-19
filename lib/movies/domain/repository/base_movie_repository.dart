import 'package:dartz/dartz.dart';
import 'package:movie_rev_clean_arch/movies/data/models/recomanded_movies_model.dart';
import 'package:movie_rev_clean_arch/movies/domain/entities/movie.dart';
import 'package:movie_rev_clean_arch/movies/domain/entities/movie_details.dart';
import 'package:movie_rev_clean_arch/movies/domain/entities/recommendation.dart';
import 'package:movie_rev_clean_arch/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:movie_rev_clean_arch/movies/domain/usecases/movies_recommandation_usecase.dart';

import '../../../core/error/fallure.dart';

abstract class BaseMovieRepository {
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies();
  Future<Either<Failure, List<Movie>>> getPopularMovies();
  Future<Either<Failure, List<Movie>>> getTopRatedMovies();
  Future<Either<Failure, MovieDetails>> getMovieDetails(
      MovieDetailsUsecaseParameters parameters);

  Future<Either<Failure, List<MovieRecommendation>>> getRecomandedMovies(
      MovieRecommendationUsecaseParameters parameters);
}
