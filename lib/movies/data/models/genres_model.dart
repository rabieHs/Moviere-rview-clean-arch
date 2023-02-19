import 'package:movie_rev_clean_arch/movies/domain/entities/genres.dart';

class GenresModel extends Genres {
  GenresModel({required super.name, required super.id});

  factory GenresModel.fromJson(Map<String, dynamic> json) => GenresModel(
        name: json['name'],
        id: json['id'],
      );
}
