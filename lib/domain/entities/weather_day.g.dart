// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_day.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherDay _$WeatherDayFromJson(Map<String, dynamic> json) => WeatherDay(
      maxTemperature: (json['maxtemp_c'] as num).toDouble(),
      minTemperature: (json['mintemp_c'] as num).toDouble(),
      avgTemperature: (json['avgtemp_c'] as num).toDouble(),
      avgHumidity: (json['avghumidity'] as num).toDouble(),
      condition: Condition.fromJson(json['condition']),
    );

Map<String, dynamic> _$WeatherDayToJson(WeatherDay instance) =>
    <String, dynamic>{
      'maxtemp_c': instance.maxTemperature,
      'mintemp_c': instance.minTemperature,
      'avgtemp_c': instance.avgTemperature,
      'avghumidity': instance.avgHumidity,
      'condition': instance.condition,
    };
