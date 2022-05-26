// ignore_for_file: comment_references

part of 'api.dart';

/// Get holidays only by year and countryCode
class _DefaultRequestOption implements RequestOption {
  const _DefaultRequestOption();
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
class _DefaultRequestByTypeOption implements RequestOption {
  final CalendarificType type;
  const _DefaultRequestByTypeOption({
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
class _DefaultRequestByLocationOption implements RequestOption {
  final String location;
  const _DefaultRequestByLocationOption({
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
class _DefaultRequestByLocationAndTypeOption implements RequestOption {
  final String location;
  final CalendarificType type;
  const _DefaultRequestByLocationAndTypeOption({
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
class _MonthRequestOption implements RequestOption {
  final int month;
  const _MonthRequestOption({required this.month});
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
class _MonthRequestByTypeOption implements RequestOption {
  final int month;
  final CalendarificType type;
  const _MonthRequestByTypeOption({
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
class _MonthWithLocationRequestOption implements RequestOption {
  final int month;
  final String location;
  const _MonthWithLocationRequestOption({
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
class _MonthWithLocationByTypeRequestOption implements RequestOption {
  final int month;
  final String location;
  final CalendarificType type;
  const _MonthWithLocationByTypeRequestOption({
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
class _MonthDayRequestOption implements RequestOption {
  final int month;
  final int day;
  const _MonthDayRequestOption({
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
class _MonthDayByTypeRequestOption implements RequestOption {
  final int month;
  final int day;
  final CalendarificType type;
  const _MonthDayByTypeRequestOption({
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
class _MonthDayWithLocationRequestOption implements RequestOption {
  final int month;
  final int day;
  final String location;
  const _MonthDayWithLocationRequestOption({
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
class _MonthDayWithLocationByTypeRequestOption implements RequestOption {
  final int month;
  final int day;
  final String location;
  final CalendarificType type;
  const _MonthDayWithLocationByTypeRequestOption({
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
  const factory RequestOption.defaultOne() = _DefaultRequestOption;
  const factory RequestOption.defaultByType({
    required CalendarificType type,
  }) = _DefaultRequestByTypeOption;
  const factory RequestOption.defaultByLocation({
    required String location,
  }) = _DefaultRequestByLocationOption;
  const factory RequestOption.defaultByTypeAndLocation({
    required CalendarificType type,
    required String location,
  }) = _DefaultRequestByLocationAndTypeOption;

  const factory RequestOption.byMonth({
    required int month,
  }) = _MonthRequestOption;
  const factory RequestOption.byMonthAndType({
    required int month,
    required CalendarificType type,
  }) = _MonthRequestByTypeOption;
  const factory RequestOption.byMonthAndLocation({
    required int month,
    required String location,
  }) = _MonthWithLocationRequestOption;
  const factory RequestOption.byMonthTypeAndLocation({
    required int month,
    required CalendarificType type,
    required String location,
  }) = _MonthWithLocationByTypeRequestOption;

  const factory RequestOption.byMonthAndDay({
    required int month,
    required int day,
  }) = _MonthDayRequestOption;
  const factory RequestOption.byMonthDayAndLocation({
    required int month,
    required int day,
    required String location,
  }) = _MonthDayWithLocationRequestOption;
  const factory RequestOption.byMonthDayAndType({
    required int month,
    required int day,
    required CalendarificType type,
  }) = _MonthDayByTypeRequestOption;
  const factory RequestOption.byMonthDayTypeAndLocation({
    required int month,
    required int day,
    required CalendarificType type,
    required String location,
  }) = _MonthDayWithLocationByTypeRequestOption;

  Future<Response<dynamic>> run(
    String apiKey,
    String countryCode,
    String year,
    CalendarificClient api,
  );
}
