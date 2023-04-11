// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_weather_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MainWeatherData _$MainWeatherDataFromJson(Map<String, dynamic> json) =>
    MainWeatherData(
      weather: Weather.fromJson(json['weather'] as Map<String, dynamic>),
      wind: MainWind.fromJson(json['wind'] as Map<String, dynamic>),
      timestamp: json['dt'] as int,
    );

Map<String, dynamic> _$MainWeatherDataToJson(MainWeatherData instance) =>
    <String, dynamic>{
      'weather': instance.weather,
      'wind': instance.wind,
      'dt': instance.timestamp,
    };
