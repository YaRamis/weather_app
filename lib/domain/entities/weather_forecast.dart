import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/domain/entities/weather_current.dart';
import 'package:weather_app/domain/entities/weather_daily.dart';
import 'package:weather_app/domain/entities/weather_location.dart';

part 'weather_forecast.g.dart';

@JsonSerializable()
class WeatherForecast {
  final WeatherLocation location;
  final WeatherCurrent current;
  final WeatherDaily forecast;

  WeatherForecast({
    required this.location,
    required this.current,
    required this.forecast,
  });

  factory WeatherForecast.fromJson(json) => _$WeatherForecastFromJson(json);
}
