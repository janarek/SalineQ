import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';

import 'Home.dart';
import 'Maintenance.dart';
import 'Notifications.dart';
import 'Settings.dart';

class Monitor extends StatelessWidget {
  const Monitor({Key? key}) : super(key: key);

  Stream<Map<String, dynamic>> getData() async* {
    while (true) {
      Response response = await get(Uri(
          scheme: "http", host: '10.0.2.2', port: 5000, path: "/getHomeData"));
      Map body = json.decode(response.body);
      Map<String, dynamic> data =
          body.map<String, dynamic>((key, value) => MapEntry("$key", value));
      yield data;
      await Future.delayed(const Duration(seconds: 7));
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: getData(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState != ConnectionState.active) {
            // Return what ur user sees when loading
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // Return what ur user sees when an error occurs
            return Center(
                child: Text("Something went wrong. ${snapshot.error}"));
          } else if (snapshot.hasData) {
            // Return ur screen
            return HomePage();
          } else {
            return Text('No Data found');
          }
        });
  }
}

class MonitorPage extends StatefulWidget {
  const MonitorPage({ Key? key }) : super(key: key);

  @override
  State<MonitorPage> createState() => _MonitorPageState();
}

class _MonitorPageState extends State<MonitorPage> {
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
                    onPressed: () {setState(() {});},
                    color: Color.fromARGB(255, 255, 255, 255),
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

  void navToNotification(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => NotificationPage()));
  }
}