import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pulseme/models/user/user.dart';
import 'package:pulseme/redux/app_state.dart';
import 'package:redux/redux.dart';

abstract class ReduxAction {}

class Thunk {
  StreamSubscription<DocumentSnapshot> _subscription;

  startUserObserver(Store<AppState> store) async {
    assert(store.state.reference != null);
    _subscription?.cancel();
    _subscription = store.state.reference
        .snapshots()
        .listen(userSubscriptionListener(store));
  }

  userSubscriptionListener(Store<AppState> store) =>
      (DocumentSnapshot snapshot) =>
          store.dispatch(SetUser(User.fromSnapshot(snapshot)));
}

class SetUserDocumentReference extends ReduxAction {
  SetUserDocumentReference(this.reference);
  final DocumentReference reference;
}

class SetUser extends ReduxAction {
  SetUser(this.user);
  final User user;
}

class InitState extends ReduxAction {}