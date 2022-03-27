// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendarific_client.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$CalendarificClient extends CalendarificClient {
  _$CalendarificClient([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = CalendarificClient;

  @override
  Future<Response<dynamic>> getHolidays(
      String apiKey, String countryCode, String year) {
    final $url =
        'https://calendarific.com/api/v2/holidays?api_key=${apiKey}&country=${countryCode}&year=${year}';
    final $headers = {
      'Content-Type': 'application/json',
    };

    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getLanguages(String apiKey) {
    final $url = 'https://calendarific.com/api/v2/languages?api_key=${apiKey}';
    final $headers = {
      'Content-Type': 'application/json',
    };

    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getCountries(String apiKey) {
    final $url = 'https://calendarific.com/api/v2/countries?api_key=${apiKey}';
    final $headers = {
      'Content-Type': 'application/json',
    };

    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }
}
