import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/domain/entities/weather.dart';

import 'daily_temperature.dart';

part 'daily_weather_forecast.g.dart';

/*
Преобразование из json в объект DailyWeatherForecast.
 */
@JsonSerializable()
class DailyWeatherForecast {
  @JsonKey(name: 'dt')
  final int timestamp;
  final DailyTemperature temperature;
  final Weather weather;
  final int humidity;

  DailyWeatherForecast({
    required this.temperature,
    required this.timestamp,
    required this.weather,
    required this.humidity,
  });

  factory DailyWeatherForecast.fromJason(Map<String, dynamic> json) =>
      _$DailyWeatherForecastFromJson(json);
}
