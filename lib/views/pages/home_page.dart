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
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        centerTitle: true,
        //NEW
        //REWORK (EXTRACT)
        //TODO: (@jeroen-meijer) Change to Redux info.
        //TODO: (@jeroen-meijer) Change user's group stuff to contain name of group in user document.
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text("Jeroen Meijer"),
                Text(
                  "GenericTyping",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 13.0,
                    color: Colors.grey,
                  ),
                )
              ],
            ),
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
