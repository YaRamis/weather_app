// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_temperature.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MainTemperature _$MainTemperatureFromJson(Map<String, dynamic> json) =>
    MainTemperature(
      temperature: (json['temp'] as num).toDouble(),
      temperatureMin: (json['temp_min'] as num).toDouble(),
      temperatureMax: (json['temp_max'] as num).toDouble(),
      humidity: json['humidity'] as int,
    );

Map<String, dynamic> _$MainTemperatureToJson(MainTemperature instance) =>
    <String, dynamic>{
      'temp': instance.temperature,
      'temp_min': instance.temperatureMin,
      'temp_max': instance.temperatureMax,
      'humidity': instance.humidity,
    };
