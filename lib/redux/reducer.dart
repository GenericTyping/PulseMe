import 'package:pulseme/redux/actions.dart' as Actions;
import 'package:pulseme/redux/app_state.dart';
import 'package:redux/redux.dart';

AppState reducer(AppState state, dynamic action) {
  assert(action is Actions.ReduxAction);

  switch (action.runtimeType) {
    case Actions.InitState:
      return AppState.init();
    case Actions.SetUserDocumentReference:
      return state.copyWith(reference: (action as Actions.SetUserDocumentReference).reference);
    case Actions.SetUser:
      return state.copyWith(user: (action as Actions.SetUser).user);
    default:
      return state;
  }
}