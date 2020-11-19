import 'dart:core';
import 'dart:async';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  final String nextRoute;

  SplashScreen({this.nextRoute});

  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  AnimationController animationController;
  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
      vsync: this,
      duration: new Duration(seconds: 2),
    );

    animationController.repeat();
    Timer(Duration(seconds: 3),
            () {
          Navigator.of(context).pushReplacementNamed(widget.nextRoute);
        });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Stack(
          children: <Widget>[
            new Container(
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new AssetImage("assets/background.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            new Center(
                child: new AnimatedBuilder(
                  animation: animationController,
                  child: new Container(
                    child: Image.asset('assets/weather_icon.png'),
                  ),
                  builder: (BuildContext context, Widget _widget){
                    return new Transform.rotate(
                      angle: animationController.value * 6.3,
                      child: _widget,
                    );
                  },
                ))
          ],
        ));
  }
}
