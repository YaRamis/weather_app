// import 'package:flutter/material.dart';
// import 'package:weather_app/app_routes/app_routes.dart';

part of '../app.dart';

class WeatherDetailedInfoScreen extends StatelessWidget {
  const WeatherDetailedInfoScreen({Key? key}) : super(key: key);

  List<_ExactHourWeatherWidget> _getExactHourWeatherWidgetList() {
    List<_ExactHourWeatherWidget> list = [];

    for (int i = 0; i < 6; i++) {
      list.add(_ExactHourWeatherWidget(i * 4));
    }

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
        bloc: weatherBloc,
        builder: (context, state) {
          final exactHourWeatherWidgetList = _getExactHourWeatherWidgetList();
          if (state is WeatherLoadedState) {
            _cityName = state.weatherForecast.location.cityName;
            _setCityName();
            return Scaffold(
              appBar: AppBar(
                title: Text(
                  _cityName,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                shadowColor: Colors.transparent,
                actions: const [
                  // _UpdateWeatherDataIconButton(),
                  _ResetCityIconButton(),
                  _ShowThreeDaysWeatherIconButton(),
                ],
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 450,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(50),
                            bottomRight: Radius.circular(50),
                          ),
                          color: Colors.teal.shade800,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              state.weatherForecast.current.lastUpdated,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 20),
                            ),
                            const SizedBox(height: 20),
                            Image(
                              image: NetworkImage(
                                  'http:${state.weatherForecast.current.condition.icon}'),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              '${state.weatherForecast.current.temperature}°',
                              style: const TextStyle(
                                  fontSize: 100,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '${state.weatherForecast.forecast.forecastDay[0].day.maxTemperature}° / ${state.weatherForecast.forecast.forecastDay[0].day.minTemperature}°',
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 20),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              state.weatherForecast.current.condition.text,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 80),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 50),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.water_drop_rounded,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(width: 10),
                                  const Text(
                                    'Humidity',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    '${state.weatherForecast.current.humidity} %',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 75, right: 45),
                              child: Divider(thickness: 1, height: 20),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 50),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.waves_rounded,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(width: 10),
                                  const Text(
                                    'Wind speed',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    '${state.weatherForecast.current.windSpeed} k/h',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(height: 15),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      'Hourly',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: exactHourWeatherWidgetList,
                    )
                  ],
                ),
              ),
            );
          } else if (state is WeatherLoadingState) {
            return const AppCircularProgressIndicator();
          } else if (state is WeatherErrorState) {
            return const AppErrorWidget();
          } else {
            return ColoredBox(color: Colors.teal.shade800);
          }
        });
  }
}

class _ExactHourWeatherWidget extends StatelessWidget {
  final int index;

  const _ExactHourWeatherWidget(this.index);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      bloc: weatherBloc,
      builder: (context, state) {
        final localState = state as WeatherLoadedState;
        return Padding(
          padding: const EdgeInsets.all(6.0),
          child: SizedBox(
            height: 150,
            width: 50,
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(50),
                ),
                color: Colors.teal.shade800,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    localState.weatherForecast.forecast.forecastDay[0]
                        .hour[index].time
                        .split(' ')[1],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Image(
                      image: NetworkImage(
                          'http:${localState.weatherForecast.forecast.forecastDay[0].hour[index].condition.icon}')),
                  const SizedBox(height: 10),
                  Text(
                    '${localState.weatherForecast.forecast.forecastDay[0].hour[index].temperature}°',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _ShowThreeDaysWeatherIconButton extends StatelessWidget {
  const _ShowThreeDaysWeatherIconButton();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.of(context).pushNamed(AppRoutes.threeDaysWeatherScreen);
      },
      icon: const Icon(Icons.view_day_rounded),
    );
  }
}

class _ResetCityIconButton extends StatelessWidget {
  const _ResetCityIconButton();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        _cityName = '';
        _removeCityName();
        Navigator.of(context).pushReplacementNamed(AppRoutes.setCityScreen);
      },
      icon: const Icon(Icons.location_city_rounded),
    );
  }
}

class _UpdateWeatherDataIconButton extends StatelessWidget {
  const _UpdateWeatherDataIconButton();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: const Icon(Icons.restart_alt_rounded),
    );
  }
}
