import 'package:flutter/material.dart';
import 'package:weather_app/app_routes/app_routes.dart';

class WeatherDetailedInfoScreen extends StatelessWidget {
  final cityName = 'Moscow';

  const WeatherDetailedInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(cityName),
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
                        style: TextStyle(fontSize: 100, color: Colors.white),
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
          )
        ],
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
