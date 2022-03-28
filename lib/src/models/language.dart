// ignore_for_file: avoid_dynamic_calls

library calendarific_dart;

/// Basic language model class
class Language {
  final String name;
  final String code;
  final String nativeName;
  const Language({
    required this.name,
    required this.code,
    required this.nativeName,
  });
  static List<Language>? listFromJsonData(dynamic json) {
    final dynamic data = json['response']?['languages'];
    if (data is List) {
      return data
          .map<Language>((dynamic e) => Language(
                nativeName: e['nativeName'] as String,
                code: e['code'] as String,
                name: e['name'] as String,
              ))
          .toList(growable: false);
    }

    return null;
  }
}
