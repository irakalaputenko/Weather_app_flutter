import 'package:flutter/material.dart';


class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Side menu'),
      ),
      body: Center(
        child: Text('About'),
      ),
    );
  }
}