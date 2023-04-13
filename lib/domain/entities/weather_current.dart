import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/domain/entities/condition.dart';

part 'weather_current.g.dart';

@JsonSerializable()
class WeatherCurrent {
  @JsonKey(name: 'last_updated')
  final String lastUpdated;
  @JsonKey(name: 'temp_c')
  final double temperature;
  final Condition condition;
  @JsonKey(name: 'wind_kph')
  final double windSpeed;
  final int humidity;

  WeatherCurrent({
    required this.lastUpdated,
    required this.temperature,
    required this.condition,
    required this.windSpeed,
    required this.humidity,
  });

  factory WeatherCurrent.fromJson(json) => _$WeatherCurrentFromJson(json);
}
