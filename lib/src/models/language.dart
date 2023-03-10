// ignore_for_file: avoid_dynamic_calls

part of 'models.dart';

/// Basic language model class
class Language {
  final String? name;
  final String? code;
  final String? nativeName;
  const Language({
    required this.name,
    required this.code,
    required this.nativeName,
  });
  factory Language.fromJson(dynamic json) => Language(
        nativeName: json?['nativeName']?.toString(),
        code: json?['code']?.toString(),
        name: json?['name']?.toString(),
      );

  static Iterable<Language>? listFromJson(dynamic json) {
    final dynamic data = json?['response']?['languages'];
    if (data is List) return data.map<Language>(Language.fromJson);

    return null;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Language &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          code == other.code &&
          nativeName == other.nativeName;

  @override
  int get hashCode => name.hashCode ^ code.hashCode ^ nativeName.hashCode;

  @override
  String toString() =>
      'Language{name: $name, code: $code, nativeName: $nativeName}';
}
