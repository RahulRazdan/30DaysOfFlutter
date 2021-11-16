import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
      color: Colors.amber,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                accountName: Text("Billu Manmoji"),
                accountEmail: Text("manmojibillu@mardunga.com"),
                currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/profile.jpg")),
              )),
          ListTile(
            leading: Icon(CupertinoIcons.home),
            title: Text("Home"),
          ),
          ListTile(
            leading: Icon(CupertinoIcons.profile_circled),
            title: Text("See Billu"),
          ),
          ListTile(
            leading: Icon(CupertinoIcons.mail),
            title: Text("Contact Billu"),
          ),
        ],
      ),
    ));
  }
}
