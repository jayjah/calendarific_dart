// ignore_for_file: avoid_dynamic_calls

part of 'models.dart';

/// Basic country model class
class Country {
  final String? name;
  final String? isoCode;
  final int? totalHolidays;
  final int? supportedLanguages;
  final String? uuid;
  const Country({
    required this.name,
    required this.isoCode,
    required this.totalHolidays,
    required this.supportedLanguages,
    required this.uuid,
  });
  factory Country.fromJson(final dynamic json) {
    late final dynamic supportedLanguages = json?['supported_languages'];
    late final dynamic totalHolidays = json?['total_holidays'];

    return Country(
      supportedLanguages: supportedLanguages == null
          ? null
          : int.tryParse(
              supportedLanguages.toString(),
            ),
      totalHolidays: totalHolidays == null
          ? null
          : int.tryParse(
              totalHolidays.toString(),
            ),
      isoCode: json?['iso-3166']?.toString(),
      name: json?['country_name']?.toString(),
      uuid: json?['uuid']?.toString(),
    );
  }

  static (Iterable<Country>, Exception?) listFromJson(dynamic json) {
    return switch (json) {
      {
        'response': {
          'countries': final List<Map<String, dynamic>> data,
        }
      } =>
        (data.map<Country>(Country.fromJson), null),
      _ => (const <Country>[], CalendarificApiException.jsonParseError),
    };
    /*final dynamic data = json?['response']?['countries'];
    if (data is List)
      // ignore: curly_braces_in_flow_control_structures
      return data.isEmpty
          ? const <Country>[]
          : data.map<Country>(Country.fromJson);

    return null;*/
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Country &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          isoCode == other.isoCode &&
          totalHolidays == other.totalHolidays &&
          supportedLanguages == other.supportedLanguages &&
          uuid == other.uuid;

  @override
  int get hashCode =>
      name.hashCode ^
      isoCode.hashCode ^
      totalHolidays.hashCode ^
      supportedLanguages.hashCode ^
      uuid.hashCode;

  @override
  String toString() =>
      'Country{name: $name, isoCode: $isoCode, totalHolidays: $totalHolidays, supportedLanguages: $supportedLanguages, uuid: $uuid}';
}
