// ignore_for_file: avoid_dynamic_calls

part of 'models.dart';

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
  factory Holiday.fromJson(dynamic json) {
    final DateTime date = DateTime.parse(json['date']['iso'] as String);
    final List<String> types = List<String>.from(json['type'] as List<dynamic>);

    return Holiday(
      date: date,
      types: types,
      description: json['description'] as String,
      name: json['name'] as String,
    );
  }

  static Iterable<Holiday>? listFromJsonData(dynamic json) {
    final dynamic data = json['response']?['holidays'];
    if (data is List)
      // ignore: curly_braces_in_flow_control_structures
      return data.isEmpty
          ? const <Holiday>[]
          : data.map<Holiday>(Holiday.fromJson);

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
  String toString() =>
      'Holiday{name: $name, description: $description, types: $types, date: $date}';
}
