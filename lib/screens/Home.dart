import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'Controls.dart';
import 'Maintenance.dart';
import 'Monitor.dart';
import 'Notifications.dart';
import 'Offset.dart';
import 'Settings.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  Stream<Map<String, dynamic>> getData() async* {

    while (true) {
      Response response = await get(Uri(
        scheme: "http", host: '10.0.2.2', port: 5000, path: "/getHomeData"));
      Map body = json.decode(response.body);
      Map<String, dynamic> data = body.map<String, dynamic>((key, value) => MapEntry("$key", value));
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

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/images/bw_salineq_logo.png',
            fit: BoxFit.cover, height: 55),
        centerTitle: true,
        toolbarHeight: 70,
        actions: [
          IconButton(
            onPressed: () {
              navToNotification(context);
            },
            icon: Icon(Icons.notifications),
            tooltip: 'Notifications',
            iconSize: 30,
            padding: EdgeInsets.only(right: 15),
          )
        ],
        backgroundColor: Color.fromARGB(205, 60, 60, 60),
      ),
      body: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 20, left: 20),
                  child: Column(
                    //controls button
                    children: [
                      IconButton(
                        onPressed: () {
                          navToControls(context);
                        },
                        icon: Image.asset('assets/images/controls_icon.png'),
                      ),
                      Text(
                        "CONTROLS",
                        style: TextStyle(fontSize: 10),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 10, left: 10),
                  child: Column(
                    //maintenance button
                    children: [
                      IconButton(
                        onPressed: () {
                          navToMaintenance(context);
                        },
                        icon: Image.asset('assets/images/maintenance_icon.png'),
                      ),
                      Text("MAINTENANCE", style: TextStyle(fontSize: 10))
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 20, left: 20),
                  child: Column(
                    //monitor button
                    children: [
                      IconButton(
                        onPressed: () {
                          navToMonitor(context);
                        },
                        icon: Image.asset('assets/images/monitor_icon.png'),
                      ),
                      Text(
                        "MONITOR",
                        style: TextStyle(fontSize: 10),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 20, left: 20),
                  child: Column(
                    //offset button
                    children: [
                      IconButton(
                        onPressed: () {
                          navToOffset(context);
                        },
                        icon: Image.asset('assets/images/offset_icon.png'),
                      ),
                      Text(
                        "OFFSET",
                        style: TextStyle(fontSize: 10),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color(0xff3d9970),
        child: Container(
          height: 50,
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: IconButton(
                icon: Icon(Icons.home),
                tooltip: 'Home Page',
                onPressed: () {
                  setState(() {});
                },
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: IconButton(
                icon: Icon(Icons.query_stats),
                tooltip: 'Monitoring Page',
                onPressed: () {
                  navToMonitor(context);
                },
                color: Color.fromARGB(255, 43, 108, 79),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: IconButton(
                icon: Icon(Icons.handyman),
                tooltip: 'Maintenance Page',
                onPressed: () {
                  navToMaintenance(context);
                },
                color: Color.fromARGB(255, 43, 108, 79),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: IconButton(
                icon: Icon(Icons.settings),
                tooltip: 'Settings Page',
                onPressed: () {
                  navToSettings(context);
                },
                color: Color.fromARGB(255, 43, 108, 79),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  void navToControls(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => Controls()));
  }

  void navToMaintenance(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => MaintenancePage()));
  }

  void navToMonitor(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => MonitorPage()));
  }

  void navToOffset(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => OffsetPage()));
  }

  void navToNotification(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => NotificationPage()));
  }

  void navToSettings(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => SettingsPage()));
  }
}
