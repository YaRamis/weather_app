import 'package:json_annotation/json_annotation.dart';

part 'weather.g.dart';

/*
Преобразование из json в объект Weather.
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
