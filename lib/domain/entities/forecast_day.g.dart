// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_day.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForecastDay _$ForecastDayFromJson(Map<String, dynamic> json) => ForecastDay(
      date: json['date'] as String,
      day: WeatherDay.fromJson(json['day']),
      hour: (json['hour'] as List<dynamic>)
          .map((e) => WeatherHour.fromJson(e))
          .toList(),
    );

Map<String, dynamic> _$ForecastDayToJson(ForecastDay instance) =>
    <String, dynamic>{
      'date': instance.date,
      'day': instance.day,
      'hour': instance.hour,
    };
