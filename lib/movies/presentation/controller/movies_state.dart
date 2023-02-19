// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';

import 'package:movie_rev_clean_arch/core/utils/enums.dart';
import 'package:movie_rev_clean_arch/movies/domain/entities/movie.dart';

class MoviesState {
  final List<Movie> nowPlayingMovies;
  final RequestState nowPlayingState;
  final String nowPlayingMessage;
  final List<Movie> popularMovies;
  final RequestState popularState;
  final String popularMessage;
  final List<Movie> topRatedMovies;
  final RequestState topRatedMoviesState;
  final String topRatedMoviesMessage;

  const MoviesState({
    this.topRatedMovies = const [],
    this.topRatedMoviesState = RequestState.loading,
    this.topRatedMoviesMessage = '',
    this.popularMovies = const [],
    this.popularState = RequestState.loading,
    this.popularMessage = '',
    this.nowPlayingMovies = const [],
    this.nowPlayingState = RequestState.loading,
    this.nowPlayingMessage = '',
  });

  @override
  bool operator ==(covariant MoviesState other) {
    if (identical(this, other)) return true;

    return listEquals(other.nowPlayingMovies, nowPlayingMovies) &&
        other.nowPlayingState == nowPlayingState &&
        other.nowPlayingMessage == nowPlayingMessage &&
        listEquals(other.popularMovies, popularMovies) &&
        other.popularState == popularState &&
        other.popularMessage == popularMessage &&
        listEquals(other.topRatedMovies, topRatedMovies) &&
        other.topRatedMoviesState == topRatedMoviesState &&
        other.topRatedMoviesMessage == topRatedMoviesMessage;
  }

  @override
  int get hashCode {
    return nowPlayingMovies.hashCode ^
        nowPlayingState.hashCode ^
        nowPlayingMessage.hashCode ^
        popularMovies.hashCode ^
        popularState.hashCode ^
        popularMessage.hashCode ^
        topRatedMovies.hashCode ^
        topRatedMoviesState.hashCode ^
        topRatedMoviesMessage.hashCode;
  }

  MoviesState copyWith({
    List<Movie>? nowPlayingMovies,
    RequestState? nowPlayingState,
    String? nowPlayingMessage,
    List<Movie>? popularMovies,
    RequestState? popularState,
    String? popularMessage,
    List<Movie>? topRatedMovies,
    RequestState? topRatedMoviesState,
    String? topRatedMoviesMessage,
  }) {
    return MoviesState(
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      nowPlayingState: nowPlayingState ?? this.nowPlayingState,
      nowPlayingMessage: nowPlayingMessage ?? this.nowPlayingMessage,
      popularMovies: popularMovies ?? this.popularMovies,
      popularState: popularState ?? this.popularState,
      popularMessage: popularMessage ?? this.popularMessage,
      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
      topRatedMoviesState: topRatedMoviesState ?? this.topRatedMoviesState,
      topRatedMoviesMessage:
          topRatedMoviesMessage ?? this.topRatedMoviesMessage,
    );
  }
}
