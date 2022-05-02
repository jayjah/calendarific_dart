// ignore_for_file: comment_references, curly_braces_in_flow_control_structures

import 'package:calendarific_dart/src/calendarific_dart_interface.dart';
import 'package:calendarific_dart/src/client/client.dart';
import 'package:calendarific_dart/src/models/models.dart';
import 'package:chopper/chopper.dart';

/// Basic implementation class for calendarific api of [CalendarificDartApi]
class CalendarificApi extends CalendarificDartApi {
  final String _apiKey;
  final CalendarificClient _client;
  CalendarificApi(this._apiKey)
      : assert(_apiKey.isNotEmpty, 'API Key can not be empty!'),
        _client = CalendarificClient.create(ChopperClient());

  /// Retrieve holidays by given [countryCode] and [year]. Those values
  ///   must be provided.
  ///   You may provide [day] and [month] as well, but then
  ///   both values must be provided!
  ///   [day] must be between 1 and 31.
  ///   [month] must be between 1 and 12.
  ///   [location] must be ISO 3166-2 format
  ///
  /// It may throw a [CalendarificApiException] error on API error.
  ///
  /// It may return [Null] on unexpected parse error.
  @override
  Future<Iterable<Holiday>?> getHolidays({
    required String countryCode,
    required String year,
    int? day,
    int? month,
    String? location,
  }) async {
    assert(countryCode.isNotEmpty, 'Provided countryCode can not be empty!');
    assert(year.isNotEmpty, 'Provided year can not be empty!');

    late final Response<dynamic> response;

    if (day != null && month != null) {
      assert(
        day >= 1 && day <= 31 && month >= 1 && month <= 12,
        'Day must be between 1 and 31. Month must be between 1 and 12!',
      );
      if (location != null) {
        assert(location.isNotEmpty,
            'Provided location value was provided, but is empty!');
        assert(location.contains('-'),
            'Provided location value is not a valid 3166-2 format!');

        response = await _client.getSpecificHolidaysByLocation(
          _apiKey,
          countryCode,
          year,
          day,
          month,
          location,
        );
      } else
        response = await _client.getSpecificHolidays(
          _apiKey,
          countryCode,
          year,
          day,
          month,
        );
    } else {
      if (location != null) {
        assert(location.isNotEmpty,
            'Provided location value was provided, but is empty!');
        assert(location.contains('-'),
            'Provided location value is not a valid 3166-2 format!');

        response = await _client.getHolidaysByLocation(
          _apiKey,
          countryCode,
          year,
          location,
        );
      } else
        response = await _client.getHolidays(
          _apiKey,
          countryCode,
          year,
        );
    }

    if (response.statusCode != 200) {
      throw getExceptionFromResponse(response);
    }

    return Holiday.listFromJsonData(response.bodyString.asDecodedJson);
  }

  /// Retrieve holidays by given [countryCode], [year] and [month]. Those values
  ///   must be provided.
  ///   [month] must be between 1 and 12.
  ///   [location] must be ISO 3166-2 format
  ///
  /// It may throw a [CalendarificApiException] error on API error.
  ///
  /// It may return [Null] on unexpected parse error.
  @override
  Future<Iterable<Holiday>?> getHolidaysFromMonth({
    required String countryCode,
    required String year,
    required int month,
    String? location,
  }) async {
    assert(countryCode.isNotEmpty, 'Provided countryCode can not be empty!');
    assert(year.isNotEmpty, 'Provided year can not be empty!');
    assert(
      month >= 1 && month <= 12,
      'Month must be between 1 and 12!',
    );

    late final Response<dynamic> response;
    if (location != null) {
      assert(location.isNotEmpty,
          'Provided location value was provided, but is empty!');
      assert(location.contains('-'),
          'Provided location value is not a valid 3166-2 format!');

      response = await _client.getHolidaysFromMonthByLocation(
        _apiKey,
        countryCode,
        year,
        month,
        location,
      );
    } else
      response = await _client.getHolidaysFromMonth(
        _apiKey,
        countryCode,
        year,
        month,
      );

    if (response.statusCode != 200) {
      throw getExceptionFromResponse(response);
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
      throw getExceptionFromResponse(response);
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
      throw getExceptionFromResponse(response);
    }

    return Country.listFromJsonData(response.bodyString.asDecodedJson);
  }
}
