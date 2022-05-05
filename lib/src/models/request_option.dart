// ignore_for_file: comment_references

part of 'models.dart';

/// Get holidays only by year and countryCode
class DefaultRequestOption implements RequestOption {
  const DefaultRequestOption();
  @override
  Future<Response<dynamic>> run(
    String apiKey,
    String countryCode,
    String year,
    CalendarificClient api,
  ) {
    return api.getHolidays(
      apiKey,
      countryCode,
      year,
    );
  }
}

/// Get holidays only by year and countryCode and by specific [CalendarificType]
class DefaultRequestByTypeOption implements RequestOption {
  final CalendarificType type;
  const DefaultRequestByTypeOption({
    required this.type,
  });
  @override
  Future<Response<dynamic>> run(
    String apiKey,
    String countryCode,
    String year,
    CalendarificClient api,
  ) {
    return api.getHolidaysByType(
      apiKey,
      countryCode,
      year,
      type.name,
    );
  }
}

/// Get holidays only by year and countryCode and by specific location
///   [location] must be ISO 3166-2 format
class DefaultRequestByLocationOption implements RequestOption {
  final String location;
  const DefaultRequestByLocationOption({
    required this.location,
  });
  @override
  Future<Response<dynamic>> run(
    String apiKey,
    String countryCode,
    String year,
    CalendarificClient api,
  ) {
    assert(location.isNotEmpty,
        'Provided location value was provided, but is empty! Provided value: $location');
    assert(location.contains('-'),
        'Provided location value is not a valid 3166-2 format! Provided value: $location');

    return api.getHolidaysByLocation(
      apiKey,
      countryCode,
      year,
      location,
    );
  }
}

/// Get holidays only by year and countryCode and by specific [CalendarificType] and location
///   [location] must be ISO 3166-2 format
class DefaultRequestByLocationAndTypeOption implements RequestOption {
  final String location;
  final CalendarificType type;
  const DefaultRequestByLocationAndTypeOption({
    required this.location,
    required this.type,
  });
  @override
  Future<Response<dynamic>> run(
    String apiKey,
    String countryCode,
    String year,
    CalendarificClient api,
  ) {
    assert(location.isNotEmpty,
        'Provided location value was provided, but is empty! Provided value: $location');
    assert(location.contains('-'),
        'Provided location value is not a valid 3166-2 format! Provided value: $location');

    return api.getHolidaysByLocationAndType(
      apiKey,
      countryCode,
      year,
      location,
      type.name,
    );
  }
}

/// Get holidays only by year and countryCode and by specific [month]
///   [month] must be between 1 and 12.
class MonthRequestOption implements RequestOption {
  final int month;
  const MonthRequestOption({required this.month});
  @override
  Future<Response<dynamic>> run(
    String apiKey,
    String countryCode,
    String year,
    CalendarificClient api,
  ) {
    assert(
      month >= 1 && month <= 12,
      'Month must be between 1 and 12!',
    );

    return api.getHolidaysFromMonth(
      apiKey,
      countryCode,
      year,
      month,
    );
  }
}

/// Get holidays only by year and countryCode and by specific [month] and [CalendarificType]
///   [month] must be between 1 and 12.
class MonthRequestByTypeOption implements RequestOption {
  final int month;
  final CalendarificType type;
  const MonthRequestByTypeOption({
    required this.month,
    required this.type,
  });
  @override
  Future<Response<dynamic>> run(
    String apiKey,
    String countryCode,
    String year,
    CalendarificClient api,
  ) {
    assert(
      month >= 1 && month <= 12,
      'Month must be between 1 and 12!',
    );

    return api.getHolidaysFromMonthByType(
      apiKey,
      countryCode,
      year,
      month,
      type.name,
    );
  }
}

/// Get holidays only by year and countryCode and by specific [month] and [location]
///   [month] must be between 1 and 12.
///   [location] must be ISO 3166-2 format
class MonthWithLocationRequestOption implements RequestOption {
  final int month;
  final String location;
  const MonthWithLocationRequestOption({
    required this.month,
    required this.location,
  });
  @override
  Future<Response<dynamic>> run(
    String apiKey,
    String countryCode,
    String year,
    CalendarificClient api,
  ) {
    assert(
      month >= 1 && month <= 12,
      'Month must be between 1 and 12! Provided value: $month',
    );
    assert(location.isNotEmpty,
        'Provided location value was provided, but is empty! Provided value: $location');
    assert(location.contains('-'),
        'Provided location value is not a valid 3166-2 format! Provided value: $location');

    return api.getHolidaysFromMonthByLocation(
      apiKey,
      countryCode,
      year,
      month,
      location,
    );
  }
}

