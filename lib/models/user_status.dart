enum UserStatus {
  online,
  away,
  doNotDisturb,
  offline,
}

UserStatus of(int value) =>
    UserStatus.values.firstWhere((t) => t.index == value);
