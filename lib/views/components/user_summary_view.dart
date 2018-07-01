import 'package:flutter/material.dart';
import 'package:pulseme/models/user.dart';
import 'package:pulseme/views/components/user_services_view.dart';
import 'package:pulseme/views/components/user_summary/user_summary_background_image_component.dart';
import 'package:pulseme/views/components/user_summary/user_summary_profile_image.dart';
import 'package:pulseme/views/components/user_summary/user_summary_status_component.dart';

class UserSummaryView extends StatefulWidget {
  UserSummaryView(this.user);

  final User user;

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
      child: SizedBox(
        height: 130.0,
        child: Stack(
          children: <Widget>[
            UserSummaryBackgroundImageComponent(profileImage: profileImage),
            Center(
              child: ListTile(
                leading: UserSummaryProfileImage(profileImage: profileImage),
                title: Text(
                  "${widget.user.firstName}",
                  style: TextStyle(
                    color: Colors.blueGrey[900],
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                  ),
                ),
                subtitle: UserSummaryStatusComponent(user: widget.user),
                trailing: UserServicesView(
                  widget.user,
                  onWhatsAppTapped: () => print("WhatsAppTapped"),
                  onSlackTapped: () => print("SlackTapped"),
                  onZoomTapped: () => print("ZoomTapped"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
