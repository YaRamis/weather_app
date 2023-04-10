import 'package:flutter/material.dart';
import 'package:weather_app/app_routes/app_routes.dart';

class WeatherDetailedInfoScreen extends StatelessWidget {
  const WeatherDetailedInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Россия, Москва'),
        shadowColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context)
                  .pushReplacementNamed(AppRoutes.setCityScreen);
            },
            icon: const Icon(Icons.location_city),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.threeDaysWeatherScreen);
            },
            icon: const Icon(Icons.view_day),
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.teal.shade800,
              Colors.teal.shade700,
              Colors.teal.shade600,
              Colors.teal,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.1, 0.4, 0.6, 0.8],
          ),
        ),
        child: Column(
          children: const [
            Text(
              '12',
              style: TextStyle(color: Colors.white),
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Divider(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
