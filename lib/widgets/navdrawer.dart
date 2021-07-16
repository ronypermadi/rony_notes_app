import 'dart:io';
import 'package:flutter/material.dart';
import 'package:rony_notes_app/pages/homepage.dart';
import 'package:rony_notes_app/pages/category_page.dart';
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
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => HomePage()))
            },
          ),
          ListTile(
            leading: Icon(Icons.tag),
            title: Text('Category'),
            onTap: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => CategoryPage()))
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Exit'),
            onTap: () => {
              showDialog(
                  context: context,
                  builder: (_) {
                    return AlertDialog(
                      title: Text('Are you sure?'),
                      content: Text('Do you want to exit the App'),
                      actions: [
                        TextButton(
                          onPressed: () =>
                              Navigator.pop(context, false), // passing false
                          child: Text('No'),
                        ),
                        TextButton(
                          onPressed: () => exit(0), // passing true
                          child: Text('Yes'),
                        ),
                      ],
                    );
                  })
            },
          ),
        ],
      ),
    );
  }
}
