import 'package:dio/dio.dart';
import 'package:movie_rev_clean_arch/core/error/exception.dart';
import 'package:movie_rev_clean_arch/core/network/error_message_model.dart';
import 'package:movie_rev_clean_arch/core/usecase/base_usecase.dart';
import 'package:movie_rev_clean_arch/core/utils/app_constances.dart';
import 'package:movie_rev_clean_arch/movies/data/models/movie_details_model.dart';
import 'package:movie_rev_clean_arch/movies/data/models/movie_model.dart';
import 'package:movie_rev_clean_arch/movies/data/models/recomanded_movies_model.dart';
import 'package:movie_rev_clean_arch/movies/domain/entities/movie.dart';
import 'package:movie_rev_clean_arch/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:movie_rev_clean_arch/movies/domain/usecases/movies_recommandation_usecase.dart';

import '../../../core/network/api_constances.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getNowPopularMovies();
  Future<List<MovieModel>> getTopRatedMoviesMovies();
  Future<MovieDetailsModel> getMovieDetails(
      MovieDetailsUsecaseParameters parameters);

  Future<List<RecomandedMoviesModel>> getMovieRecommandation(
      MovieRecommendationUsecaseParameters parameters);
}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource {
  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    var response = await Dio().get(ApiConstances.nowPlayingPath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getNowPopularMovies() async {
    var response = await Dio().get(ApiConstances.popularMoviesPath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(errorMessageModel: response.data);
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMoviesMovies() async {
    var response = await Dio().get(ApiConstances.topRatedMoviesPath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(errorMessageModel: response.data);
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(
      MovieDetailsUsecaseParameters parameters) async {
    var response =
        await Dio().get(ApiConstances.MovieDetailsPath(parameters.movieId));
    if (response.statusCode == 200) {
      return MovieDetailsModel.fromJson(response.data);
    } else {
      throw ServerException(errorMessageModel: response.data);
    }
  }

  @override
  Future<List<RecomandedMoviesModel>> getMovieRecommandation(
      MovieRecommendationUsecaseParameters parameters) async {
    var response =
        await Dio().get(ApiConstances.MovieRecommandationPath(parameters.id));
    if (response.statusCode == 200) {
      return List<RecomandedMoviesModel>.from((response.data['results'] as List)
          .map((e) => RecomandedMoviesModel.fromJson(e)));
    } else {
      throw ServerException(errorMessageModel: response.data);
    }
  }
}
