import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

class Message {
  Message({
    @required this.source,
    @required this.destination,
    @required this.serviceName,
  });

  static final String collectionName = "messages";

  final DocumentReference source;
  final DocumentReference destination;
  final String serviceName;

  Future<bool> send({
    bool skipVerification: false,
    Duration verificationRetryInterval,
    int verificationRetryAmount: 5,
  }) async {
    final DocumentReference newMessageReference =
        source.collection(Message.collectionName).document();
    try {
      await newMessageReference.setData(toMap());
      print("Data set.");
      if (skipVerification) return true;

      print("Checking sent field...");

      for (var i = 0; i < verificationRetryAmount; i++) {
        print("Try ${i+1}...");
        bool sent = (await newMessageReference.get()).data["sent"];
        print("sent: $sent");
        if (sent == null) {
          await Future
              .delayed(verificationRetryInterval ?? Duration(seconds: 2));
          sent = (await newMessageReference.get()).data["sent"];
        } else {
          return sent;
        }
      }
      print("sent was never there, returning false.");
      return false;
    } catch (e) {
      print("Error occurred ($e), returning false.");
      return false;
    }
  }

  Map<String, dynamic> toMap() => {
        "destination": destination,
        "service": serviceName,
        "date_time": DateTime.now()
      };
}
