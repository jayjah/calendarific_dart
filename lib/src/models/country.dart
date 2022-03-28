// ignore_for_file: avoid_dynamic_calls

library calendarific_dart;

/// Basic country model class
class Country {
  final String name;
  final String isoCode;
  final int totalHolidays;
  final int supportedLanguages;
  final String uuid;
  const Country({
    required this.name,
    required this.isoCode,
    required this.totalHolidays,
    required this.supportedLanguages,
    required this.uuid,
  });
  static List<Country>? listFromJsonData(dynamic json) {
    final dynamic data = json['response']?['countries'];
    if (data is List) {
      return data
          .map<Country>((dynamic e) => Country(
                supportedLanguages: e['supported_languages'] as int,
                totalHolidays: e['total_holidays'] as int,
                isoCode: e['iso-3166'] as String,
                name: e['country_name'] as String,
                uuid: e['uuid'] as String,
              ))
          .toList(growable: false);
    }

    return null;
  }
}
