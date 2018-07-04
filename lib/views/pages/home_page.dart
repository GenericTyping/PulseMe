import 'package:flutter/material.dart';
import 'package:pulseme/views/pages/bodies/home_body.dart';
import 'package:pulseme/models/user/user_status.dart' as UserStatus;

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
      backgroundColor: Colors.grey[900],
      appBar: new AppBar(
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new Text("Jeroen Meijer"),
            SizedBox(width: 10.0),
            Chip(
              label: Text("Online"),
              avatar: CircleAvatar(
                backgroundColor:
                    UserStatus.getColor(UserStatus.UserStatus.online),
                radius: 6.0,
              ),
              deleteIcon: Icon(Icons.arrow_drop_down),
              onDeleted: () => debugPrint("Select status."),
              deleteButtonTooltipMessage: "Select status.",
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: <Widget>[],
      ),
      body: HomeBody(),
    );
  }
}
