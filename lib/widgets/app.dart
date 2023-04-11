import 'package:flutter/material.dart';
import 'package:weather_app/app_routes/app_routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: Colors.teal.shade800),
        scaffoldBackgroundColor: Colors.teal,
        dividerColor: Colors.white,
      ),
      routes: AppRoutes.routes,
      initialRoute: AppRoutes.weatherDetailedInfoScreen,
    );
  }
}
