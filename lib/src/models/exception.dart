part of 'models.dart';

/// Exception class
class CalendarificApiException implements Exception {
  final String message;
  final int? code;
  final Response<dynamic>? response;
  const CalendarificApiException([this.message = "", this.code, this.response]);

  @override
  String toString() {
    return 'CalendarificApiException{message: $message, code: $code, response: $response}';
  }
}
