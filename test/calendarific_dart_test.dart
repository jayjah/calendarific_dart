import 'dart:io' show Platform;

import 'package:calendarific_dart/calendarific_dart.dart';
import 'package:test/test.dart';

void main() {
  group('Calendarific API Test', () {
    print('Environment: ${Platform.environment}');
    final String? apiKey = Platform.environment['CALENDARIFIC_API_KEY'];
    late CalendarificApi api;

    setUp(() {
      assert(apiKey != null,
          'ApiKey `CALENDARIFIC_API_KEY` from environment not readable or not available!');
      api = CalendarificApi(apiKey!);
    });

    test('getHolidays Test', () async {
      final List<Holiday>? data =
          await api.getHolidays(countryCode: 'DE', year: '2022');
      expect(data, isNotNull);
      expect(data, isNotEmpty);
    });

    test('getLanguages Test', () async {
      final List<Language>? data = await api.getLanguages();
      expect(data, isNotNull);
      expect(data, isNotEmpty);
    });

    test('getCountries Test', () async {
      final List<Country>? data = await api.getCountries();
      expect(data, isNotNull);
      expect(data, isNotEmpty);
    });
  });
}
