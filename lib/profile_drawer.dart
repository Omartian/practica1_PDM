import 'package:estructura_practica_1/profile.dart';
import 'package:flutter/material.dart';

class ProfileDrawer extends StatefulWidget {
  ProfileDrawer({Key key}) : super(key: key);

  @override
  _ProfileDrawerState createState() => _ProfileDrawerState();
}

class _ProfileDrawerState extends State<ProfileDrawer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Profile(),
      ),
    );
  }
}
