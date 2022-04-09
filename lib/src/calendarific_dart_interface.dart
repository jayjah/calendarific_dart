import 'package:calendarific_dart/src/models/models.dart';

/// Basic interface class for calendarific api
abstract class CalendarificDartApi {
  Future<Iterable<Holiday>?> getHolidays({
    required String countryCode,
    required String year,
    int? day,
    int? month,
  });
  Future<Iterable<Holiday>?> getHolidaysFromMonth({
    required String countryCode,
    required String year,
    required int month,
  });
  Future<Iterable<Language>?> getLanguages();
  Future<Iterable<Country>?> getCountries();

  Exception getExceptionFromResponse(int statusCode) {
    switch (statusCode) {
      case 401:
        return const CalendarificApiException(
          'Unauthorized Missing or incorrect API token in header',
          401,
        );
      case 422:
        return const CalendarificApiException(
          'Un-processable Entity meaning something with the message isn’t quite right, this could be malformed JSON or incorrect fields. In this case, the response body contains JSON with an API error code and message containing details on what went wrong',
          422,
        );
      case 500:
        return const CalendarificApiException(
          'Internal Server Error This is an issue with Calendarifics servers processing your request. In most cases the message is lost during the process, and we are notified so that we can investigate the issue',
          500,
        );
      case 503:
        return const CalendarificApiException(
          'Service Unavailable During planned service outages, Calendarific API services will return this HTTP response and associated JSON body',
          503,
        );
      case 429:
        return const CalendarificApiException(
          'Too many requests. API limits reached',
          429,
        );
      case 600:
        return const CalendarificApiException(
          'Maintenance The Calendarific API is offline for maintenance',
          600,
        );
      case 601:
        return const CalendarificApiException(
          'Unauthorized Missing or incorrect API token',
          601,
        );
      case 602:
        return const CalendarificApiException(
          'Invalid query parameters',
          602,
        );
      case 603:
        return const CalendarificApiException(
          'Authorized Subscription level required',
          603,
        );
      default:
        return CalendarificApiException('API Unknown error', statusCode);
    }
  }
}
