import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:pulseme/models/user/user.dart';
import 'package:pulseme/redux/actions.dart';

class AppState {
  AppState({
    @required this.thunk,
    this.user,
    this.reference,
  });
  final User user;
  final DocumentReference reference;
  final Thunk thunk;

  factory AppState.init() => AppState(thunk: Thunk());

  AppState copyWith({User user, DocumentReference reference}) => AppState(
        user: user ?? this.user,
        reference: reference ?? this.reference,
        thunk: this.thunk,
      );
}
