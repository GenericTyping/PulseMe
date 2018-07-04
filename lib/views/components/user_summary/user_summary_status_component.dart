import 'package:flutter/material.dart';
import 'package:pulseme/models/user/user.dart';
import 'package:pulseme/models/user/user_status.dart' as UserStatus;

class UserSummaryStatusComponent extends StatelessWidget {
  const UserSummaryStatusComponent({
    Key key,
    @required this.user,
    this.textStyle,
  }) : super(key: key);

  final User user;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        CircleAvatar(
          backgroundColor: UserStatus.getColor(user.status),
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
