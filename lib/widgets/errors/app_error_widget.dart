import 'package:flutter/material.dart';
import 'package:weather_app/app_routes/app_routes.dart';

class AppErrorWidget extends StatefulWidget {
  const AppErrorWidget({Key? key}) : super(key: key);

  @override
  State<AppErrorWidget> createState() => _AppErrorWidgetState();
}

class _AppErrorWidgetState extends State<AppErrorWidget> {
  // @override
  // void didChangeDependencies() {
  //   // ScaffoldMessenger.of(context)
  //   //     .showSnackBar(SnackBar(content: Text('ERROR')));
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ColoredBox(
        color: Colors.red,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('ERROR'),
              // SnackBar(content: Text('ERROR')),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacementNamed(AppRoutes.setCityScreen);
                },
                child: Text('Back'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
