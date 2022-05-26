import 'package:calendarific_dart/calendarific_dart.dart';

Future<void> main() async {
  const String apiKey = '';
  final CalendarificApi api = CalendarificApi(apiKey);
  print('Countries: ${await api.getCountries()}');
  print('Languages: ${await api.getLanguages()}');
  print(
      'Holidays: ${await api.getHolidays(countryCode: 'DE', year: '2022', option: const RequestOption.defaultOne())}');
}
