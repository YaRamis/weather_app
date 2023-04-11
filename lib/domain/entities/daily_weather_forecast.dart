import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/domain/entities/weather.dart';

import 'daily_temperature.dart';

part 'daily_weather_forecast.g.dart';

/*
Класс DailyWeatherForecast содержит данные суточной погоды.
Преобразование из json в объект DailyWeatherForecast.

Class DailyWeatherForecast contains data of daily weather.
Making DailyWeatherForecast object from json.
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
