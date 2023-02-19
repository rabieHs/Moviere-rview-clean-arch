import 'package:flutter/material.dart';
import 'package:movie_rev_clean_arch/core/services/services_locator.dart';
import 'package:movie_rev_clean_arch/movies/presentation/screens/movies_screen.dart';

void main() {
  ServicesLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies App',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.grey.shade900),
      home: const MainMoviesScreen(),
    );
  }
}
