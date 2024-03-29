// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client.dart';

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
    String apiKey,
    String countryCode,
    String year,
  ) {
    final Uri $url = Uri.parse(
        'https://calendarific.com/api/v2/holidays?api_key=${apiKey}&country=${countryCode}&year=${year}');
    final Map<String, String> $headers = {
      'Content-Type': 'application/json',
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getHolidaysByType(
    String apiKey,
    String countryCode,
    String year,
    String type,
  ) {
    final Uri $url = Uri.parse(
        'https://calendarific.com/api/v2/holidays?api_key=${apiKey}&country=${countryCode}&year=${year}&type=${type}');
    final Map<String, String> $headers = {
      'Content-Type': 'application/json',
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getHolidaysByLocation(
    String apiKey,
    String countryCode,
    String year,
    String location,
  ) {
    final Uri $url = Uri.parse(
        'https://calendarific.com/api/v2/holidays?api_key=${apiKey}&country=${countryCode}&year=${year}&location=${location}');
    final Map<String, String> $headers = {
      'Content-Type': 'application/json',
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getHolidaysByLocationAndType(
    String apiKey,
    String countryCode,
    String year,
    String location,
    String type,
  ) {
    final Uri $url = Uri.parse(
        'https://calendarific.com/api/v2/holidays?api_key=${apiKey}&country=${countryCode}&year=${year}&location=${location},type${type}');
    final Map<String, String> $headers = {
      'Content-Type': 'application/json',
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getSpecificHolidays(
    String apiKey,
    String countryCode,
    String year,
    int day,
    int month,
  ) {
    final Uri $url = Uri.parse(
        'https://calendarific.com/api/v2/holidays?api_key=${apiKey}&country=${countryCode}&year=${year}&day=${day},month=${month}');
    final Map<String, String> $headers = {
      'Content-Type': 'application/json',
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getSpecificHolidaysByType(
    String apiKey,
    String countryCode,
    String year,
    int day,
    int month,
    String type,
  ) {
    final Uri $url = Uri.parse(
        'https://calendarific.com/api/v2/holidays?api_key=${apiKey}&country=${countryCode}&year=${year}&day=${day},month=${month},type=${type}');
    final Map<String, String> $headers = {
      'Content-Type': 'application/json',
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getSpecificHolidaysByLocation(
    String apiKey,
    String countryCode,
    String year,
    int day,
    int month,
    String location,
  ) {
    final Uri $url = Uri.parse(
        'https://calendarific.com/api/v2/holidays?api_key=${apiKey}&country=${countryCode}&year=${year}&day=${day},month=${month},location=${location}');
    final Map<String, String> $headers = {
      'Content-Type': 'application/json',
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getSpecificHolidaysByLocationAndType(
    String apiKey,
    String countryCode,
    String year,
    int day,
    int month,
    String location,
    String type,
  ) {
    final Uri $url = Uri.parse(
        'https://calendarific.com/api/v2/holidays?api_key=${apiKey}&country=${countryCode}&year=${year}&day=${day},month=${month},location=${location},type=${type}');
    final Map<String, String> $headers = {
      'Content-Type': 'application/json',
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getHolidaysFromMonth(
    String apiKey,
    String countryCode,
    String year,
    int month,
  ) {
    final Uri $url = Uri.parse(
        'https://calendarific.com/api/v2/holidays?api_key=${apiKey}&country=${countryCode}&year=${year}&month=${month}');
    final Map<String, String> $headers = {
      'Content-Type': 'application/json',
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getHolidaysFromMonthByType(
    String apiKey,
    String countryCode,
    String year,
    int month,
    String type,
  ) {
    final Uri $url = Uri.parse(
        'https://calendarific.com/api/v2/holidays?api_key=${apiKey}&country=${countryCode}&year=${year}&month=${month},type${type}');
    final Map<String, String> $headers = {
      'Content-Type': 'application/json',
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getHolidaysFromMonthByLocation(
    String apiKey,
    String countryCode,
    String year,
    int month,
    String location,
  ) {
    final Uri $url = Uri.parse(
        'https://calendarific.com/api/v2/holidays?api_key=${apiKey}&country=${countryCode}&year=${year}&month=${month},location=${location}');
    final Map<String, String> $headers = {
      'Content-Type': 'application/json',
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getHolidaysFromMonthByLocationAndType(
    String apiKey,
    String countryCode,
    String year,
    int month,
    String location,
    String type,
  ) {
    final Uri $url = Uri.parse(
        'https://calendarific.com/api/v2/holidays?api_key=${apiKey}&country=${countryCode}&year=${year}&month=${month},location=${location},type${type}');
    final Map<String, String> $headers = {
      'Content-Type': 'application/json',
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getLanguages(String apiKey) {
    final Uri $url = Uri.parse(
        'https://calendarific.com/api/v2/languages?api_key=${apiKey}');
    final Map<String, String> $headers = {
      'Content-Type': 'application/json',
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getCountries(String apiKey) {
    final Uri $url = Uri.parse(
        'https://calendarific.com/api/v2/countries?api_key=${apiKey}');
    final Map<String, String> $headers = {
      'Content-Type': 'application/json',
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }
}
