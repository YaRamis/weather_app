import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/app_routes/app_routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/weather_bloc/weather_bloc.dart';
import 'package:weather_app/widgets/app_circular_progress_indicator/app_circular_progress_indicator.dart';

import '../theme/app_box_decorations.dart';
import '../theme/app_button_styles.dart';
import '../theme/app_input_decorations.dart';
import 'app_icon_widgets/app_icon_widgets.dart';

part 'set_city_screen/set_city_screen_widget.dart';
part 'three_days_weather_screen/three_days_weather_screen_widget.dart';
part 'weather_detailed_info_screen/weather_detailed_info_widget.dart';
part 'weather_detailed_info_screen/exact_hour_weather_widget.dart';
part 'weather_detailed_info_screen/current_weather_widget.dart';

// Название города
String _cityName = '';
// Ключ для shared_preference
const _cityNameKey = 'cityNameKey';

// Установка занчения в shared_preference по ключу `_cityNameKey`
Future _setCityName() async {
  var prefs = await SharedPreferences.getInstance();
  prefs.setString(_cityNameKey, _cityName);
}

// Получение занчения из shared_preference по ключу `_cityNameKey`
Future<String> _getCityName() async {
  var prefs = await SharedPreferences.getInstance();
  return prefs.getString(_cityNameKey) ?? '';
}

// Удаление занчения в shared_preference по ключу `_cityNameKey`
Future _removeCityName() async {
  var prefs = await SharedPreferences.getInstance();
  await prefs.remove(_cityNameKey);
}

final weatherBloc = WeatherBloc();

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int iteration = 0;
  @override
  void initState() {
    super.initState();
    _initCityName();
  }

  Future _initCityName() async {
    _cityName = await _getCityName();
    setState(() {});
  }

  String _getRouteSavedCity() {
    weatherBloc.add(GetWeatherEvent(cityName: _cityName));
    return AppRoutes.weatherDetailedInfoScreen;
  }

  @override
  Widget build(BuildContext context) {
    iteration++;
    // Проверка на количество итераций `build`
    // Так как в первой итерации `_cityName` всегда пустая строка
    if (iteration > 1) {
      return BlocProvider(
        create: (context) => weatherBloc,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Weather App',
          theme: ThemeData(
            fontFamily: 'Comfortaa',
            appBarTheme: AppBarTheme(backgroundColor: Colors.teal.shade800),
            scaffoldBackgroundColor: Colors.teal,
            dividerColor: Colors.white,
          ),
          routes: AppRoutes.routes,
          // Проверка значения `_cityName`
          // Если строка пустая, то переходим на экран установки города
          // Иначе - перехадим на экран с информацией текущего города
          initialRoute:
              _cityName == '' ? AppRoutes.setCityScreen : _getRouteSavedCity(),
        ),
      );
    } else {
      return const AppCircularProgressIndicator();
    }
  }
}
