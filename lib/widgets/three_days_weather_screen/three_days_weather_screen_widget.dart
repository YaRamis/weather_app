import 'package:flutter/material.dart';

/*
Виджет экрана со списком из 3 элементов: информация о погоде за 3 дня,
где самый первый элемент с самой низкой температурой.

Widget of screen with 3 elements: weather information in 3 days.
First element has lowest temperature.
 */
class ThreeDaysWeatherScreenWidget extends StatelessWidget {
  const ThreeDaysWeatherScreenWidget({Key? key}) : super(key: key);

  List<_ExactDayWeatherWidget> _getExactDayWeatherWidgetList({int count = 3}) {
    List<_ExactDayWeatherWidget> list = [];

    for (int i = 0; i < count; i++) {
      list.add(const _ExactDayWeatherWidget(
        date: '08 . 08 . 2002',
        temperatureMax: 30,
        temperatureMin: 20,
      ));
    }

    return list;
  }

  @override
  Widget build(BuildContext context) {
    final exactDayWeatherWidgetList = _getExactDayWeatherWidgetList();
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        title: const Text('Weather next 3 days'),
      ),
      backgroundColor: Colors.teal.shade800,
      body: Column(
        children: exactDayWeatherWidgetList,
      ),
    );
  }
}

class _ExactDayWeatherWidget extends StatelessWidget {
  final String date;
  final int temperatureMax;
  final int temperatureMin;

  const _ExactDayWeatherWidget({
    required this.date,
    required this.temperatureMax,
    required this.temperatureMin,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      child: Container(
        width: 400,
        height: 210,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.teal,
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(
                date,
                style: const TextStyle(color: Colors.white, fontSize: 15),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.wb_sunny_rounded,
                    color: Colors.white,
                    size: 80,
                  ),
                  const SizedBox(width: 20),
                  Text(
                    '$temperatureMax° / $temperatureMin°',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              const Text(
                'Weather description',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 19),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.water_drop_rounded,
                    size: 15,
                    color: Colors.white,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Humidity',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(width: 5),
                  Text(
                    '70 %',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  )
                ],
              ),
              // const Text(
              //   'Humidity 70%',
              //   style: TextStyle(color: Colors.white, fontSize: 15),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
