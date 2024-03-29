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
      final (Iterable<Holiday>, Exception?) data = await api.getHolidays(
        countryCode: 'DE',
        year: '2022',
        option: const RequestOption.defaultOne(),
      );
      expect(data.$2, isNull);
      expect(data.$1, isNotEmpty);
    });

    test('getHolidaysByType Test', () async {
      final (Iterable<Holiday>, Exception?) data = await api.getHolidays(
        countryCode: 'DE',
        year: '2022',
        option: const RequestOption.defaultByType(
          type: CalendarificType.local,
        ),
      );
      expect(data.$2, isNull);
      expect(data.$1, isNotEmpty);
    });

    test('getHolidaysByLocation Test', () async {
      final (Iterable<Holiday>, Exception?) data = await api.getHolidays(
        countryCode: 'DE',
        year: '2022',
        option: const RequestOption.defaultByLocation(
          location: 'de-sh',
        ),
      );
      expect(data.$2, isNull);
      expect(data.$1, isNotEmpty);
    });

    test('getHolidaysByLocationAndType Test', () async {
      final (Iterable<Holiday>, Exception?) data = await api.getHolidays(
        countryCode: 'DE',
        year: '2022',
        option: const RequestOption.defaultByTypeAndLocation(
          location: 'de-sh',
          type: CalendarificType.local,
        ),
      );
      expect(data.$2, isNull);
      expect(data.$1, isNotEmpty);
    });

    test('getSpecificHolidays Test', () async {
      final (Iterable<Holiday>, Exception?) data = await api.getHolidays(
        countryCode: 'DE',
        year: '2022',
        option: const RequestOption.byMonthAndDay(
          month: 12,
          day: 24,
        ),
      );
      expect(data.$2, isNull);
      expect(data.$1, isNotEmpty);
    });

    test('getSpecificHolidaysByLocation Test', () async {
      final (Iterable<Holiday>, Exception?) data = await api.getHolidays(
        countryCode: 'DE',
        year: '2022',
        option: const RequestOption.byMonthDayAndLocation(
          month: 12,
          day: 24,
          location: 'de-sh',
        ),
      );
      expect(data.$2, isNull);
      expect(data.$1, isNotEmpty);
    });

    test('getSpecificHolidaysByLocationAndType Test', () async {
      final (Iterable<Holiday>, Exception?) data = await api.getHolidays(
        countryCode: 'DE',
        year: '2022',
        option: const RequestOption.byMonthDayTypeAndLocation(
          month: 12,
          day: 24,
          location: 'de-sh',
          type: CalendarificType.local,
        ),
      );
      expect(data.$2, isNull);
      expect(data.$1, isNotEmpty);
    });

    test('getSpecificHolidaysByType Test', () async {
      final (Iterable<Holiday>, Exception?) data = await api.getHolidays(
        countryCode: 'DE',
        year: '2022',
        option: const RequestOption.byMonthDayAndType(
          month: 12,
          day: 24,
          type: CalendarificType.local,
        ),
      );
      expect(data.$2, isNull);
      expect(data.$1, isNotEmpty);
    });

    test('getHolidaysFromMonth Test', () async {
      final (Iterable<Holiday>, Exception?) data = await api.getHolidays(
        countryCode: 'DE',
        year: '2022',
        option: const RequestOption.byMonth(
          month: 12,
        ),
      );
      expect(data.$2, isNull);
      expect(data.$1, isNotEmpty);
    });

    test('getHolidaysFromMonthByLocation Test', () async {
      final (Iterable<Holiday>, Exception?) data = await api.getHolidays(
        countryCode: 'DE',
        year: '2022',
        option: const RequestOption.byMonthAndLocation(
          month: 12,
          location: 'de-sh',
        ),
      );
      expect(data.$2, isNull);
      expect(data.$1, isNotEmpty);
    });

    test('getHolidaysFromMonthByLocationAndType Test', () async {
      final (Iterable<Holiday>, Exception?) data = await api.getHolidays(
        countryCode: 'DE',
        year: '2022',
        option: const RequestOption.byMonthTypeAndLocation(
          month: 12,
          location: 'de-sh',
          type: CalendarificType.local,
        ),
      );
      expect(data.$2, isNull);
      expect(data.$1, isNotEmpty);
    });

    test('getHolidaysFromMonthByType Test', () async {
      final (Iterable<Holiday>, Exception?) data = await api.getHolidays(
        countryCode: 'DE',
        year: '2022',
        option: const RequestOption.byMonthAndType(
          month: 12,
          type: CalendarificType.local,
        ),
      );
      expect(data.$2, isNull);
      expect(data.$1, isNotEmpty);
    });

    test('getLanguages Test', () async {
      final (Iterable<Language>, Exception?) data = await api.getLanguages();
      expect(data.$2, isNull);
      expect(data.$1, isNotEmpty);
    });

    test('getCountries Test', () async {
      final (Iterable<Country>, Exception?) data = await api.getCountries();
      expect(data.$2, isNull);
      expect(data.$1, isNotEmpty);
    });
  });
}
