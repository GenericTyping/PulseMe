import 'package:flutter/material.dart';

enum UserStatus {
  online,
  away,
  doNotDisturb,
  offline,
}

UserStatus of(int value) =>
    UserStatus.values.firstWhere((t) => t.index == value);

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
      case UserStatus.away:
        return Colors.yellow;
      case UserStatus.doNotDisturb:
        return Colors.red;
      case UserStatus.offline:
        return Colors.grey;
      default:
        return Colors.green;
    }
}