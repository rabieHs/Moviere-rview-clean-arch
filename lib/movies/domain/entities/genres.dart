// ignore_for_file: public_member_api_docs, sort_constructors_first
class Genres {
  final String name;
  final int id;
  const Genres({
    required this.name,
    required this.id,
  });

  @override
  bool operator ==(covariant Genres other) {
    if (identical(this, other)) return true;

    return other.name == name && other.id == id;
  }

  @override
  int get hashCode => name.hashCode ^ id.hashCode;
}
