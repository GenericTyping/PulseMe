import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pulseme/models/group.dart';
import 'package:pulseme/models/user.dart';
import 'package:pulseme/models/user_status.dart';

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
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RaisedButton(
                child: Text("CREATE NEW USER"),
                onPressed: () {
                  new User(
                    reference: Firestore.instance
                        .collection(User.collectionName)
                        .document(),
                    firstName: "Alice",
                    lastName: "Karaman",
                    groupReference: Firestore.instance
                        .collection(Group.collectionName)
                        .document("testgroup"),
                    status: UserStatus.away,
                    usesSlack: false,
                    usesWhatsApp: true,
                    usesZoom: false,
                  )..save();
                  debugPrint("User created!");
                }),
          ),
          Center(
            child: Text("Users:"),
          ),
          StreamBuilder<List<User>>(
            stream: Firestore.instance
                .collection(User.collectionName)
                .snapshots()
                .asyncMap<List<User>>(User.fromQuerySnapshot),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                debugPrint(snapshot.error.toString());
                return Icon(
                  Icons.sentiment_dissatisfied,
                  size: 40.0,
                );
              }
              if (snapshot.hasData == false) return CircularProgressIndicator();

              return Column(
                mainAxisSize: MainAxisSize.min,
                children: snapshot.data
                    .map<Widget>((currentUser) => Card(
                          margin: const EdgeInsets.all(15.0),
                          child: Column(
                            children: <Widget>[
                              Text("id: ${currentUser.reference.documentID}"),
                              Text("firstName: ${currentUser.firstName}"),
                              Text("lastName: ${currentUser.lastName}"),
                              Text("usesSlack: ${currentUser.usesSlack}"),
                              Text("usesWhatsApp: ${currentUser.usesWhatsApp}"),
                              Text("usesZoom: ${currentUser.usesZoom}"),
                            ],
                          ),
                        ))
                    .toList(),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RaisedButton(
                child: Text("CREATE NEW GROUP"),
                onPressed: () {
                  new Group(
                      reference: Firestore.instance
                          .collection(Group.collectionName)
                          .document(),
                      name: "Testgoup ${DateTime.now().millisecond}",
                      members: [
                        Firestore.instance
                            .collection(User.collectionName)
                            .document("testuser")
                      ],
                      pictureUrl:
                          "https://i.ytimg.com/vi/O2ZshzUKKo0/maxresdefault.jpg")
                    ..save();
                  debugPrint("Group created!");
                }),
          ),
          Center(
            child: Text("Groups:"),
          ),
          StreamBuilder<List<Group>>(
            stream: Firestore.instance
                .collection(Group.collectionName)
                .snapshots()
                .asyncMap<List<Group>>(Group.fromQuerySnapshot),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                debugPrint(snapshot.error.toString());
                return Icon(
                  Icons.sentiment_dissatisfied,
                  size: 40.0,
                );
              }
              if (snapshot.hasData == false) return CircularProgressIndicator();

              return Column(
                mainAxisSize: MainAxisSize.min,
                children: snapshot.data
                    .map<Widget>((currentGroup) => Card(
                          margin: const EdgeInsets.all(15.0),
                          child: Column(
                            children: <Widget>[
                              Text("id: ${currentGroup.reference.documentID}"),
                              Text("name: ${currentGroup.name}"),
                              Text("members: ${currentGroup.members}"),
                              Image.network(currentGroup.pictureUrl),
                            ],
                          ),
                        ))
                    .toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}
