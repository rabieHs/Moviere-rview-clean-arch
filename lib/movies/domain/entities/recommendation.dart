// ignore_for_file: public_member_api_docs, sort_constructors_first
class MovieRecommendation {
  final String? backdropPath;
  final int id;

  const MovieRecommendation({this.backdropPath, required this.id});

  @override
  bool operator ==(covariant MovieRecommendation other) {
    if (identical(this, other)) return true;

    return other.backdropPath == backdropPath && other.id == id;
  }

  @override
  int get hashCode => backdropPath.hashCode ^ id.hashCode;
}
