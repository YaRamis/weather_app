part of '../app.dart';

// Виджет отображения данных о погоде в определенный час дня
class _ExactHourWeatherWidget extends StatelessWidget {
  final int index;
  final WeatherLoadedState state;
  const _ExactHourWeatherWidget({
    required this.index,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: SizedBox(
        height: 150,
        width: 50,
        child: DecoratedBox(
          decoration: AppBoxDecorations.defaultDarkBoxDecoration,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _ExactHourTimeText(state: state, index: index),
              const SizedBox(height: 10),
              _ExactHourWeatherImage(state: state, index: index),
              const SizedBox(height: 10),
              _ExactHourTemperatureText(state: state, index: index),
            ],
          ),
        ),
      ),
    );
  }
}

class _ExactHourTimeText extends StatelessWidget {
  const _ExactHourTimeText({
    required this.state,
    required this.index,
  });

  final WeatherLoadedState state;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Text(
      state.weatherForecast.forecast.forecastDay[0].hour[index].time
          .split(' ')[1],
      style: const TextStyle(
        color: Colors.white,
        fontSize: 15,
      ),
    );
  }
}

class _ExactHourWeatherImage extends StatelessWidget {
  const _ExactHourWeatherImage({
    required this.state,
    required this.index,
  });

  final WeatherLoadedState state;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Image(
        image: NetworkImage(
            'http:${state.weatherForecast.forecast.forecastDay[0].hour[index].condition.icon}'));
  }
}

class _ExactHourTemperatureText extends StatelessWidget {
  const _ExactHourTemperatureText({
    required this.state,
    required this.index,
  });

  final WeatherLoadedState state;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Text(
      '${state.weatherForecast.forecast.forecastDay[0].hour[index].temperature}°',
      style: const TextStyle(
        color: Colors.white,
        fontSize: 17,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
