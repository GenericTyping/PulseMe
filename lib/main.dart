import 'package:flutter/material.dart';
import 'package:pulseme/views/pages/home_page.dart';

void main() => runApp(new PulseMeApp());

class PulseMeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'PulseMe',
      theme: new ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: new HomePage(),
    );
  }
}