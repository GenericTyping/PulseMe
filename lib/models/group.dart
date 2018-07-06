import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:pulseme/models/firestore_model.dart';

class Group extends FirestoreModel {
  Group({
    DocumentReference reference,
    @required this.name,
    @required this.members,
    @required this.pictureUrl,
  }) : super(reference);

  static const String collectionName = "groups";

  final String name;
  final List<DocumentReference> members;
  final String pictureUrl;

  static Future<Group> fromReference(DocumentReference reference) async {
    final DocumentSnapshot snapshot = await reference.get();
    return Group.fromSnapshot(snapshot);
  }

  factory Group.fromSnapshot(DocumentSnapshot snapshot) {
    return Group(
      reference: snapshot.reference,
      name: snapshot.data["name"],
      members:
          List.castFrom<dynamic, DocumentReference>(snapshot.data["members"]),
      pictureUrl: snapshot.data["picture_url"],
    );
  }

  @override
  Map<String, dynamic> toMap() => {
        "name": name,
        "members": members,
        "picture_url": pictureUrl,
      };

  static Future<List<Group>> fromQuerySnapshot(QuerySnapshot snapshot) async {
    List<Group> result = [];
    for (DocumentSnapshot documentSnapshot in snapshot.documents) {
      result.add(Group.fromSnapshot(documentSnapshot));
    }
    return result;
  }

  static Future<Group> byName(String groupName) async {
    return Group.fromSnapshot((await Firestore.instance
            .collection(Group.collectionName)
            .where("name", isEqualTo: groupName)
            .getDocuments())
        .documents
        .first);
  }
}
