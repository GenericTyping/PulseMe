import 'package:flutter/material.dart';

enum UserStatus { online, away, doNotDisturb, offline, unknown }

UserStatus of(int value) {
  try {
    return UserStatus.values.firstWhere((t) => t.index == value);
  } catch (_) {
    return UserStatus.unknown;
  }
}

String toString(UserStatus status) {
  switch (status) {
    case UserStatus.online:
      return "Online";
    case UserStatus.away:
      return "Away";
    case UserStatus.doNotDisturb:
      return "Do Not Disturb";
    case UserStatus.offline:
      return "Offline";
    default:
      return "Unknown Status";
  }
}

Color getColor(UserStatus status) {
  switch (status) {
    case UserStatus.online:
      return Colors.green;
    case UserStatus.away:
      return Colors.yellow;
    case UserStatus.doNotDisturb:
      return Colors.red;
    case UserStatus.offline:
      return Colors.grey;
    default:
      return Colors.black;
  }
}
