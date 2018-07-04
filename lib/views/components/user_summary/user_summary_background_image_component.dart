import 'package:flutter/material.dart';
import 'dart:ui';

class UserSummaryBackgroundImageComponent extends StatelessWidget {
  const UserSummaryBackgroundImageComponent({
    Key key,
    @required this.profileImage,
    this.opacity: 1.0,
  }) : super(key: key);

  final ImageProvider profileImage;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: new Container(
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: this.profileImage,
            fit: BoxFit.cover,
          ),
        ),
        //I blured the parent conainer to blur background image, you can get rid of this part
        child: new BackdropFilter(
          filter: new ImageFilter.blur(sigmaX: 13.0, sigmaY: 13.0),
          child: new Container(
            //you can change opacity with color here(I used black) for background.
            decoration: new BoxDecoration(color: Colors.black.withOpacity(0.2)),
          ),
        ),
      ),
    );
  }
}
