import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:pulseme/models/firestore_model.dart';
import 'package:pulseme/models/group.dart';
import 'package:pulseme/models/user_status.dart' as UserStatus;

class User extends FirestoreModel {
  User({
    DocumentReference reference,
    @required this.firstName,
    @required this.lastName,
    @required this.status,
    @required this.groupReference,
    @required this.usesSlack,
    @required this.usesWhatsApp,
    @required this.usesZoom,
  }) : super(reference);

  static const String collectionName = "users";

  final String firstName;
  final String lastName;
  final UserStatus.UserStatus status;
  final DocumentReference groupReference;
  final bool usesSlack;
  final bool usesWhatsApp;
  final bool usesZoom;

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
      usesSlack: snapshot.data["uses_slack"],
      usesWhatsApp: snapshot.data["uses_whatsapp"],
      usesZoom: snapshot.data["uses_zoom"],
    );
  }

  @override
  Map<String, dynamic> toMap() => {
        "first_name": firstName,
        "last_name": lastName,
        "status": status.index,
        "group": groupReference,
        "uses_slack": usesSlack,
        "uses_whatsapp": usesWhatsApp,
        "uses_zoom": usesZoom,
      };

  static Future<List<User>> fromQuerySnapshot(QuerySnapshot snapshot) async {
    List<User> result = [];
    for (DocumentSnapshot documentSnapshot in snapshot.documents) {
      result.add(User.fromSnapshot(documentSnapshot));
    }
    return result;
  }
}
