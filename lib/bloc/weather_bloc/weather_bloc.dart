import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/domain/api_clients/weather_api_client.dart';
import 'package:weather_app/domain/entities/weather_forecast.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<GetWeatherEvent>(_onGetWeather);
  }

  WeatherForecast _setDayMinTemperatureAtFirst(
      WeatherForecast weatherForecast) {
    var index = 0;
    if (weatherForecast.forecast.forecastDay[index].day.avgTemperature >
        weatherForecast.forecast.forecastDay[1].day.avgTemperature) {
      index = 1;
    }
    if (weatherForecast.forecast.forecastDay[index].day.avgTemperature >
        weatherForecast.forecast.forecastDay[2].day.avgTemperature) {
      index = 2;
    }

    weatherForecast.forecast.forecastDay
        .insert(0, weatherForecast.forecast.forecastDay[index]);
    weatherForecast.forecast.forecastDay.removeAt(index + 1);

    return weatherForecast;
  }

  _onGetWeather(GetWeatherEvent event, Emitter<WeatherState> emit) async {
    emit(WeatherLoadingState());

    try {
      final WeatherForecast weatherForecast = _setDayMinTemperatureAtFirst(
          await WeatherApiClient.getWeatherForecast(event.cityName));

      emit(WeatherLoadedState(weatherForecast: weatherForecast));
    } catch (error) {
      print(error);
      emit(WeatherErrorState());
    }
  }
}
