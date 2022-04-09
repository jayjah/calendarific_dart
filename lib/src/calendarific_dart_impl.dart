// ignore_for_file: comment_references

import 'dart:convert';

import 'package:calendarific_dart/src/calendarific_dart_interface.dart';
import 'package:calendarific_dart/src/client/client.dart';
import 'package:calendarific_dart/src/models/models.dart';
import 'package:chopper/chopper.dart';

/// Basic implementation class for calendarific api of [CalendarificDartApi]
class CalendarificApi extends CalendarificDartApi {
  final String _apiKey;
  final CalendarificClient _client;
  CalendarificApi(this._apiKey)
      : _client = CalendarificClient.create(ChopperClient());

  /// Retrieve holidays by given [countryCode] and [year]. Those values
  ///   must be provided.
  ///   You may provide [day] and [month] as well, but then
  ///   both values must be provided!
  ///   [day] must be between 1 and 31.
  ///   [month] must be between 1 and 12.
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
  }) async {
    late final Response<dynamic> response;

    if (day != null && month != null) {
      assert(
        day >= 1 && day <= 31 && month >= 1 && month <= 12,
        'Day must be between 1 and 31. Month must be between 1 and 12!',
      );
      response = await _client.getSpecificHolidays(
        _apiKey,
        countryCode,
        year,
        day,
        month,
      );
    } else {
      response = await _client.getHolidays(
        _apiKey,
        countryCode,
        year,
      );
    }

    if (response.statusCode != 200) {
      throw getExceptionFromResponse(response.statusCode);
    }

    return Holiday.listFromJsonData(
      jsonDecode(
        response.bodyString,
      ),
    );
  }

  /// Retrieve holidays by given [countryCode], [year] and [month]. Those values
  ///   must be provided.
  ///   [month] must be between 1 and 12.
  ///
  /// It may throw a [CalendarificApiException] error on API error.
  ///
  /// It may return [Null] on unexpected parse error.
  @override
  Future<Iterable<Holiday>?> getHolidaysFromMonth({
    required String countryCode,
    required String year,
    required int month,
  }) async {
    assert(
      month >= 1 && month <= 12,
      'Month must be between 1 and 12!',
    );

    final Response<dynamic> response =
        await _client.getHolidaysFromMonth(_apiKey, countryCode, year, month);

    if (response.statusCode != 200) {
      throw getExceptionFromResponse(response.statusCode);
    }

    return Holiday.listFromJsonData(
      jsonDecode(
        response.bodyString,
      ),
    );
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
      throw getExceptionFromResponse(response.statusCode);
    }

    return Language.listFromJsonData(
      jsonDecode(
        response.bodyString,
      ),
    );
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
      throw getExceptionFromResponse(response.statusCode);
    }

    return Country.listFromJsonData(
      jsonDecode(
        response.bodyString,
      ),
    );
  }
}
