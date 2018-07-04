import 'dart:ui';

import 'package:flutter/widgets.dart';

class UserServiceContent {
  UserServiceContent({
    @required this.name,
    @required this.enabled,
    @required this.iconData,
    @required this.onActivated,
    @required this.mainColor,
  });

  /// The name of the service.
  final String name;
  /// Indicates if the service is enabled by the user.
  final bool enabled;
  /// The icon representing the service. May be `null`.
  final IconData iconData;
  /// The callback that will be run if the service is activated
  /// (when a button is clicked, for example).
  final VoidCallback onActivated;
  /// The main color of the service, used for UI.
  final Color mainColor;

}
