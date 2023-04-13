part of '../app.dart';

/*
Виджет экрана со списком из 3 элементов: информация о погоде за 3 дня,
где самый первый элемент с самой низкой температурой.

Widget of screen with 3 elements: weather information in 3 days.
First element has lowest temperature.
 */
class ThreeDaysWeatherScreenWidget extends StatelessWidget {
  const ThreeDaysWeatherScreenWidget({Key? key}) : super(key: key);

  // Метод для получения списка виджетов погоды на следующие 3 дня
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

// Виджет отображения данных о погоде в день
class _ExactDayWeatherWidget extends StatelessWidget {
  final int index;

  const _ExactDayWeatherWidget(this.index);

  @override
  Widget build(BuildContext context) {
    final state = weatherBloc.state as WeatherLoadedState;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      child: Container(
        width: 400,
        height: 210,
        padding: const EdgeInsets.all(20.0),
        decoration: AppBoxDecorations.defaultLightBoxDecoration,
        child: Column(
          children: [
            _ExactDayWeatherDateText(state: state, index: index),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _ExactDayWeatherImage(state: state, index: index),
                const SizedBox(width: 20),
                _ExactDayWeatherTemperatureText(state: state, index: index),
              ],
            ),
            const SizedBox(height: 5),
            _ExactDayWeatherDescriptionText(state: state, index: index),
            const SizedBox(height: 19),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppIconWidgets.humiditySmallIcon,
                const SizedBox(width: 10),
                const Text(
                  'Humidity',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(width: 5),
                _ExactDayWeatherHumidityPercentText(state: state, index: index)
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ExactDayWeatherHumidityPercentText extends StatelessWidget {
  const _ExactDayWeatherHumidityPercentText({
    super.key,
    required this.state,
    required this.index,
  });

  final WeatherLoadedState state;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Text(
      '${state.weatherForecast.forecast.forecastDay[index].day.avgHumidity} %',
      style: const TextStyle(
        color: Colors.white,
        fontSize: 15,
      ),
    );
  }
}

class _ExactDayWeatherDescriptionText extends StatelessWidget {
  const _ExactDayWeatherDescriptionText({
    super.key,
    required this.state,
    required this.index,
  });

  final WeatherLoadedState state;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Text(
      state.weatherForecast.forecast.forecastDay[index].day.condition.text,
      style: const TextStyle(
          color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
    );
  }
}

class _ExactDayWeatherTemperatureText extends StatelessWidget {
  const _ExactDayWeatherTemperatureText({
    super.key,
    required this.state,
    required this.index,
  });

  final WeatherLoadedState state;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Text(
      '${state.weatherForecast.forecast.forecastDay[index].day.avgTemperature}°',
      style: const TextStyle(
        color: Colors.white,
        fontSize: 40,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class _ExactDayWeatherImage extends StatelessWidget {
  const _ExactDayWeatherImage({
    super.key,
    required this.state,
    required this.index,
  });

  final WeatherLoadedState state;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Image(
      image: NetworkImage(
          'http:${state.weatherForecast.forecast.forecastDay[index].day.condition.icon}'),
    );
  }
}

class _ExactDayWeatherDateText extends StatelessWidget {
  const _ExactDayWeatherDateText({
    super.key,
    required this.state,
    required this.index,
  });

  final WeatherLoadedState state;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Text(
      state.weatherForecast.forecast.forecastDay[index].date,
      style: const TextStyle(color: Colors.white, fontSize: 15),
    );
  }
}
