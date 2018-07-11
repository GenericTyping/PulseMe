import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:pulseme/models/user/user.dart';
import 'package:pulseme/redux/actions.dart';
import 'package:pulseme/redux/app_state.dart';
import 'package:pulseme/redux/reducer.dart';
import 'package:pulseme/views/pages/home_page.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

void main() {
  runApp(new PulseMeApp());
}

class PulseMeApp extends StatelessWidget {
  final Store<AppState> store = new Store<AppState>(
    reducer,
    middleware: [thunkMiddleware],
  );

  PulseMeApp() {
    store.dispatch(InitState());
    store.dispatch(SetUserDocumentReference(Firestore.instance
        .collection(User.collectionName)
        .document("testuser")));
    store.dispatch(store.state.thunk.startUserObserver);
  }

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: new MaterialApp(
        title: 'PulseMe',
        theme: new ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        home: StoreConnector<AppState, User>(
          converter: (store) => store.state.user,
          builder: (context, user) => (user == null)
              ? Scaffold(
                  backgroundColor: Colors.grey[900],
                  body: Center(child: CircularProgressIndicator()),
                )
              : new HomePage(),
        ),
      ),
    );
  }
}
