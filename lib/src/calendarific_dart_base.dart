// ignore_for_file: comment_references

import 'dart:convert';

import 'package:calendarific_dart/src/calendarific_client.dart';
import 'package:calendarific_dart/src/calendarific_dart_interface.dart';
import 'package:calendarific_dart/src/models/models.dart';

import 'package:chopper/chopper.dart';

/// Basic implementation class for calendarific api of [CalendarificDartApi]
class CalendarificApi extends CalendarificDartApi {
  final String _apiKey;
  final CalendarificClient client;
  CalendarificApi(this._apiKey)
      : client = CalendarificClient.create(ChopperClient());

  /// Retrieve holidays by given [countryCode] and [year]. Those values
  ///   must be provided.
  ///
  /// It may throw a [CalendarificApiException] error on API error.
  ///
  /// It may return [Null] on unexpected parse error.
  @override
  Future<List<Holiday>?> getHolidays(
      {required String countryCode, required String year}) async {
    final Response<dynamic> response =
        await client.getHolidays(_apiKey, countryCode, year);
    if (response.statusCode != 200) {
      throw getExceptionFromResponse(response.statusCode);
    }

    return Holiday.listFromJsonData(
      jsonDecode(
        response.body.toString(),
      ),
    );
  }

  /// Retrieve all languages which are supported by Calendarific.
  ///
  /// It may throw a [CalendarificApiException] error on API error.
  ///
  /// It may return [Null] on unexpected parse error.
  @override
  Future<List<Language>?> getLanguages() async {
    final Response<dynamic> response = await client.getLanguages(_apiKey);
    if (response.statusCode != 200) {
      throw getExceptionFromResponse(response.statusCode);
    }

    return Language.listFromJsonData(
      jsonDecode(
        response.body.toString(),
      ),
    );
  }

  /// Retrieve all countries which are supported by Calendarific.
  ///
  /// It may throw a [CalendarificApiException] error on API error.
  ///
  /// It may return [Null] on unexpected parse error.
  @override
  Future<List<Country>?> getCountries() async {
    final Response<dynamic> response = await client.getCountries(_apiKey);
    if (response.statusCode != 200) {
      throw getExceptionFromResponse(response.statusCode);
    }

    return Country.listFromJsonData(
      jsonDecode(
        response.body.toString(),
      ),
    );
  }
}
