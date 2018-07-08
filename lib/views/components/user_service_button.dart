//NEW

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pulseme/models/message.dart';
import 'package:pulseme/models/user/user.dart';
import 'package:pulseme/models/user/user_service_content.dart';

enum ServiceState { idle, loading, success, failure }

class UserServiceButton extends StatefulWidget {
  UserServiceButton(
    this.user, {
    @required this.service,
  });

  final User user;
  final UserServiceContent service;

  @override
  _UserServiceButtonState createState() => _UserServiceButtonState(service);
}

class _UserServiceButtonState extends State<UserServiceButton> {
  _UserServiceButtonState(this._service);

  UserServiceContent _service;

  ServiceState _serviceState = ServiceState.idle;

  onTapped() async {
    if (_service.enabled) {
      debugPrint("OnTapped (${_service.name})");

      setState(() {
        _serviceState = ServiceState.loading;
      });

      bool sendSuccessfully = await Message(
        source: Firestore.instance
            .collection(User.collectionName)
            .document("testuser"),
        destination: widget.user.reference,
        serviceName: _service.name.toUpperCase(),
      ).send(
        skipVerification: false,
        verificationRetryInterval: Duration(milliseconds: 1500),
        verificationRetryAmount: 10,
      );

      setState(() {
        _serviceState =
            sendSuccessfully ? ServiceState.success : ServiceState.failure;
      });

      await Future.delayed(Duration(seconds: 3));

      setState(() {
        _serviceState = ServiceState.idle;
      });
    }
  }

  Widget _buildServiceIcon(BuildContext context) {
    final Size size = Size(12.0, 12.0);

    switch (_serviceState) {
      case ServiceState.loading:
        return SizedBox.fromSize(
          size: size,
          child: CircularProgressIndicator(
            strokeWidth: size.shortestSide / 5,
          ),
        );

      case ServiceState.success:
        return Icon(
          Icons.check,
          color: Colors.green,
          size: size.shortestSide,
        );

      case ServiceState.failure:
        return Icon(
          Icons.error,
          color: Colors.red,
          size: size.shortestSide,
        );

      default:
        return CircleAvatar(
          radius: size.shortestSide / 2,
          backgroundColor: _service.enabled ? Colors.green : Colors.grey,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: _service.enabled ? 1.0 : 0.6,
      child: FlatButton(
        padding: const EdgeInsets.all(0.0),
        onPressed: () => onTapped(),
        color: Colors.white,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              _service.iconData,
              color: _service.mainColor,
              size: 17.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                width: 1.5,
                height: 20.0,
                color: Colors.grey[300],
              ),
            ),
            _buildServiceIcon(context)
          ],
        ),
      ),
    );
  }
}
