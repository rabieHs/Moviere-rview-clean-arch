// ignore_for_file: public_member_api_docs, sort_constructors_first
class ErrorMessageModel {
  final bool success;
  final int statusCode;
  final String statusMessage;

  const ErrorMessageModel(
      {required this.success,
      required this.statusCode,
      required this.statusMessage});

  factory ErrorMessageModel.fromJson(Map<String, dynamic> json) =>
      ErrorMessageModel(
          success: json['sucess'],
          statusCode: json['status_code'],
          statusMessage: json['status_message']);

  @override
  bool operator ==(covariant ErrorMessageModel other) {
    if (identical(this, other)) return true;

    return other.success == success &&
        other.statusCode == statusCode &&
        other.statusMessage == statusMessage;
  }

  @override
  int get hashCode =>
      success.hashCode ^ statusCode.hashCode ^ statusMessage.hashCode;
}
