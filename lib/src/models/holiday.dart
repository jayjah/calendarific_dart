// ignore_for_file: avoid_dynamic_calls

library calendarific_dart;

/// Basic holiday model class
class Holiday {
  final String name;
  final String description;
  final List<String> types;
  final DateTime date;
  const Holiday({
    required this.name,
    required this.description,
    required this.types,
    required this.date,
  });
  static List<Holiday>? listFromJsonData(dynamic json) {
    final dynamic data = json['response']?['holidays'];
    if (data is List) {
      return data.map<Holiday>((dynamic e) {
        final DateTime date = DateTime.parse(e['date']['iso'] as String);
        final List<String> types =
            List<String>.from(e['type'] as List<dynamic>);

        return Holiday(
          date: date,
          types: types,
          description: e['description'] as String,
          name: e['name'] as String,
        );
      }).toList(growable: false);
    }

    return null;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Holiday &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          description == other.description &&
          types == other.types &&
          date == other.date;

  @override
  int get hashCode =>
      name.hashCode ^ description.hashCode ^ types.hashCode ^ date.hashCode;

  @override
  String toString() {
    return 'Holiday{name: $name, description: $description, types: $types, date: $date}';
  }
}
