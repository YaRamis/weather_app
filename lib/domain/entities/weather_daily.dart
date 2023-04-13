import 'package:json_annotation/json_annotation.dart';

import 'forecast_day.dart';

part 'weather_daily.g.dart';

@JsonSerializable()
class WeatherDaily {
  @JsonKey(name: 'forecastday')
  final List<ForecastDay> forecastDay;

  WeatherDaily({
    required this.forecastDay,
  });

  factory WeatherDaily.fromJson(json) => _$WeatherDailyFromJson(json);
}
