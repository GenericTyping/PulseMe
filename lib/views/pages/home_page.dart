import 'package:flutter/material.dart';
import 'package:pulseme/views/components/user_controls_view.dart';
import 'package:pulseme/views/pages/bodies/home_body.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  final String title = "PulseMe";

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: new AppBar(
        centerTitle: true,
        title: new Text(widget.title),
        elevation: 0.0,
      ),
      body: HomeBody(),
    );
  }
}
