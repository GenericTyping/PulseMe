import 'package:flutter/material.dart';
import 'package:pulseme/models/user/user_service_content.dart';
import 'package:pulseme/models/user/user.dart';

class UserServicesView extends StatefulWidget {
  UserServicesView(
    this.user, {
    @required this.onWhatsAppTapped,
    @required this.onZoomTapped,
    @required this.onSlackTapped,
  });

  final User user;
  final VoidCallback onWhatsAppTapped;
  final VoidCallback onZoomTapped;
  final VoidCallback onSlackTapped;

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
        onActivated: widget.onWhatsAppTapped,
        mainColor: Colors.green,
      ),
      UserServiceContent(
        enabled: widget.user.services["zoom"] ?? false,
        name: "zoom",
        iconData: zoomIconData,
        onActivated: widget.onZoomTapped,
        mainColor: Colors.blue,
      ),
      UserServiceContent(
        enabled: widget.user.services["slack"] ?? false,
        name: "slack",
        iconData: slackIconData,
        onActivated: widget.onSlackTapped,
        mainColor: Colors.deepOrange,
      ),
    ];
  }

  Widget _buildServiceComponent(
    BuildContext context, {
    @required UserServiceContent service,
  }) {
    return Opacity(
      opacity: service.enabled ? 1.0 : 0.6,
      child: FlatButton(
        padding: const EdgeInsets.all(0.0),
        onPressed: () => service.onActivated(),
        color: Colors.white,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              service.iconData,
              color: service.mainColor,
              size: 17.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                width: 1.5,
                height: 20.0,
                color: Colors.grey[300],
              ),
            ),
            CircleAvatar(
              radius: 6.0,
              backgroundColor: service.enabled ? Colors.green : Colors.grey,
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> serviceButtons = [];
    for (UserServiceContent serviceContent in allServices) {
      serviceButtons
          .add(_buildServiceComponent(context, service: serviceContent));
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
