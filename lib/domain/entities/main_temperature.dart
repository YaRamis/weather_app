import 'package:json_annotation/json_annotation.dart';

part 'main_temperature.g.dart';

/*
Класс `MainTemperature` содержит данные текущей/почасовой температуры.
Преобразование из json в объект `MainTemperature`.

Class `MainTemperature` contains data of current/hourly temperature.
Making `MainTemperature` object from json.
 */
@JsonSerializable()
class MainTemperature {
  @JsonKey(name: 'temp')
  final double temperature;
  @JsonKey(name: 'temp_min')
  final double temperatureMin;
  @JsonKey(name: 'temp_max')
  final double temperatureMax;
  final int humidity;

  MainTemperature({
    required this.temperature,
    required this.temperatureMin,
    required this.temperatureMax,
    required this.humidity,
  });

  factory MainTemperature.fromJson(Map<String, dynamic> json) =>
      _$MainTemperatureFromJson(json);
}
