//NEW

import 'package:flutter/material.dart';
import 'package:pulseme/models/user/user_service_content.dart';
import 'package:pulseme/models/user/user.dart';
import 'package:pulseme/views/components/user_service_button.dart';

class UserServicesView extends StatefulWidget {
  UserServicesView(this.user);

  final User user;

  @override
  _UserServicesViewState createState() => _UserServicesViewState();
}

class _UserServicesViewState extends State<UserServicesView> {
  final IconData whatsAppIconData = IconData(0xea93, fontFamily: "icomoon");
  final IconData slackIconData = IconData(0xe900, fontFamily: "icomoon");
  final IconData zoomIconData = IconData(0xe914, fontFamily: "icomoon");

  List<UserServiceContent> allServices;

  initState() {
    super.initState();
    allServices = [
      UserServiceContent(
        enabled: widget.user.services["whatsapp"] ?? false,
        name: "whatsapp",
        iconData: whatsAppIconData,
        mainColor: Colors.green,
      ),
      UserServiceContent(
        enabled: widget.user.services["zoom"] ?? false,
        name: "zoom",
        iconData: zoomIconData,
        mainColor: Colors.blue,
      ),
      UserServiceContent(
        enabled: widget.user.services["slack"] ?? false,
        name: "slack",
        iconData: slackIconData,
        mainColor: Colors.deepOrange,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> serviceButtons = [];
    for (UserServiceContent serviceContent in allServices) {
      serviceButtons
          .add(UserServiceButton(widget.user, service: serviceContent));
    }
    // border: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0)))

    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: serviceButtons,
      ),
    );
  }
}
