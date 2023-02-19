// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class Failure {
  final String message;

  const Failure(this.message);

  @override
  bool operator ==(covariant Failure other) {
    if (identical(this, other)) return true;

    return other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}

class ServerFailure extends Failure {
  const ServerFailure(super.message);
}

class LocalDataBaseFailure extends Failure {
  LocalDataBaseFailure(super.message);
}
