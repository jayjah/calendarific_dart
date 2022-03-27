import 'package:calendarific_dart/calendarific_dart.dart';
import 'package:test/test.dart';

void main() {
  group('Calendarific API Test', () {
    // TODO read apiKey from environment for github action testing
    //https://api.dart.dev/stable/2.16.2/dart-io/Platform-class.html
    const String apiKey = '';
    late CalendarificApi api;

    setUp(() {
      api = CalendarificApi(apiKey);
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
