// ignore_for_file: comment_references, curly_braces_in_flow_control_structures

part of 'api.dart';

/// Basic implementation class for calendarific api of [CalendarificDartApi]
class CalendarificApi extends CalendarificDartApi {
  final String _apiKey;
  final CalendarificClient _client;
  final bool enableLogging;
  CalendarificApi(
    this._apiKey, {
    this.enableLogging = true,
  })  : assert(_apiKey.trim().isNotEmpty, 'API Key can not be empty!'),
        _client = CalendarificClient.create(
          ChopperClient(
            interceptors: enableLogging
                ? <dynamic>[HttpLoggingInterceptor()]
                : const <dynamic>[],
          ),
        );

  /// Retrieve holidays by given [countryCode] and [year] and [option]. [option]
  ///   defines what kind of data should be asked.
  ///
  /// It may throw a [CalendarificApiException] error on API error.
  ///
  /// It may return [Null] on unexpected parse error.
  @override
  Future<Iterable<Holiday>?> getHolidays({
    required String countryCode,
    required String year,
    required RequestOption option,
  }) async {
    assert(countryCode.isNotEmpty, 'Provided countryCode can not be empty!');
    assert(year.isNotEmpty, 'Provided year can not be empty!');
    assert(year.length == 4,
        'Provided year must be in the format of XXXX, e.G. 2022!');

    final Response<dynamic> response = await option.run(
      _apiKey,
      countryCode,
      year,
      _client,
    );

    if (response.statusCode != 200) {
      throw _exceptionFromResponse(response);
    }

    return Holiday.listFromJsonData(response.bodyString.asDecodedJson);
  }

  /// Retrieve all languages which are supported by Calendarific.
  ///
  /// It may throw a [CalendarificApiException] error on API error.
  ///
  /// It may return [Null] on unexpected parse error.
  @override
  Future<Iterable<Language>?> getLanguages() async {
    final Response<dynamic> response = await _client.getLanguages(_apiKey);
    if (response.statusCode != 200) {
      throw _exceptionFromResponse(response);
    }

    return Language.listFromJsonData(response.bodyString.asDecodedJson);
  }

  /// Retrieve all countries which are supported by Calendarific.
  ///
  /// It may throw a [CalendarificApiException] error on API error.
  ///
  /// It may return [Null] on unexpected parse error.
  @override
  Future<Iterable<Country>?> getCountries() async {
    final Response<dynamic> response = await _client.getCountries(_apiKey);
    if (response.statusCode != 200) {
      throw _exceptionFromResponse(response);
    }

    return Country.listFromJsonData(response.bodyString.asDecodedJson);
  }
}
