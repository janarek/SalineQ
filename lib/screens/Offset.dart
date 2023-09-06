import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

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

class Offset {
  final int offset1;
  final int offset2;
  final String day;
  Offset(this.day, this.offset1, this.offset2);
}

class _OffsetPageState extends State<OffsetPage> {

  final List<Offset> offset = <Offset>[
    Offset('MONDAY', 120, 110),
    Offset('TUESDAY', 230, 205),
    Offset('WEDNESDAY', 70, 105),
    Offset('THURSDAY', 310, 270),
    Offset('FRIDAY', 60, 45),
    Offset('SATURDAY', 205, 175),
    Offset('SUNDAY', 130, 220),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {Navigator.pop(context);},
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
        body: SingleChildScrollView(
          child: Container(
            width: 400, 
            margin: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //Offset Graphical Data
                Container(
                  height: 400,
                  width: 350,
                  child: SfCartesianChart(
                    title: ChartTitle(
                      text: 'Offset Amount'
                    ),
                    legend: const Legend(
                      isVisible: true, 
                      position: LegendPosition.bottom,
                    ),
                    isTransposed: true,
                    primaryXAxis: CategoryAxis(
                      labelRotation: 90,
                    ),
                    series: <BarSeries<Offset, String>>[
                      BarSeries<Offset, String>(
                        name: 'Actual',
                        dataSource: offset,
                        xValueMapper: (Offset amount, _) => amount.day,
                        yValueMapper: (Offset amount, _) => amount.offset1,
                      ),
                      BarSeries<Offset, String>(
                        name: 'Estimated',
                        dataSource: offset,
                        xValueMapper: (Offset amount, _) => amount.day,
                        yValueMapper: (Offset amount, _) => amount.offset2,
                      ),
                    ],
                  ),
                ),
                //Numerical Offset Data
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: const Text('Total Offset Amount', style: TextStyle(fontSize: 20))
                ),
                Container(
                  width: 350,
                  margin: const EdgeInsets.only(top: 10),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('2463', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                          Text('All Time', style: TextStyle(fontSize: 10))
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('1236', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                          Text('Weekly', style: TextStyle(fontSize: 10))
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('826', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                          Text('Daily', style: TextStyle(fontSize: 10))
                        ],
                      ),
                    ],
                  ),
                ),
                //Total CO2E numerical
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text('Total Carbon Emission', style: TextStyle(fontSize: 20))
                ),
                Container(
                  width: 350,
                  margin: const EdgeInsets.only(top: 10),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('2463', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                          Text('All Time', style: TextStyle(fontSize: 10))
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('1236', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                          Text('Weekly', style: TextStyle(fontSize: 10))
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('826', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                          Text('Daily', style: TextStyle(fontSize: 10))
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
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