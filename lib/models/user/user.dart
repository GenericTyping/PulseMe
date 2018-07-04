import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:pulseme/models/firestore_model.dart';
import 'package:pulseme/models/user/user_status.dart' as UserStatus;

class User extends FirestoreModel {
  User({
    DocumentReference reference,
    @required this.firstName,
    @required this.lastName,
    @required this.status,
    @required this.groupReference,
    @required this.services,
    @required this.pictureUrl,
  }) : super(reference);

  static const String collectionName = "users";

  final String firstName;
  final String lastName;
  final UserStatus.UserStatus status;
  final DocumentReference groupReference;
  final Map<String, bool> services;
  final String pictureUrl;

  static Future<User> fromReference(DocumentReference reference) async {
    final DocumentSnapshot snapshot = await reference.get();
    return User.fromSnapshot(snapshot);
  }

  factory User.fromSnapshot(DocumentSnapshot snapshot) {
    return User(
      reference: snapshot.reference,
      firstName: snapshot.data["first_name"],
      lastName: snapshot.data["last_name"],
      status: UserStatus.of(snapshot.data["status"]),
      groupReference: snapshot.data["group"],
      services: Map.castFrom<dynamic, dynamic, String, bool>(snapshot.data["services"]),
      pictureUrl: snapshot.data["picture_url"],
    );
  }

  @override
  Map<String, dynamic> toMap() => {
        "first_name": firstName,
        "last_name": lastName,
        "status": status.index,
        "group": groupReference,
        "services": services,
      };

  static Future<List<User>> fromQuerySnapshot(QuerySnapshot snapshot) async {
    List<User> result = [];
    for (DocumentSnapshot documentSnapshot in snapshot.documents) {
      result.add(User.fromSnapshot(documentSnapshot));
    }
    return result;
  }

  //TODO: (@jeroen-meijer) Add 'sendMessage',
  // 'changeStatus', 'enableService', 'disableService'
  // and 'switchService' methods.
}
