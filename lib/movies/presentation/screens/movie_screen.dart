import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_rev_clean_arch/core/services/services_locator.dart';
import 'package:movie_rev_clean_arch/movies/presentation/controller/movies_bloc.dart';
import 'package:movie_rev_clean_arch/movies/presentation/controller/movies_event.dart';
import 'package:movie_rev_clean_arch/movies/presentation/controller/movies_state.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (BuildContext context) {
      return MoviesBloc(
        getIt(),
        getIt(),
        getIt(),
      )..add(getNowPlayingMoviesEvent());
    }, child: BlocBuilder<MoviesBloc, MoviesState>(
      builder: (context, state) {
        return Scaffold();
      },
    ));
  }
}
