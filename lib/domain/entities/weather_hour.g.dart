// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_hour.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherHour _$WeatherHourFromJson(Map<String, dynamic> json) => WeatherHour(
      time: json['time'] as String,
      temperature: (json['temp_c'] as num).toDouble(),
      condition: Condition.fromJson(json['condition']),
    );

Map<String, dynamic> _$WeatherHourToJson(WeatherHour instance) =>
    <String, dynamic>{
      'time': instance.time,
      'temp_c': instance.temperature,
      'condition': instance.condition,
    };
