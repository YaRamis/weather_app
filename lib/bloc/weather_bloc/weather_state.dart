part of 'weather_bloc.dart';

@immutable
abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  final WeatherForecast weatherForecast;

  WeatherLoadedState({
    required this.weatherForecast,
  });
}

class WeatherLoadingState extends WeatherState {}

class WeatherErrorState extends WeatherState {}