/// Get holidays only by year and countryCode and by specific [month], [CalendarificType] and [location]
///   [month] must be between 1 and 12.
///   [location] must be ISO 3166-2 format
class MonthWithLocationByTypeRequestOption implements RequestOption {
  final int month;
  final String location;
  final CalendarificType type;
  const MonthWithLocationByTypeRequestOption({
    required this.month,
    required this.location,
    required this.type,
  });
  @override
  Future<Response<dynamic>> run(
    String apiKey,
    String countryCode,
    String year,
    CalendarificClient api,
  ) {
    assert(
      month >= 1 && month <= 12,
      'Month must be between 1 and 12! Provided value: $month',
    );
    assert(location.isNotEmpty,
        'Provided location value was provided, but is empty! Provided value: $location');
    assert(location.contains('-'),
        'Provided location value is not a valid 3166-2 format! Provided value: $location');

    return api.getHolidaysFromMonthByLocationAndType(
      apiKey,
      countryCode,
      year,
      month,
      location,
      type.name,
    );
  }
}

/// Get holidays only by year, countryCode and by specific [day] and [month]
///   [day] must be between 1 and 31.
///   [month] must be between 1 and 12.
class MonthDayRequestOption implements RequestOption {
  final int month;
  final int day;
  const MonthDayRequestOption({
    required this.month,
    required this.day,
  });
  @override
  Future<Response<dynamic>> run(
    String apiKey,
    String countryCode,
    String year,
    CalendarificClient api,
  ) {
    assert(
      day >= 1 && day <= 31 && month >= 1 && month <= 12,
      'Day must be between 1 and 31. Month must be between 1 and 12! Provided day: $day; Provided month: $month',
    );

    return api.getSpecificHolidays(apiKey, countryCode, year, day, month);
  }
}

/// Get holidays only by year, countryCode and by specific [day], [month] and [CalendarificType]
///   [day] must be between 1 and 31.
///   [month] must be between 1 and 12.
class MonthDayByTypeRequestOption implements RequestOption {
  final int month;
  final int day;
  final CalendarificType type;
  const MonthDayByTypeRequestOption({
    required this.month,
    required this.day,
    required this.type,
  });
  @override
  Future<Response<dynamic>> run(
    String apiKey,
    String countryCode,
    String year,
    CalendarificClient api,
  ) {
    assert(
      day >= 1 && day <= 31 && month >= 1 && month <= 12,
      'Day must be between 1 and 31. Month must be between 1 and 12! Provided day: $day; Provided month: $month',
    );

    return api.getSpecificHolidaysByType(
      apiKey,
      countryCode,
      year,
      day,
      month,
      type.name,
    );
  }
}

/// Get holidays only by year, countryCode and by specific [day], [month] and [location]
///   [day] must be between 1 and 31.
///   [month] must be between 1 and 12.
///   [location] must be ISO 3166-2 format
class MonthDayWithLocationRequestOption implements RequestOption {
  final int month;
  final int day;
  final String location;
  const MonthDayWithLocationRequestOption({
    required this.month,
    required this.day,
    required this.location,
  });
  @override
  Future<Response<dynamic>> run(
    String apiKey,
    String countryCode,
    String year,
    CalendarificClient api,
  ) {
    assert(
      day >= 1 && day <= 31 && month >= 1 && month <= 12,
      'Day must be between 1 and 31. Month must be between 1 and 12! Provided day: $day; Provided month: $month',
    );
    assert(location.isNotEmpty,
        'Provided location value was provided, but is empty! Provided value: $location');
    assert(location.contains('-'),
        'Provided location value is not a valid 3166-2 format! Provided value: $location');

    return api.getSpecificHolidaysByLocation(
      apiKey,
      countryCode,
      year,
      day,
      month,
      location,
    );
  }
}

/// Get holidays only by year, countryCode and by specific [day], [month], [location] and [CalendarificType]
///   [day] must be between 1 and 31.
///   [month] must be between 1 and 12.
///   [location] must be ISO 3166-2 format
class MonthDayWithLocationByTypeRequestOption implements RequestOption {
  final int month;
  final int day;
  final String location;
  final CalendarificType type;
  const MonthDayWithLocationByTypeRequestOption({
    required this.month,
    required this.day,
    required this.location,
    required this.type,
  });
  @override
  Future<Response<dynamic>> run(
    String apiKey,
    String countryCode,
    String year,
    CalendarificClient api,
  ) {
    assert(
      day >= 1 && day <= 31 && month >= 1 && month <= 12,
      'Day must be between 1 and 31. Month must be between 1 and 12! Provided day: $day; Provided month: $month',
    );
    assert(location.isNotEmpty,
        'Provided location value was provided, but is empty! Provided value: $location');
    assert(location.contains('-'),
        'Provided location value is not a valid 3166-2 format!  Provided value: $location');

    return api.getSpecificHolidaysByLocationAndType(
      apiKey,
      countryCode,
      year,
      day,
      month,
      location,
      type.name,
    );
  }
}

/// Abstract class, which is used to handle the API call in the run method inside
abstract class RequestOption {
  const RequestOption();
  Future<Response<dynamic>> run(
    String apiKey,
    String countryCode,
    String year,
    CalendarificClient api,
  );
}
