import 'package:flutter/material.dart';
import 'package:weather_app/app_routes/app_routes.dart';

class WeatherDetailedInfoScreen extends StatelessWidget {
  final cityName = 'Moscow';

  const WeatherDetailedInfoScreen({Key? key}) : super(key: key);

  List<_ExactHourWeatherWidget> _getExactHourWeatherWidgetList(
      {int count = 6}) {
    List<_ExactHourWeatherWidget> list = [];

    for (int i = 0; i < count; i++) {
      list.add(const _ExactHourWeatherWidget(
        hour: 12,
        temperature: 20,
      ));
    }

    return list;
  }

  @override
  Widget build(BuildContext context) {
    final exactHourWeatherWidgetList = _getExactHourWeatherWidgetList();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          cityName,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        shadowColor: Colors.transparent,
        actions: const [
          _ResetCityIconButton(),
          _ShowThreeDaysWeatherIconButton(),
        ],
      ),
      body: Column(
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
                  const Text(
                    'Sat, 12.04.2023 1:58',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  const SizedBox(height: 80),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.wb_sunny_rounded,
                        size: 100,
                        color: Colors.white,
                      ),
                      SizedBox(width: 10),
                      Text(
                        '25°',
                        style: TextStyle(
                            fontSize: 100,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const Text(
                    '30° / 20°',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'Weather description',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 80),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.water_drop_rounded,
                          size: 20,
                          color: Colors.white,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Humidity',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        Spacer(),
                        Text(
                          '70 %',
                          style: TextStyle(
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
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.waves_rounded,
                          size: 20,
                          color: Colors.white,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Wind speed',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        Spacer(),
                        Text(
                          '10 m/s',
                          style: TextStyle(
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
    );
  }
}

class _ExactHourWeatherWidget extends StatelessWidget {
  final int hour;
  final int temperature;

  const _ExactHourWeatherWidget({
    required this.hour,
    required this.temperature,
  });

  @override
  Widget build(BuildContext context) {
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
                '$hour:00',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 20),
              const Icon(
                Icons.wb_sunny_rounded,
                color: Colors.white,
                size: 30,
              ),
              const SizedBox(height: 20),
              Text(
                '$temperature°',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
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
        Navigator.of(context).pushReplacementNamed(AppRoutes.setCityScreen);
      },
      icon: const Icon(Icons.location_city_rounded),
    );
  }
}
