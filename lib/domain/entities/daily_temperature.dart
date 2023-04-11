import 'package:json_annotation/json_annotation.dart';

part 'daily_temperature.g.dart';

/*
Класс DailyTemperature.
Преобразование из json в объект DailyTemperature.
 */
@JsonSerializable()
class DailyTemperature {
  final double min;
  final double max;

  DailyTemperature({
    required this.min,
    required this.max,
  });

  factory DailyTemperature.fromJson(Map<String, dynamic> json) =>
      _$DailyTemperatureFromJson(json);
}
