import 'package:flutter/material.dart';
import 'package:pulseme/models/user.dart';
import 'package:pulseme/models/user_status.dart' as UserStatus;

class UserSummaryStatusComponent extends StatelessWidget {
  const UserSummaryStatusComponent({
    Key key,
    @required this.user,
    this.textStyle,
  }) : super(key: key);

  final User user;
  final TextStyle textStyle;

  Color _buildUserStatusIconColor(BuildContext context) {
    switch (user.status) {
      case UserStatus.UserStatus.away:
        return Colors.yellow;
      case UserStatus.UserStatus.doNotDisturb:
        return Colors.red;
      case UserStatus.UserStatus.offline:
        return Colors.grey;
      default:
        return Colors.green;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        CircleAvatar(
          backgroundColor: _buildUserStatusIconColor(context),
          radius: 7.0,
        ),
        SizedBox(width: 5.0),
        Text(
          "${UserStatus.toString(user.status)}",
          style: textStyle ?? TextStyle(),
        )
      ],
    );
  }
}
