// import 'package:flutter/material.dart';
// import 'package:weather_app/app_routes/app_routes.dart';
// import 'package:weather_app/theme/app_button_styles.dart';
// import 'package:weather_app/theme/app_input_decorations.dart';

part of '../app.dart';

/*
Виджет экрана установки города.

Widget of set city screen.
 */
class SetCityScreen extends StatelessWidget {
  const SetCityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
          color: Colors.teal,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 120),
              Text(
                'YaRamis',
                style: TextStyle(
                  color: Colors.teal.shade800,
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Weather App',
                style: TextStyle(
                  color: Colors.teal.shade800,
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40),
              const _SetCityIcon(),
              const SizedBox(height: 20),
              const _SetCityTextField(),
              const SizedBox(height: 20),
              const _SetCityElevatedButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class _SetCityElevatedButton extends StatelessWidget {
  const _SetCityElevatedButton();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: AppButtonStyles.setCityButtonStyle,
      onPressed: () {
        if (_cityName != '') {
          Navigator.of(context)
              .pushReplacementNamed(AppRoutes.weatherDetailedInfoScreen);
        }
      },
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Text(
          'Submit',
          style: TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}

class _SetCityIcon extends StatelessWidget {
  const _SetCityIcon();

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.location_city_rounded,
      color: Colors.teal.shade800,
      size: 150,
    );
  }
}

class _SetCityTextField extends StatelessWidget {
  const _SetCityTextField();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: TextField(
        onChanged: (string) async {
          _cityName = string;
          await _setCityName();
        },
        decoration: AppInputDecoration.setCityInputDecoration,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 25,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
