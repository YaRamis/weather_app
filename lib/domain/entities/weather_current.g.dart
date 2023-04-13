// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_current.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherCurrent _$WeatherCurrentFromJson(Map<String, dynamic> json) =>
    WeatherCurrent(
      lastUpdated: json['last_updated'] as String,
      temperature: (json['temp_c'] as num).toDouble(),
      condition: Condition.fromJson(json['condition']),
      windSpeed: (json['wind_kph'] as num).toDouble(),
      humidity: json['humidity'] as int,
    );

Map<String, dynamic> _$WeatherCurrentToJson(WeatherCurrent instance) =>
    <String, dynamic>{
      'last_updated': instance.lastUpdated,
      'temp_c': instance.temperature,
      'condition': instance.condition,
      'wind_kph': instance.windSpeed,
      'humidity': instance.humidity,
    };
