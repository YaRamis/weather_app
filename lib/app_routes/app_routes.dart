import 'package:flutter/material.dart';

import '../widgets/app.dart';
import '../widgets/errors/app_error_widget.dart';

/*
Route-ы экранов приложения.

Routes of app screens.
 */
abstract class AppRoutes {
  static String setCityScreen = '/set_city_screen';
  static String weatherDetailedInfoScreen = '/weather_detailed_info_screen';
  static String threeDaysWeatherScreen =
      '/weather_detailed_info_screen/three_days_weather_screen';

  static Map<String, WidgetBuilder> routes = {
    setCityScreen: (context) => const SetCityScreen(),
    weatherDetailedInfoScreen: (context) => const WeatherDetailedInfoScreen(),
    threeDaysWeatherScreen: (context) => const ThreeDaysWeatherScreenWidget(),
  };
}
