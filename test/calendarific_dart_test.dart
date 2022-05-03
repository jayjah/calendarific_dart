import 'dart:io' show Platform;

import 'package:calendarific_dart/calendarific_dart.dart';
import 'package:test/test.dart';

void main() {
  group('Calendarific API Test', () {
    final dynamic apiKey = Platform.environment['CALENDARIFIC_API_KEY'];
    late CalendarificApi api;

    setUp(() {
      assert(apiKey != null,
          'ApiKey `CALENDARIFIC_API_KEY` from environment NOT readable or NOT available!');
      api = CalendarificApi(apiKey as String);
    });

    test('getHolidays Test', () async {
      final Iterable<Holiday>? data = await api.getHolidays(
        countryCode: 'DE',
        year: '2022',
        option: const DefaultRequestOption(),
      );
      expect(data, isNotNull);
      expect(data, isNotEmpty);
    });

    test('getHolidaysByType Test', () async {
      final Iterable<Holiday>? data = await api.getHolidays(
        countryCode: 'DE',
        year: '2022',
        option: const DefaultRequestByTypeOption(
          type: CalendarificType.local,
        ),
      );
      expect(data, isNotNull);
      expect(data, isNotEmpty);
    });

    test('getHolidaysByLocation Test', () async {
      final Iterable<Holiday>? data = await api.getHolidays(
        countryCode: 'DE',
        year: '2022',
        option: const DefaultRequestByLocationOption(
          location: 'de-sh',
        ),
      );
      expect(data, isNotNull);
      expect(data, isNotEmpty);
    });

    test('getHolidaysByLocationAndType Test', () async {
      final Iterable<Holiday>? data = await api.getHolidays(
        countryCode: 'DE',
        year: '2022',
        option: const DefaultRequestByLocationAndTypeOption(
          location: 'de-sh',
          type: CalendarificType.local,
        ),
      );
      expect(data, isNotNull);
      expect(data, isNotEmpty);
    });

    test('getSpecificHolidays Test', () async {
      final Iterable<Holiday>? data = await api.getHolidays(
        countryCode: 'DE',
        year: '2022',
        option: const MonthDayRequestOption(
          month: 12,
          day: 24,
        ),
      );
      expect(data, isNotNull);
      expect(data, isNotEmpty);
    });

    test('getSpecificHolidaysByLocation Test', () async {
      final Iterable<Holiday>? data = await api.getHolidays(
        countryCode: 'DE',
        year: '2022',
        option: const MonthDayWithLocationRequestOption(
          month: 12,
          day: 24,
          location: 'de-sh',
        ),
      );
      expect(data, isNotNull);
      expect(data, isNotEmpty);
    });

    test('getSpecificHolidaysByLocationAndType Test', () async {
      final Iterable<Holiday>? data = await api.getHolidays(
        countryCode: 'DE',
        year: '2022',
        option: const MonthDayWithLocationByTypeRequestOption(
          month: 12,
          day: 24,
          location: 'de-sh',
          type: CalendarificType.local,
        ),
      );
      expect(data, isNotNull);
      expect(data, isNotEmpty);
    });

    test('getSpecificHolidaysByType Test', () async {
      final Iterable<Holiday>? data = await api.getHolidays(
        countryCode: 'DE',
        year: '2022',
        option: const MonthDayByTypeRequestOption(
          month: 12,
          day: 24,
          type: CalendarificType.local,
        ),
      );
      expect(data, isNotNull);
      expect(data, isNotEmpty);
    });

    test('getHolidaysFromMonth Test', () async {
      final Iterable<Holiday>? data = await api.getHolidays(
        countryCode: 'DE',
        year: '2022',
        option: const MonthRequestOption(
          month: 12,
        ),
      );
      expect(data, isNotNull);
      expect(data, isNotEmpty);
    });

    test('getHolidaysFromMonthByLocation Test', () async {
      final Iterable<Holiday>? data = await api.getHolidays(
        countryCode: 'DE',
        year: '2022',
        option:
            const MonthWithLocationRequestOption(month: 12, location: 'de-sh'),
      );
      expect(data, isNotNull);
      expect(data, isNotEmpty);
    });

    test('getHolidaysFromMonthByLocationAndType Test', () async {
      final Iterable<Holiday>? data = await api.getHolidays(
        countryCode: 'DE',
        year: '2022',
        option: const MonthWithLocationByTypeRequestOption(
          month: 12,
          location: 'de-sh',
          type: CalendarificType.local,
        ),
      );
      expect(data, isNotNull);
      expect(data, isNotEmpty);
    });

    test('getHolidaysFromMonthByType Test', () async {
      final Iterable<Holiday>? data = await api.getHolidays(
        countryCode: 'DE',
        year: '2022',
        option: const MonthRequestByTypeOption(
          month: 12,
          type: CalendarificType.local,
        ),
      );
      expect(data, isNotNull);
      expect(data, isNotEmpty);
    });

    test('getLanguages Test', () async {
      final Iterable<Language>? data = await api.getLanguages();
      expect(data, isNotNull);
      expect(data, isNotEmpty);
    });

    test('getCountries Test', () async {
      final Iterable<Country>? data = await api.getCountries();
      expect(data, isNotNull);
      expect(data, isNotEmpty);
    });
  });
}
