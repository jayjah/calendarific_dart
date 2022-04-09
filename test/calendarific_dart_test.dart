import 'dart:io' show Platform;

import 'package:calendarific_dart/calendarific_dart.dart';
import 'package:test/test.dart';

void main() {
  group('Calendarific API Test', () {
    final dynamic apiKey = Platform.environment['CALENDARIFIC_API_KEY'];
    late CalendarificApi api;

    setUp(() {
      //  assert(apiKey != null,
      //      'ApiKey `CALENDARIFIC_API_KEY` from environment NOT readable or NOT available!');
      api = CalendarificApi(
          /*apiKey as String*/ '59990c617d5a55672d7ddaaa817dd3bbd4553f31');
    });

    test('getHolidays Test', () async {
      final List<Holiday>? data =
          await api.getHolidays(countryCode: 'DE', year: '2022');
      expect(data, isNotNull);
      expect(data, isNotEmpty);
    });

    test('getSpecificHolidays Test', () async {
      final List<Holiday>? data = await api.getHolidays(
        countryCode: 'DE',
        year: '2022',
        month: 12,
        day: 24,
      );
      expect(data, isNotNull);
      expect(data, isNotEmpty);
    });

    test('getHolidaysFromMonth Test', () async {
      final List<Holiday>? data = await api.getHolidaysFromMonth(
        countryCode: 'DE',
        year: '2022',
        month: 12,
      );
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
