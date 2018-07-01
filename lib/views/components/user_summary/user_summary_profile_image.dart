import 'package:flutter/material.dart';

class UserSummaryProfileImage extends StatelessWidget {
  const UserSummaryProfileImage({
    Key key,
    @required this.profileImage,
  }) : super(key: key);

  final ImageProvider profileImage;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 40.0,
      backgroundImage: FadeInImage(
        placeholder:
            AssetImage("assets/images/placeholder/profileplaceholder.png"),
        image: profileImage,
      ).image,
    );
  }
}
