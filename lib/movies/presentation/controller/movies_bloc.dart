import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_rev_clean_arch/core/usecase/base_usecase.dart';
import 'package:movie_rev_clean_arch/core/utils/enums.dart';
import 'package:movie_rev_clean_arch/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:movie_rev_clean_arch/movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:movie_rev_clean_arch/movies/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:movie_rev_clean_arch/movies/presentation/controller/movies_event.dart';
import 'package:movie_rev_clean_arch/movies/presentation/controller/movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUsecase getNowPlayingMoviesUsecase;
  final GetPopularMoviesUsecase getPopularMoviesUsecase;
  final GetTopRatedMoviesUsecase getTopRatedMoviesUsecase;
  MoviesBloc(this.getNowPlayingMoviesUsecase, this.getPopularMoviesUsecase,
      this.getTopRatedMoviesUsecase)
      : super(const MoviesState()) {
    on<getNowPlayingMoviesEvent>(_getNowPlayingMovies);

    on<getNowPopularMoviesEvent>(_getPopularMovies);
    on<getNowTopRatedMoviesEvent>(_getTopRatedMovies);
  }

  FutureOr<void> _getNowPlayingMovies(
      getNowPlayingMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getNowPlayingMoviesUsecase(NoParameters());
    emit(const MoviesState(nowPlayingState: RequestState.loaded));

    result.fold(
        (l) => emit(
            //MoviesState(
            //nowPlayingState: RequestState.error,
            //nowPlayingMessage: l.message)
            state.copyWith(
                nowPlayingMessage: l.message,
                nowPlayingState: RequestState.error)),
        (r) => emit(state.copyWith(
            nowPlayingMovies: r, nowPlayingState: RequestState.loaded)));
  }

  FutureOr<void> _getPopularMovies(
      getNowPopularMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getPopularMoviesUsecase(NoParameters());

    result.fold(
        (l) => emit(state.copyWith(
            popularMessage: l.message, popularState: RequestState.error)),
        (r) => emit(state.copyWith(
            popularMovies: r, popularState: RequestState.loaded)));
  }

  FutureOr<void> _getTopRatedMovies(
      getNowTopRatedMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getTopRatedMoviesUsecase(NoParameters());

    result.fold(
        (l) => emit(state.copyWith(
            topRatedMoviesMessage: l.message,
            topRatedMoviesState: RequestState.error)),
        (r) => emit(state.copyWith(
            topRatedMovies: r, topRatedMoviesState: RequestState.loaded)));
  }
}
