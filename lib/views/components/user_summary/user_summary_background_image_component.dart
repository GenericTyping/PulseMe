import 'package:flutter/material.dart';

class UserSummaryBackgroundImageComponent extends StatelessWidget {
  const UserSummaryBackgroundImageComponent({
    Key key,
    @required this.profileImage,
    this.opacity: 0.1,
  }) : super(key: key);

  final ImageProvider profileImage;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: FadeInImage(
        placeholder:
            AssetImage("assets/images/placeholder/profileplaceholder.png"),
        image: profileImage,
        fit: BoxFit.cover,
        width: double.infinity,
      ),
    );
  }
}