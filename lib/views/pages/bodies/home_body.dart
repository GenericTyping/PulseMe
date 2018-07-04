import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pulseme/models/group.dart';
import 'package:pulseme/models/user/user.dart';
import 'package:pulseme/views/components/user_summary_view.dart';

class HomeBody extends StatefulWidget {
  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  final DocumentReference groupDocRef =
      Firestore.instance.collection(Group.collectionName).document("testgroup");

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<User>>(
      stream: Firestore.instance
          .collection(User.collectionName)
          // .where("group", isEqualTo: groupDocRef)
          .snapshots()
          .asyncMap(User.fromQuerySnapshot),
      builder: (context, snapshot) {
        if (snapshot.hasError) return Text("Error!");
        if (snapshot.hasData == false) return Text("Loading!");

        return ListView(
          children: snapshot.data
              .map<Widget>((user) => UserSummaryView(user: user))
              .toList(),
        );
      },
    );
  }
}
