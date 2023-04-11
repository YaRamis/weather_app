// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_weather_forecast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DailyWeatherForecast _$DailyWeatherForecastFromJson(
        Map<String, dynamic> json) =>
    DailyWeatherForecast(
      temperature: DailyTemperature.fromJson(
          json['temperature'] as Map<String, dynamic>),
      timestamp: json['dt'] as int,
      weather: Weather.fromJson(json['weather'] as Map<String, dynamic>),
      humidity: json['humidity'] as int,
    );

Map<String, dynamic> _$DailyWeatherForecastToJson(
        DailyWeatherForecast instance) =>
    <String, dynamic>{
      'dt': instance.timestamp,
      'temperature': instance.temperature,
      'weather': instance.weather,
      'humidity': instance.humidity,
    };
