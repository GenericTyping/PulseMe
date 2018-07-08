import 'package:flutter/material.dart';
import 'package:pulseme/views/pages/home_page.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

void main() {
  runApp(new PulseMeApp());
}

class PulseMeApp extends StatelessWidget {
  PulseMeApp() {
    final FirebaseMessaging _firebaseMessaging = new FirebaseMessaging();
    _firebaseMessaging.requestNotificationPermissions();
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) {
        debugPrint("onMessage: $message");
      },
      onLaunch: (Map<String, dynamic> message) {
        debugPrint("onLaunch: $message");
      },
      onResume: (Map<String, dynamic> message) {
        debugPrint("onResume: $message");
      },
    );

    _firebaseMessaging.getToken().then((token) => debugPrint("Token: $token"));
  }

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
