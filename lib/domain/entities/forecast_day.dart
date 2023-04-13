import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/domain/entities/weather_day.dart';
import 'package:weather_app/domain/entities/weather_hour.dart';

part 'forecast_day.g.dart';

@JsonSerializable()
class ForecastDay {
  final String date;
  final WeatherDay day;
  final List<WeatherHour> hour;

  ForecastDay({
    required this.date,
    required this.day,
    required this.hour,
  });

  factory ForecastDay.fromJson(json) => _$ForecastDayFromJson(json);
}
