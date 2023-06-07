part of 'api.dart';

/// Basic extension on String to reduce code duplication
extension _JsonDecoder on String {
  dynamic get asDecodedJson => jsonDecode(this);
}

/// Basic interface class for calendarific api
abstract class CalendarificDartApi {
  Future<(Iterable<Holiday>, Exception?)> getHolidays({
    required String countryCode,
    required String year,
    required RequestOption option,
  });
  Future<(Iterable<Language>, Exception?)> getLanguages();
  Future<(Iterable<Country>, Exception?)> getCountries();

  Exception _exceptionFromResponse(Response<dynamic> response) {
    switch (response.statusCode) {
      case 401:
        return const CalendarificApiException(
          message: 'Unauthorized Missing or incorrect API token in header',
          code: 401,
        );
      case 422:
        return const CalendarificApiException(
          message:
              'Un-processable Entity meaning something with the message isn’t quite right, this could be malformed JSON or incorrect fields. In this case, the response body contains JSON with an API error code and message containing details on what went wrong',
          code: 422,
        );
      case 500:
        return const CalendarificApiException(
          message:
              'Internal Server Error This is an issue with Calendarifics servers processing your request. In most cases the message is lost during the process, and we are notified so that we can investigate the issue',
          code: 500,
        );
      case 503:
        return const CalendarificApiException(
          message:
              'Service Unavailable During planned service outages, Calendarific API services will return this HTTP response and associated JSON body',
          code: 503,
        );
      case 429:
        return const CalendarificApiException(
          message: 'Too many requests. API limit reached',
          code: 429,
        );
      case 426:
        return const CalendarificApiException(
          message: 'Too many requests. API limit reached',
          code: 426,
        );
      case 600:
        return const CalendarificApiException(
          message:
              'Maintenance The Calendarific API is offline for maintenance',
          code: 600,
        );
      case 601:
        return const CalendarificApiException(
          message: 'Unauthorized Missing or incorrect API token',
          code: 601,
        );
      case 602:
        return const CalendarificApiException(
          message: 'Invalid query parameters',
          code: 602,
        );
      case 603:
        return const CalendarificApiException(
          message: 'Authorized Subscription level required',
          code: 603,
        );
      default:
        return CalendarificApiException(
          message: 'API Unknown error',
          code: response.statusCode,
          response: response,
        );
    }
  }
}
