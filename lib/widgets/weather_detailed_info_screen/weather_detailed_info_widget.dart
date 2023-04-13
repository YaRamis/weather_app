part of '../app.dart';

// Виджет экрана с информацией о текущей погоды и почасовой погоды текущего дня
class WeatherDetailedInfoScreen extends StatelessWidget {
  const WeatherDetailedInfoScreen({Key? key}) : super(key: key);

  // Метод для получения списка виджетов почасовой погоды из 6 элементов
  List<_ExactHourWeatherWidget> _getExactHourWeatherWidgetList(
      {required WeatherLoadedState state}) {
    List<_ExactHourWeatherWidget> list = [];

    for (int i = 0; i < 6; i++) {
      list.add(_ExactHourWeatherWidget(index: i * 4, state: state));
    }

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
        bloc: weatherBloc,
        builder: (context, state) {
          if (state is WeatherLoadedState) {
            final exactHourWeatherWidgetList =
                _getExactHourWeatherWidgetList(state: state);
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
                  _UpdateWeatherDataIconButton(),
                  _ResetCityIconButton(),
                  _ShowThreeDaysWeatherIconButton(),
                ],
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    _CurrentWeatherWidget(state: state),
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
                    _HourlyWeatherWidget(
                        exactHourWeatherWidgetList: exactHourWeatherWidgetList,
                        state: state)
                  ],
                ),
              ),
            );
          } else if (state is WeatherLoadingState) {
            return const AppCircularProgressIndicator();
          } else if (state is WeatherErrorState) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.of(context)
                  .pushReplacementNamed(AppRoutes.setCityScreen);
            });
            // return const AppErrorWidget();
            return ColoredBox(color: Colors.teal.shade800);
          } else {
            return ColoredBox(color: Colors.teal.shade800);
          }
        });
  }
}

class _HourlyWeatherWidget extends StatelessWidget {
  final WeatherLoadedState state;
  const _HourlyWeatherWidget({
    required this.exactHourWeatherWidgetList,
    required this.state,
  });

  final List<_ExactHourWeatherWidget> exactHourWeatherWidgetList;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: exactHourWeatherWidgetList,
    );
  }
}

// IconButton для просмотра погоды на следующие 3 дня
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

// IconButton для установки нового города
class _ResetCityIconButton extends StatelessWidget {
  const _ResetCityIconButton();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        weatherBloc.emit(WeatherInitial());
        _cityName = '';
        _removeCityName();
        Navigator.of(context).pushReplacementNamed(AppRoutes.setCityScreen);
      },
      icon: const Icon(Icons.location_city_rounded),
    );
  }
}

// IconButton для обновления данных о погоде
class _UpdateWeatherDataIconButton extends StatelessWidget {
  const _UpdateWeatherDataIconButton();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        weatherBloc.add(GetWeatherEvent(cityName: _cityName));
      },
      icon: const Icon(Icons.restart_alt_rounded),
    );
  }
}
