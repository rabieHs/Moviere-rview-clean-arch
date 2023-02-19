import 'package:dartz/dartz.dart';
import 'package:movie_rev_clean_arch/core/error/fallure.dart';

abstract class BaseUsecase<T, Parameters> {
  Future<Either<Failure, T>> call(Parameters parameters);
}

class NoParameters {
  NoParameters();
}
