import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/domain/entities/weather.dart';
import 'package:weather_app/domain/entities/main_wind.dart';

part 'main_weather_data.g.dart';

/*
Преобразование из json в объект MainWeatherData.
 */
@JsonSerializable()
class MainWeatherData {
  final Weather weather;
  final MainWind wind;
  @JsonKey(name: 'dt')
  final int timestamp;

  MainWeatherData({
    required this.weather,
    required this.wind,
    required this.timestamp,
  });

  factory MainWeatherData.fromJson(Map<String, dynamic> json) =>
      _$MainWeatherDataFromJson(json);
}
