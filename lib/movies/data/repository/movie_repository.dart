import 'package:dartz/dartz.dart';
import 'package:movie_rev_clean_arch/core/error/exception.dart';
import 'package:movie_rev_clean_arch/core/error/fallure.dart';
import 'package:movie_rev_clean_arch/core/usecase/base_usecase.dart';
import 'package:movie_rev_clean_arch/movies/data/datasource/movie_remote_data_source.dart';
import 'package:movie_rev_clean_arch/movies/data/models/recomanded_movies_model.dart';
import 'package:movie_rev_clean_arch/movies/domain/entities/movie.dart';
import 'package:movie_rev_clean_arch/movies/domain/entities/movie_details.dart';
import 'package:movie_rev_clean_arch/movies/domain/repository/base_movie_repository.dart';
import 'package:movie_rev_clean_arch/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:movie_rev_clean_arch/movies/domain/usecases/movies_recommandation_usecase.dart';

class MoviesRepository extends BaseMovieRepository {
  final BaseMovieRemoteDataSource baseMovieRemoteDataSource;

  MoviesRepository(this.baseMovieRemoteDataSource);
  @override
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies() async {
    final result = await baseMovieRemoteDataSource.getNowPlayingMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    final result = await baseMovieRemoteDataSource.getNowPopularMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async {
    final result = await baseMovieRemoteDataSource.getTopRatedMoviesMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MovieDetails>> getMovieDetails(
      MovieDetailsUsecaseParameters parameters) async {
    final result = await baseMovieRemoteDataSource.getMovieDetails(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<RecomandedMoviesModel>>> getRecomandedMovies(
      MovieRecommendationUsecaseParameters parameters) async {
    final result =
        await baseMovieRemoteDataSource.getMovieRecommandation(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}
