import 'package:flutter/material.dart';

class ThreeDaysWeatherScreenWidget extends StatelessWidget {
  const ThreeDaysWeatherScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
      ),
      backgroundColor: Colors.teal.shade800,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView.builder(
          itemCount: 3,
          itemExtent: 230,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.black,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
