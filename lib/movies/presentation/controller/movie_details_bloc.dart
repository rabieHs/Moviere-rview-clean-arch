import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:movie_rev_clean_arch/core/utils/enums.dart';
import 'package:movie_rev_clean_arch/movies/data/models/recomanded_movies_model.dart';
import 'package:movie_rev_clean_arch/movies/domain/entities/genres.dart';
import 'package:movie_rev_clean_arch/movies/domain/entities/movie_details.dart';
import 'package:movie_rev_clean_arch/movies/domain/entities/recommendation.dart';
import 'package:movie_rev_clean_arch/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:movie_rev_clean_arch/movies/domain/usecases/movies_recommandation_usecase.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final MovieRecommandationUsecase movieRecommandationUsecase;
  MovieDetailsBloc(
    this.getMovieDetailsUseCase,
    this.movieRecommandationUsecase,
  ) : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetailsEvent);
    on<GetMovieRecommendation>(_getMovieRecommendation);
  }

  FutureOr<void> _getMovieDetailsEvent(
      GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    final result = await getMovieDetailsUseCase(
        MovieDetailsUsecaseParameters(movieId: event.id));
    result.fold(
        (l) => emit(state.copyWith(
            requestState: RequestState.error, statusMessage: l.message)),
        (r) =>
            emit(state.copyWith(movie: r, requestState: RequestState.loaded)));
  }

  FutureOr<void> _getMovieRecommendation(
      GetMovieRecommendation event, Emitter<MovieDetailsState> emit) async {
    final result = await movieRecommandationUsecase(
        MovieRecommendationUsecaseParameters(event.id));
    result.fold(
        (l) => emit(state.copyWith(
            recommendatationRequestState: RequestState.error,
            recommendatationStatusMessage: l.message)),
        (r) => emit(state.copyWith(
            recommandedMovies: r,
            recommendatationRequestState: RequestState.loaded)));
  }
}
