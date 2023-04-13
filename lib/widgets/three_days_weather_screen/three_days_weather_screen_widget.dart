// import 'package:flutter/material.dart';

part of '../app.dart';

/*
Виджет экрана со списком из 3 элементов: информация о погоде за 3 дня,
где самый первый элемент с самой низкой температурой.

Widget of screen with 3 elements: weather information in 3 days.
First element has lowest temperature.
 */
class ThreeDaysWeatherScreenWidget extends StatelessWidget {
  const ThreeDaysWeatherScreenWidget({Key? key}) : super(key: key);

  List<_ExactDayWeatherWidget> _getExactDayWeatherWidgetList() {
    List<_ExactDayWeatherWidget> list = [];

    for (int i = 0; i < 3; i++) {
      list.add(_ExactDayWeatherWidget(i));
    }

    return list;
  }

  @override
  Widget build(BuildContext context) {
    final exactDayWeatherWidgetList = _getExactDayWeatherWidgetList();
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        title: Text(
          'Weather next 3 days ($_cityName)',
          style: const TextStyle(fontSize: 18),
        ),
      ),
      backgroundColor: Colors.teal.shade800,
      body: Column(
        children: exactDayWeatherWidgetList,
      ),
    );
  }
}

class _ExactDayWeatherWidget extends StatelessWidget {
  final int index;
  // late final double temperature;

  const _ExactDayWeatherWidget(this.index);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      child: Container(
        width: 400,
        height: 210,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.teal,
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: BlocBuilder<WeatherBloc, WeatherState>(
            bloc: weatherBloc,
            builder: (context, state) {
              final localState = state as WeatherLoadedState;
              return Column(
                children: [
                  Text(
                    localState.weatherForecast.forecast.forecastDay[index].date,
                    style: const TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: NetworkImage(
                            'http:${localState.weatherForecast.forecast.forecastDay[index].day.condition.icon}'),
                      ),
                      const SizedBox(width: 20),
                      Text(
                        '${localState.weatherForecast.forecast.forecastDay[index].day.avgTemperature}°',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Text(
                    localState.weatherForecast.forecast.forecastDay[index].day
                        .condition.text,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 19),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.water_drop_rounded,
                        size: 15,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        'Humidity',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        '${localState.weatherForecast.forecast.forecastDay[index].day.avgHumidity} %',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      )
                    ],
                  ),
                  // const Text(
                  //   'Humidity 70%',
                  //   style: TextStyle(color: Colors.white, fontSize: 15),
                  // ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
