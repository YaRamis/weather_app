part of '../app.dart';

// Виджет отображения данных о текущей погоды
class _CurrentWeatherWidget extends StatelessWidget {
  final WeatherLoadedState state;
  const _CurrentWeatherWidget({required this.state});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 450,
      child: DecoratedBox(
        decoration: AppBoxDecorations.currentWeatherBoxDecoration,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _CurrentWeatherLastUpdatedDateTimeText(state: state),
            const SizedBox(height: 20),
            _CurrentWeatherImage(state: state),
            const SizedBox(width: 10),
            _CurrentWeatherTemperatureText(state: state),
            _CurrentWeatherMinMaxTemperatureText(state: state),
            const SizedBox(height: 5),
            _CurrentWeatherDesciptionText(state: state),
            const SizedBox(height: 80),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Row(
                children: [
                  AppIconWidgets.humidityIcon,
                  const SizedBox(width: 10),
                  const Text(
                    'Humidity',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  const Spacer(),
                  _CurrentWeatherHumidityPercentText(state: state),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 75, right: 45),
              child: Divider(thickness: 1, height: 20),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Row(
                children: [
                  AppIconWidgets.windSpeedIcon,
                  const SizedBox(width: 10),
                  const Text(
                    'Wind speed',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  const Spacer(),
                  _CurrentWeatherWindSpeedText(state: state)
                ],
              ),
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}

class _CurrentWeatherWindSpeedText extends StatelessWidget {
  const _CurrentWeatherWindSpeedText({
    required this.state,
  });

  final WeatherLoadedState state;

  @override
  Widget build(BuildContext context) {
    return Text(
      '${state.weatherForecast.current.windSpeed} k/h',
      style: const TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
    );
  }
}

class _CurrentWeatherHumidityPercentText extends StatelessWidget {
  const _CurrentWeatherHumidityPercentText({
    required this.state,
  });

  final WeatherLoadedState state;

  @override
  Widget build(BuildContext context) {
    return Text(
      '${state.weatherForecast.current.humidity} %',
      style: const TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
    );
  }
}

class _CurrentWeatherDesciptionText extends StatelessWidget {
  const _CurrentWeatherDesciptionText({
    required this.state,
  });

  final WeatherLoadedState state;

  @override
  Widget build(BuildContext context) {
    return Text(
      state.weatherForecast.current.condition.text,
      style: const TextStyle(
          color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
    );
  }
}

class _CurrentWeatherMinMaxTemperatureText extends StatelessWidget {
  const _CurrentWeatherMinMaxTemperatureText({
    required this.state,
  });

  final WeatherLoadedState state;

  @override
  Widget build(BuildContext context) {
    return Text(
      '${state.weatherForecast.forecast.forecastDay[0].day.maxTemperature}° / ${state.weatherForecast.forecast.forecastDay[0].day.minTemperature}°',
      style: const TextStyle(color: Colors.white, fontSize: 20),
    );
  }
}

class _CurrentWeatherTemperatureText extends StatelessWidget {
  const _CurrentWeatherTemperatureText({
    required this.state,
  });

  final WeatherLoadedState state;

  @override
  Widget build(BuildContext context) {
    return Text(
      '${state.weatherForecast.current.temperature}°',
      style: const TextStyle(
          fontSize: 100, color: Colors.white, fontWeight: FontWeight.bold),
    );
  }
}

class _CurrentWeatherImage extends StatelessWidget {
  const _CurrentWeatherImage({
    required this.state,
  });

  final WeatherLoadedState state;

  @override
  Widget build(BuildContext context) {
    return Image(
      image:
          NetworkImage('http:${state.weatherForecast.current.condition.icon}'),
    );
  }
}

class _CurrentWeatherLastUpdatedDateTimeText extends StatelessWidget {
  const _CurrentWeatherLastUpdatedDateTimeText({
    required this.state,
  });

  final WeatherLoadedState state;

  @override
  Widget build(BuildContext context) {
    return Text(
      state.weatherForecast.current.lastUpdated,
      style: const TextStyle(color: Colors.white, fontSize: 20),
    );
  }
}
