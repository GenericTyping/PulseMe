import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

abstract class FirestoreModel {
  FirestoreModel(this.reference);
  final DocumentReference reference;

  Map<String, dynamic> toMap();

  void save() async {
    await reference.setData(toMap());
  }
}
