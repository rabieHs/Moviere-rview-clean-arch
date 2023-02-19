import 'package:dartz/dartz.dart';

import '../../../core/error/fallure.dart';
import '../../../core/usecase/base_usecase.dart';
import '../entities/movie.dart';
import '../repository/base_movie_repository.dart';

class GetTopRatedMoviesUsecase extends BaseUsecase<List<Movie>, NoParameters> {
  final BaseMovieRepository repository;

  GetTopRatedMoviesUsecase(this.repository);

  @override
  Future<Either<Failure, List<Movie>>> call(NoParameters parameters) async {
    return await repository.getTopRatedMovies();
  }
}
