import 'dart:convert';
import 'dart:io';

import 'package:weather_app/domain/entities/daily_weather_forecast.dart';
import 'package:weather_app/domain/entities/main_weather_data.dart';

/*
Данные о погоде приходит из API "OpenWeatherMap".
API клиент `WeatherApiClient` для работы с API.

Weather data comes from "OpenWeatherMap" API.
API client `WeatherApiClient` to work with API.
 */
abstract class WeatherApiClient {
  static final _apiKey = 'beb696a7d29235e2bf719335edb5fb06';

  static final client = HttpClient();

  // Получение текущей погоды в городе `cityName`.
  static Future<MainWeatherData> getCurrentWeather(String cityName) async {
    final url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$_apiKey&units=metric');

    final json = (await _getJsonFromUrl(url)) as Map<String, dynamic>;

    return MainWeatherData.fromJson(json);
  }

  // Получение почасовой погоды в городе `cityName`.
  static Future<List<MainWeatherData>> getHourlyWeather(String cityName) async {
    final url = Uri.parse(
        'https://pro.openweathermap.org/data/2.5/forecast/hourly?q=$cityName&appid=$_apiKey&units=metric');

    final json = ((await _getJsonFromUrl(url)) as Map<String, dynamic>)['list']
        as List<dynamic>;

    return json
        .map((dynamic e) => MainWeatherData.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  // Получение посуточной погоды в городе `cityName` за `daysCount` дней.
  static Future<List<DailyWeatherForecast>> getDailyWeather(
      String cityName, String daysCount) async {
    final url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/forecast/daily?q=$cityName&cnt=$daysCount&appid=$_apiKey&units=metric');

    final json = ((await _getJsonFromUrl(url)) as Map<String, dynamic>)['list']
        as List<dynamic>;

    return json
        .map((e) => DailyWeatherForecast.fromJason(e as Map<String, dynamic>))
        .toList();
  }

  static Future<dynamic> _getJsonFromUrl(Uri url) async {
    return jsonDecode((await (await (await client.getUrl(url)).close())
            .transform(utf8.decoder)
            .toList())
        .join());
  }
}
