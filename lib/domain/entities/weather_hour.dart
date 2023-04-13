import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/domain/entities/condition.dart';

part 'weather_hour.g.dart';

@JsonSerializable()
class WeatherHour {
  final String time;
  @JsonKey(name: 'temp_c')
  final double temperature;
  final Condition condition;

  WeatherHour({
    required this.time,
    required this.temperature,
    required this.condition,
  });

  factory WeatherHour.fromJson(json) => _$WeatherHourFromJson(json);
}
