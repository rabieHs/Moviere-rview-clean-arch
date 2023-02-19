abstract class MoviesEvent {
  const MoviesEvent();
}

class getNowPlayingMoviesEvent extends MoviesEvent {}

class getNowPopularMoviesEvent extends MoviesEvent {}

class getNowTopRatedMoviesEvent extends MoviesEvent {}
