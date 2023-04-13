import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/domain/entities/condition.dart';

part 'weather_day.g.dart';

@JsonSerializable()
class WeatherDay {
  @JsonKey(name: 'maxtemp_c')
  final double maxTemperature;
  @JsonKey(name: 'mintemp_c')
  final double minTemperature;
  @JsonKey(name: 'avgtemp_c')
  final double avgTemperature;
  @JsonKey(name: 'avghumidity')
  final double avgHumidity;
  final Condition condition;

  WeatherDay({
    required this.maxTemperature,
    required this.minTemperature,
    required this.avgTemperature,
    required this.avgHumidity,
    required this.condition,
  });

  factory WeatherDay.fromJson(json) => _$WeatherDayFromJson(json);
}
