import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Home/SearchDelegate.dart';
import 'package:weather_app/bloc/WeatherBloc.dart';
import 'package:weather_app/components/MainScreenWrapper.dart';
import 'package:weather_app/components/MainScreenWrapper2.dart';
import 'package:weather_app/events/WeatherEvent.dart';
import 'package:weather_app/states/WeatherState.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => new _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {

  TabController _controller;
  int _selectedIndex = 0;

  List<Widget> list = [
    Tab(icon: Icon(Icons.access_time, color: Colors.black,)),
    Tab(icon: Icon(Icons.today, color: Colors.black,)),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Create TabController for getting the index of current tab
    _controller = TabController(length: list.length, vsync: this);

    _controller.addListener(() {
      setState(() {
        _selectedIndex = _controller.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherBloc(),
      child: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if (state is WeatherLoadSuccess) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Scaffold(
                appBar: AppBar(
                  bottom: TabBar(
                    onTap: (index) {
                      // Should not used it as it only called when tab options are clicked,
                      // not when user swapped
                    },
                    controller: _controller,
                    tabs: list,
                  ),
                  elevation: 0,
                  backgroundColor: Color.fromRGBO(0, 0, 0, 0),
                  actions: [
                    IconButton(
                      icon: Icon(Icons.my_location, color: Colors.black,),
                      onPressed: () {
                        BlocProvider.of<WeatherBloc>(context).add(WeatherCurrentPositionRequested());
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.search, color: Colors.black,),
                      onPressed: () {
                        showSearch(
                            context: context, delegate: MySearchDelegate((query) {
                          BlocProvider.of<WeatherBloc>(context).add(WeatherRequested(city: query));
                        }));
                      },
                    )
                  ],
                ),
                body: TabBarView(
                  controller: _controller,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 64),
                      child: MainScreenWrapper(
                          weather: state.weather, hourlyWeather: state.hourlyWeather),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 64),
                      child: MainScreenWrapper2(
                          weather: state.weather, daylyWeather: state.daylyWeather),
                    ),
                  ],
                ),
              ),
            );
          }
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}

