import 'package:json_annotation/json_annotation.dart';

part 'weather_location.g.dart';

@JsonSerializable()
class WeatherLocation {
  @JsonKey(name: 'name')
  final String cityName;

  WeatherLocation({
    required this.cityName,
  });

  factory WeatherLocation.fromJson(json) => _$WeatherLocationFromJson(json);
}
