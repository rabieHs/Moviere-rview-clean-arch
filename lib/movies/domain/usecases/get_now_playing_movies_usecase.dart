import 'package:dartz/dartz.dart';
import 'package:movie_rev_clean_arch/core/usecase/base_usecase.dart';
import 'package:movie_rev_clean_arch/movies/domain/entities/movie.dart';
import 'package:movie_rev_clean_arch/movies/domain/repository/base_movie_repository.dart';

import '../../../core/error/fallure.dart';

class GetNowPlayingMoviesUsecase
    extends BaseUsecase<List<Movie>, NoParameters> {
  final BaseMovieRepository repository;

  GetNowPlayingMoviesUsecase(this.repository);

  @override
  Future<Either<Failure, List<Movie>>> call(NoParameters parameters) async {
    return await repository.getNowPlayingMovies();
  }
}
