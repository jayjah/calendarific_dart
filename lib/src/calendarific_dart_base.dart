import 'dart:convert';

import 'package:calendarific_dart/src/calendarific_api.dart';
import 'package:calendarific_dart/src/calendarific_dart_interface.dart';
import 'package:calendarific_dart/src/models/models.dart';

import 'package:chopper/chopper.dart';

/// Calendarific API
class CalendarificApi extends CalendarificDartApi {
  final String _apiKey;
  final CalendarificClient client;
  CalendarificApi(this._apiKey)
      : client = CalendarificClient.create(ChopperClient());

  @override
  Future<List<Holiday>?> getHolidays(
      {required String countryCode, required String year}) async {
    final Response<dynamic> response =
        await client.getHolidays(_apiKey, countryCode, year);
    print(
        'Holidays Response :: Status-Code: ${response.statusCode}\n Body:${response.body}');

    if (response.statusCode == 200) {
      return Holiday.listFromJsonData(
        jsonDecode(
          response.body.toString(),
        ),
      );
    } else {
      final Exception? e = getExceptionFromResponse(response.statusCode);
      if (e != null) throw e;
    }

    return null;
  }

  @override
  Future<List<Language>?> getLanguages() async {
    final Response<dynamic> response = await client.getLanguages(_apiKey);
    print(
        'Languages Response :: Status-Code: ${response.statusCode}\n Body:${response.body}');

    if (response.statusCode == 200) {
      return Language.listFromJsonData(
        jsonDecode(
          response.body.toString(),
        ),
      );
    } else {
      final Exception? e = getExceptionFromResponse(response.statusCode);
      if (e != null) throw e;
    }

    return null;
  }

  @override
  Future<List<Country>?> getCountries() async {
    final Response<dynamic> response = await client.getCountries(_apiKey);
    print(
        'Countries Response :: Status-Code: ${response.statusCode}\n Body:${response.body}');

    if (response.statusCode == 200) {
      return Country.listFromJsonData(
        jsonDecode(
          response.body.toString(),
        ),
      );
    } else {
      final Exception? e = getExceptionFromResponse(response.statusCode);
      if (e != null) throw e;
    }

    return null;
  }
}
