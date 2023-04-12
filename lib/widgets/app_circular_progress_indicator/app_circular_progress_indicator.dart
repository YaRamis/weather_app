import 'package:flutter/material.dart';

class AppCircularProgressIndicator extends StatelessWidget {
  const AppCircularProgressIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.teal.shade800,
      child: const Center(
        child: SizedBox(
          height: 200,
          width: 200,
          child: CircularProgressIndicator(
            color: Colors.teal,
            strokeWidth: 20,
          ),
        ),
      ),
    );
  }
}
