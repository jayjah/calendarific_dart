// ignore_for_file: avoid_dynamic_calls

part of 'models.dart';

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
  factory Country.fromJson(dynamic json) => Country(
        supportedLanguages: json['supported_languages'] as int,
        totalHolidays: json['total_holidays'] as int,
        isoCode: json['iso-3166'] as String,
        name: json['country_name'] as String,
        uuid: json['uuid'] as String,
      );

  static Iterable<Country>? listFromJsonData(dynamic json) {
    final dynamic data = json['response']?['countries'];
    if (data is List) return data.map<Country>(Country.fromJson);

    return null;
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
