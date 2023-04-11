import 'package:json_annotation/json_annotation.dart';

part 'weather.g.dart';

/*
Класс Weather содержит данные об описании погоды.
Преобразование из json в объект Weather.

Class Weather contains data of weather description.
Making Weather object from json.
 */
@JsonSerializable()
class Weather {
  @JsonKey(name: 'main')
  final String description;
  @JsonKey(name: 'icon')
  final String iconCode;

  Weather({
    required this.description,
    required this.iconCode,
  });

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);
}
