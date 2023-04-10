import 'package:flutter/material.dart';
import 'package:weather_app/app_routes/app_routes.dart';
import 'package:weather_app/theme/app_input_decorations.dart';

class SetCityScreen extends StatelessWidget {
  const SetCityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.teal,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 200,
              child: TextField(
                decoration: AppInputDecoration.defaultInputDecoration,
                style: const TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Colors.teal.shade800),
              ),
              onPressed: () {
                Navigator.of(context)
                    .pushReplacementNamed(AppRoutes.weatherDetailedInfoScreen);
              },
              child: const Text('Подтвердить'),
            ),
          ],
        ),
      ),
    );
  }
}
