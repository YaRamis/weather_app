// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_daily.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherDaily _$WeatherDailyFromJson(Map<String, dynamic> json) => WeatherDaily(
      forecastDay: (json['forecastday'] as List<dynamic>)
          .map((e) => ForecastDay.fromJson(e))
          .toList(),
    );

Map<String, dynamic> _$WeatherDailyToJson(WeatherDaily instance) =>
    <String, dynamic>{
      'forecastday': instance.forecastDay,
    };
