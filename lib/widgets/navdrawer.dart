import 'package:flutter/material.dart';
import 'package:rony_notes_app/widgets/network_image.dart';

class NavDrawer extends StatelessWidget {
  final logoHeader =
      'https://notes.ronypermadi.com/assets/front/images/core-img/Logo.png';
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Center(
              child: NetworkImageCache(
                logoHeader,
                fit: BoxFit.cover,
              ),
            ),
            decoration: BoxDecoration(
              color: Color(0xff212121),
            ),
          ),
          ListTile(
            leading: Icon(Icons.refresh),
            title: Text('Refresh'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Exit'),
            onTap: () => {Navigator.of(context).pop()},
          ),
        ],
      ),
    );
  }
}
