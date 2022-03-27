<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

![Dart](https://img.shields.io/badge/Dart-2.16.1-green)

A dart package to retrieve holiday information from calendarific API.

## Features

- retrieve holiday information
- retrieve language information
- retrieve country information

## Usage

```
import 'package:calendarific_dart/calendarific_dart.dart';

Future<void> main() async {
  const String apiKey = '';
  final CalendarificApi api = CalendarificApi(apiKey);
  print('Countries: ${await api.getCountries()}');
  print('Languages: ${await api.getLanguages()}');
  print('Holidays: ${await api.getHolidays(countryCode: 'DE', year: '2022')}');
}

```

See `/example` or `/test` for usage information.

## Additional information

[Calendarific API v2](https://calendarific.com/api-documentation)
