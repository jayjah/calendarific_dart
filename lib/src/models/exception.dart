part of 'models.dart';

/// Exception class
class CalendarificApiException implements Exception {
  final String message;
  final int? code;
  final dynamic response;
  const CalendarificApiException([this.message = "", this.code, this.response]);
}
