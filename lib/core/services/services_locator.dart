import 'package:get_it/get_it.dart';
import 'package:movie_rev_clean_arch/movies/data/datasource/movie_remote_data_source.dart';
import 'package:movie_rev_clean_arch/movies/data/repository/movie_repository.dart';
import 'package:movie_rev_clean_arch/movies/domain/repository/base_movie_repository.dart';
import 'package:movie_rev_clean_arch/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:movie_rev_clean_arch/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:movie_rev_clean_arch/movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:movie_rev_clean_arch/movies/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:movie_rev_clean_arch/movies/domain/usecases/movies_recommandation_usecase.dart';
import 'package:movie_rev_clean_arch/movies/presentation/controller/movie_details_bloc.dart';
import 'package:movie_rev_clean_arch/movies/presentation/controller/movies_bloc.dart';

final getIt = GetIt.instance;

class ServicesLocator {
  init() {
    // bloc
    getIt.registerFactory(() => MoviesBloc(getIt(), getIt(), getIt()));
    getIt.registerFactory(() => MovieDetailsBloc(getIt(), getIt()));
    //use cases
    getIt.registerLazySingleton(() => GetNowPlayingMoviesUsecase(getIt()));
    getIt.registerLazySingleton(() => GetPopularMoviesUsecase(getIt()));
    getIt.registerLazySingleton(() => GetTopRatedMoviesUsecase(getIt()));
    getIt.registerLazySingleton(() => GetMovieDetailsUseCase(getIt()));
    getIt.registerLazySingleton(() => MovieRecommandationUsecase(getIt()));
    //reository
    getIt.registerLazySingleton<BaseMovieRepository>(
        () => MoviesRepository(getIt()));

    //data source
    getIt.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSource());
  }
}
