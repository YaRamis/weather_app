import 'package:flutter/material.dart';

// Виджет экрана, который будет показываться при загрузке данных.
// (В приложении такая ситуацият только, когда идет загрузка данных сохраненного города)
class AppCircularProgressIndicator extends StatelessWidget {
  const AppCircularProgressIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.teal.shade800,
      child: const Center(
        child: SizedBox(
          height: 20,
          width: 20,
          child: CircularProgressIndicator(
            color: Colors.teal,
          ),
        ),
      ),
    );
  }
}
