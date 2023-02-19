// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'movie_details_bloc.dart';

class MovieDetailsState {
  final MovieDetails movie;
  final String statusMessage;
  final RequestState requestState;
  final List<MovieRecommendation> recommandedMovies;
  final String recommendatationStatusMessage;
  final RequestState recommendatationRequestState;

  const MovieDetailsState({
    this.recommandedMovies = const [],
    this.recommendatationStatusMessage = '',
    this.recommendatationRequestState = RequestState.loading,
    this.movie = const MovieDetails(
        backdropPath: '',
        genres: [Genres(name: '', id: 0)],
        id: 0,
        overview: '',
        title: '',
        releaseDate: '',
        runtime: 0,
        voteAverage: 0.0),
    this.statusMessage = '',
    this.requestState = RequestState.loading,
  });

  MovieDetailsState copyWith({
    MovieDetails? movie,
    String? statusMessage,
    RequestState? requestState,
    List<MovieRecommendation>? recommandedMovies,
    String? recommendatationStatusMessage,
    RequestState? recommendatationRequestState,
  }) {
    return MovieDetailsState(
      movie: movie ?? this.movie,
      statusMessage: statusMessage ?? this.statusMessage,
      requestState: requestState ?? this.requestState,
      recommandedMovies: recommandedMovies ?? this.recommandedMovies,
      recommendatationStatusMessage:
          recommendatationStatusMessage ?? this.recommendatationStatusMessage,
      recommendatationRequestState:
          recommendatationRequestState ?? this.recommendatationRequestState,
    );
  }
}
