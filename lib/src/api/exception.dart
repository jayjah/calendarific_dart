part of 'api.dart';

/// Exception class
class CalendarificApiException implements Exception {
  final String message;
  final int? code;
  final Response<dynamic>? response;
  const CalendarificApiException({
    this.message = "",
    this.code,
    this.response,
  });
  static const CalendarificApiException jsonParseError =
      CalendarificApiException(
    message: 'Unexpected json parse error!',
  );

  @override
  String toString() {
    return 'CalendarificApiException{message: $message, code: $code, response body: ${response?.bodyString}';
  }
}
