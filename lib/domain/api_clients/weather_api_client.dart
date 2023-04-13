import 'dart:convert';
import 'dart:io';

import 'package:weather_app/domain/entities/weather_forecast.dart';

/*
Данные о погоде приходит из API "Weather API".
API клиент `WeatherApiClient` для работы с API.

Weather data comes from "Weather API" API.
API client `WeatherApiClient` to work with API.
 */
abstract class WeatherApiClient {
  static final client = HttpClient();

  // Получение прогноза погоды в городе `cityName`.
  static Future<WeatherForecast> getWeatherForecast(String cityName) async {
    final url = Uri.parse(
        'http://api.weatherapi.com/v1/forecast.json?key=029093e789a347629c1182642231204&q=$cityName&days=3&aqi=no&alerts=no');

    final json = (await _getJsonFromUrl(url)) as Map<String, dynamic>;

    return WeatherForecast.fromJson(json);
  }

  static Future<dynamic> _getJsonFromUrl(Uri url) async {
    return jsonDecode((await (await (await client.getUrl(url)).close())
            .transform(utf8.decoder)
            .toList())
        .join());
  }
}
