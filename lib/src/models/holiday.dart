// ignore_for_file: avoid_dynamic_calls, curly_braces_in_flow_control_structures

part of 'models.dart';

/// Basic holiday model class
class Holiday {
  final String? name;
  final String? description;
  final List<String>? types;
  final DateTime? date;
  const Holiday({
    required this.name,
    required this.description,
    required this.types,
    required this.date,
  });
  factory Holiday.fromJson(dynamic json) {
    late final String? isoDateTime = json?['date']?['iso']?.toString();
    late final DateTime? date =
        isoDateTime == null ? null : DateTime.parse(isoDateTime);
    late final dynamic jsonTypes = json?['type'];
    late final List<String>? types =
        jsonTypes is List ? List<String>.from(jsonTypes) : null;

    return Holiday(
      date: date,
      types: types,
      description: json?['description']?.toString(),
      name: json?['name']?.toString(),
    );
  }

  static (Iterable<Holiday>, Exception?) listFromJson(dynamic json) {
    return switch (json) {
      {
        'response': {
          'holidays': final List<Map<String, dynamic>> data,
        }
      } =>
        (data.map<Holiday>(Holiday.fromJson), null),
      _ => (const <Holiday>[], CalendarificApiException.jsonParseError),
    };

    /*final dynamic data = json?['response']?['holidays'];
    if (data is List)
      return data.isEmpty
          ? const <Holiday>[]
          : data.map<Holiday>(Holiday.fromJson);

    return null;*/
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
