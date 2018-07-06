import 'package:flutter/material.dart';
import 'package:pulseme/models/user/user.dart';
import 'package:pulseme/views/components/user_services_view.dart';
import 'package:pulseme/views/components/user_summary/user_summary_background_image_component.dart';
import 'package:pulseme/views/components/user_summary/user_summary_profile_image.dart';
import 'package:pulseme/views/components/user_summary/user_summary_status_component.dart';

class UserSummaryView extends StatefulWidget {
  UserSummaryView({
    @required this.user,
    this.textColor: Colors.white,
    this.textSize: 30.0,
    this.statusTextColor: Colors.white,
    this.cardColor: Colors.black,
    this.backgroundOpacity: 0.7,
    this.height: 130.0,
  });

  final User user;

  final Color textColor;
  final double textSize;
  final Color statusTextColor;
  final Color cardColor;
  final double backgroundOpacity;
  final double height;

  @override
  _UserSummaryViewState createState() => _UserSummaryViewState();
}

class _UserSummaryViewState extends State<UserSummaryView> {
  ImageProvider profileImage;

  @override
  initState() {
    super.initState();
    profileImage = NetworkImage(widget.user.pictureUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: widget.cardColor,
      child: SizedBox(
        height: widget.height,
        child: Stack(
          children: <Widget>[
            UserSummaryBackgroundImageComponent(
              profileImage: profileImage,
              opacity: widget.backgroundOpacity,
            ),
            Center(
              child: ListTile(
                leading: UserSummaryProfileImage(profileImage: profileImage),
                title: Text(
                  "${widget.user.firstName}",
                  style: TextStyle(
                    color: widget.textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: widget.textSize,
                  ),
                ),
                subtitle: UserSummaryStatusComponent(
                  user: widget.user,
                  textStyle: TextStyle(
                    color: widget.statusTextColor,
                  ),
                ),
                trailing: UserServicesView(widget.user),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
