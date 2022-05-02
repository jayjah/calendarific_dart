import 'package:chopper/chopper.dart';

part 'client.chopper.dart';

/// Calendarific Rest Client abstraction
@ChopperApi(baseUrl: "https://calendarific.com/api/v2")
abstract class CalendarificClient extends ChopperService {
  static CalendarificClient create(ChopperClient dio) =>
      _$CalendarificClient(dio);

  @Get(
    path: "/holidays?api_key={api_key}&country={country}&year={year}",
    headers: <String, String>{"Content-Type": "application/json"},
  )
  Future<Response<dynamic>> getHolidays(
    @Path('api_key') String apiKey,
    @Path('country') String countryCode,
    @Path('year') String year,
  );

  @Get(
    path:
        "/holidays?api_key={api_key}&country={country}&year={year}&location={location}",
    headers: <String, String>{"Content-Type": "application/json"},
  )
  Future<Response<dynamic>> getHolidaysByLocation(
    @Path('api_key') String apiKey,
    @Path('country') String countryCode,
    @Path('year') String year,
    @Path('location') String location,
  );

  @Get(
    path:
        "/holidays?api_key={api_key}&country={country}&year={year}&day={day},month={month}",
    headers: <String, String>{"Content-Type": "application/json"},
  )
  Future<Response<dynamic>> getSpecificHolidays(
    @Path('api_key') String apiKey,
    @Path('country') String countryCode,
    @Path('year') String year,
    @Path('day') int day,
    @Path('month') int month,
  );

  @Get(
    path:
        "/holidays?api_key={api_key}&country={country}&year={year}&day={day},month={month},location={location}",
    headers: <String, String>{"Content-Type": "application/json"},
  )
  Future<Response<dynamic>> getSpecificHolidaysByLocation(
    @Path('api_key') String apiKey,
    @Path('country') String countryCode,
    @Path('year') String year,
    @Path('day') int day,
    @Path('month') int month,
    @Path('location') String location,
  );

  @Get(
    path:
        "/holidays?api_key={api_key}&country={country}&year={year}&month={month}",
    headers: <String, String>{"Content-Type": "application/json"},
  )
  Future<Response<dynamic>> getHolidaysFromMonth(
    @Path('api_key') String apiKey,
    @Path('country') String countryCode,
    @Path('year') String year,
    @Path('month') int month,
  );

  @Get(
    path:
        "/holidays?api_key={api_key}&country={country}&year={year}&month={month},location={location}",
    headers: <String, String>{"Content-Type": "application/json"},
  )
  Future<Response<dynamic>> getHolidaysFromMonthByLocation(
    @Path('api_key') String apiKey,
    @Path('country') String countryCode,
    @Path('year') String year,
    @Path('month') int month,
    @Path('location') String location,
  );

  @Get(
    path: "/languages?api_key={api_key}",
    headers: <String, String>{"Content-Type": "application/json"},
  )
  Future<Response<dynamic>> getLanguages(
    @Path('api_key') String apiKey,
  );

  @Get(
    path: "/countries?api_key={api_key}",
    headers: <String, String>{"Content-Type": "application/json"},
  )
  Future<Response<dynamic>> getCountries(
    @Path('api_key') String apiKey,
  );
}
