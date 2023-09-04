import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'Home.dart';
import 'Maintenance.dart';
import 'Monitor.dart';
import 'Notifications.dart';
import 'Settings.dart';

class OffsetPage extends StatefulWidget {
  const OffsetPage({ Key? key }) : super(key: key);

  @override
  State<OffsetPage> createState() => _OffsetPageState();
}

class _OffsetPageState extends State<OffsetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {navToHome(context);},
            tooltip: 'Go back',
            iconSize: 30,
            padding: EdgeInsets.only(left:15),
          ),
          title: Image.asset('assets/images/bw_salineq_logo.png', fit: BoxFit.cover, height: 55),
          centerTitle: true,
          toolbarHeight: 70,
          actions: [
            IconButton(
              onPressed: () {navToNotification(context);},
              icon: Icon(Icons.notifications),
              tooltip: 'Notifications',
              iconSize: 30,
              padding: EdgeInsets.only(right: 15),
            )
          ],
          backgroundColor: Color.fromARGB(205, 60, 60, 60),
        ),
        body: Container(
          child: Column()
        ),
        bottomNavigationBar: BottomAppBar(
          color: Color(0xff3d9970),
          child: Container(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: IconButton(
                    icon: Icon(Icons.home),
                    tooltip: 'Home Page',
                    onPressed: () {navToHome(context);},
                    color: Color.fromARGB(255, 43, 108, 79),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: IconButton(
                    icon: Icon(Icons.query_stats),
                    tooltip: 'Monitoring Page',
                    onPressed: () {navToMonitor(context);},
                    color: Color.fromARGB(255, 43, 108, 79),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: IconButton(
                    icon: Icon(Icons.handyman),
                    tooltip: 'Maintenance Page',
                    onPressed: () {navToMaintenance(context);},
                    color: Color.fromARGB(255, 43, 108, 79),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: IconButton(
                    icon: Icon(Icons.settings),
                    tooltip: 'Settings Page',
                    onPressed: () {navToSettings(context);},
                    color: Color.fromARGB(255, 43, 108, 79),

                  ),
                ),
              ]
            ),
          ),
        ),
      );
  }
  void navToSettings(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => SettingsPage()));
  }

  void navToMaintenance(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => MaintenancePage()));
  }

  void navToHome(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()));
  }

  void navToMonitor(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => MonitorPage()));
  }

  void navToNotification(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => NotificationPage()));
  }
}