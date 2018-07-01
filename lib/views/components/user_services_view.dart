import 'package:flutter/material.dart';
import 'package:pulseme/models/user.dart';

class UserServicesView extends StatefulWidget {
  UserServicesView(
    this.user, {
    @required this.onWhatsAppTapped,
    @required this.onSlackTapped,
    @required this.onZoomTapped,
  });

  final User user;
  final VoidCallback onWhatsAppTapped;
  final VoidCallback onSlackTapped;
  final VoidCallback onZoomTapped;

  @override
  _UserServicesViewState createState() => _UserServicesViewState();
}

class _UserServicesViewState extends State<UserServicesView> {
  final IconData whatsAppIconData = IconData(0xea93, fontFamily: "icomoon");
  final IconData slackIconData = IconData(0xe900, fontFamily: "icomoon");
  final IconData zoomIconData = IconData(0xe914, fontFamily: "icomoon");

  Widget _buildServiceComponent(
    BuildContext context, {
    @required Color mainColor,
    @required VoidCallback onTap,
    @required IconData iconData,
    @required String serviceName,
    @required bool isActive,
  }) {
    return Opacity(
      opacity: isActive ? 1.0 : 0.6,
      child: FlatButton(
        padding: const EdgeInsets.all(0.0),
        onPressed: onTap,
        child: Card(
          margin: const EdgeInsets.all(2.0),
          elevation: isActive ? 2.0 : 1.0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(
                  iconData,
                  color: mainColor,
                  size: 17.0,
                ),
                SizedBox(
                  width: 5.0,
                ),
                Text(serviceName),
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
                  backgroundColor: isActive ? Colors.green : Colors.grey,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> columnChildren = [];
    widget.user.services.forEach(
      (name, isActive) => columnChildren.add(
            _buildServiceComponent(
              context,
              iconData: Icons.home,
              isActive: isActive,
              serviceName: name,
              mainColor: Colors.black,
              onTap: () => debugPrint("$name button tapped!"),
            ),
          ),
    );
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: columnChildren,
    );
  }
}
