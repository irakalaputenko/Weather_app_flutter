import 'package:flutter/material.dart';
import 'package:weather_app/Home/HomeScreen.dart';
import 'package:weather_app/Splash/SplashScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    '/Home': (BuildContext context) => HomeScreen()
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(nextRoute: '/Home'),
      routes: routes,
    );
  }
}