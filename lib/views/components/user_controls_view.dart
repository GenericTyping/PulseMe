import 'package:flutter/material.dart';
import 'package:pulseme/models/user.dart';
import 'package:pulseme/views/components/user_services_view.dart';
import 'package:pulseme/views/components/user_summary/user_summary_background_image_component.dart';
import 'package:pulseme/views/components/user_summary/user_summary_profile_image.dart';
import 'package:pulseme/views/components/user_summary/user_summary_status_component.dart';

class UserControlsView extends StatefulWidget {
  UserControlsView(this.user);

  final User user;

  @override
  _UserControlsViewState createState() => _UserControlsViewState();
}

class _UserControlsViewState extends State<UserControlsView> {
  ImageProvider profileImage;

  @override
  initState() {
    super.initState();
    profileImage = NetworkImage(widget.user.pictureUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blueGrey[800],
      child: SizedBox(
        height: 150.0,
        child: Stack(
          children: <Widget>[
            UserSummaryBackgroundImageComponent(profileImage: profileImage),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "YOUR PROFILE",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Center(
              child: ListTile(
                leading: UserSummaryProfileImage(profileImage: profileImage),
                title: Text(
                  "${widget.user.firstName}",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                  ),
                ),
                subtitle: UserSummaryStatusComponent(
                  user: widget.user,
                  textStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
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
