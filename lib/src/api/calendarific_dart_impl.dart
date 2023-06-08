// ignore_for_file: comment_references, curly_braces_in_flow_control_structures

part of 'api.dart';

/// Basic implementation class for calendarific api of [CalendarificDartApi]
class CalendarificApi extends CalendarificDartApi {
  final String _apiKey;
  final CalendarificClient _client;
  CalendarificApi(
    this._apiKey, {
    final bool enableLogging = true,
    final CalendarificClient? client,
  })  : assert(_apiKey.trim().isNotEmpty, 'API Key can not be empty!'),
        _client = client ??
            CalendarificClient.create(
              ChopperClient(
                interceptors: enableLogging
                    ? <dynamic>[HttpLoggingInterceptor()]
                    : const <dynamic>[],
              ),
            );

  /// Retrieve holidays by given [countryCode] and [year] and [option]. [option]
  ///   defines what kind of data should be asked.
  @override
  Future<(Iterable<Holiday>, Exception?)> getHolidays({
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

    return response.statusCode != 200
        ? (const <Holiday>[], _exceptionFromResponse(response))
        : Holiday.listFromJson(response.bodyString.asDecodedJson);
  }

  /// Retrieve all languages which are supported by Calendarific.
  @override
  Future<(Iterable<Language>, Exception?)> getLanguages() async {
    final Response<dynamic> response = await _client.getLanguages(_apiKey);

    return response.statusCode != 200
        ? (const <Language>[], _exceptionFromResponse(response))
        : Language.listFromJson(response.bodyString.asDecodedJson);
  }

  /// Retrieve all countries which are supported by Calendarific.
  @override
  Future<(Iterable<Country>, Exception?)> getCountries() async {
    final Response<dynamic> response = await _client.getCountries(_apiKey);

    return response.statusCode != 200
        ? (const <Country>[], _exceptionFromResponse(response))
        : Country.listFromJson(response.bodyString.asDecodedJson);
  }
}
