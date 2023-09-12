import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'Monitor.dart';
import 'Settings.dart';
import 'Home.dart';
import 'Maintenance.dart';
import 'Notifications.dart';

class Controls extends StatelessWidget {
  const Controls({Key? key}) : super(key: key);

  Stream<Map<String, dynamic>> getData() async* {
    while (true) {
      Response response = await get(Uri(
        scheme: "http",
        host: '10.0.2.2',
        port: 5000,
        path: "/getControlsData"));

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
            return ControlsPage();
          } else {
            return Text('No Data found');
          }
        });
  }
}

class ControlsPage extends StatefulWidget {
  const ControlsPage({Key? key}) : super(key: key);

  @override
  State<ControlsPage> createState() => _ControlsPageState();
}

class _ControlsPageState extends State<ControlsPage> {
  bool light = true;
  double saltWaterValue = 20;
  double waterValue = 20;
  double electricityValue = 20;
  double temperatureValue = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
          tooltip: 'Go back',
          iconSize: 30,
          padding: EdgeInsets.only(left: 15),
        ),
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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text('Controls',
              style: TextStyle(
                  fontSize: 25, color: Color.fromARGB(255, 43, 108, 79))),
          OverflowBar(
            alignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    'START',
                    style: TextStyle(fontSize: 10),
                    textAlign: TextAlign.center,
                  ),
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(55, 55),
                      shape: const CircleBorder(),
                      backgroundColor: Colors.green)),
              ElevatedButton(
                  onPressed: () {},
                  child: const Text('RESET',
                      style: TextStyle(fontSize: 10, color: Colors.black),
                      textAlign: TextAlign.center),
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(55, 55),
                      shape: const CircleBorder(),
                      backgroundColor: Colors.yellow)),
              ElevatedButton(
                  onPressed: () {},
                  child: const Text('STOP TASK',
                      style: TextStyle(fontSize: 10),
                      textAlign: TextAlign.center),
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(55, 55),
                      shape: const CircleBorder(),
                      backgroundColor: Colors.orange)),
              ElevatedButton(
                  onPressed: () {},
                  child: const Text('E-STOP',
                      style: TextStyle(fontSize: 10),
                      textAlign: TextAlign.center),
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(55, 55),
                      shape: const CircleBorder(),
                      backgroundColor: Colors.red)),
            ],
          ),
          Container(
            width: 300,
            height: 30,
            decoration: BoxDecoration(
              border: Border.all(width: 0.5),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Salt Water Valve'),
                Switch(
                  value: light,
                  overlayColor: const MaterialStatePropertyAll<Color>(
                      Color.fromARGB(255, 43, 108, 79)),
                  inactiveTrackColor: Colors.grey,
                  activeTrackColor: const Color.fromARGB(255, 43, 108, 79),
                  thumbColor:
                      const MaterialStatePropertyAll<Color>(Colors.white),
                  onChanged: (bool value) {
                    setState(() {
                      light = value;
                    });
                  },
                )
              ],
            ),
          ),
          Container(
            width: 340,
            child: Column(
              children: [
                Container(
                  width: 290,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('0 PSI'),
                      Text('150 PSI'),
                    ],
                  ),
                ),
                Slider(
                  value: saltWaterValue,
                  max: 150,
                  divisions: 150,
                  label: saltWaterValue.round().toString(),
                  thumbColor: const Color.fromARGB(255, 43, 108, 79),
                  activeColor: const Color.fromARGB(255, 43, 108, 79),
                  overlayColor: const MaterialStatePropertyAll<Color>(
                      Color.fromARGB(188, 72, 159, 120)),
                  inactiveColor: Color.fromARGB(144, 96, 205, 156),
                  onChanged: (double svalue) {
                    setState(() {
                      saltWaterValue = svalue;
                    });
                  },
                ),
              ],
            ),
          ),
          Container(
            width: 300,
            height: 30,
            decoration: BoxDecoration(
              border: Border.all(width: 0.5),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Water Valve'),
                Switch(
                  value: light,
                  overlayColor: const MaterialStatePropertyAll<Color>(
                      Color.fromARGB(255, 43, 108, 79)),
                  inactiveTrackColor: Colors.grey,
                  activeTrackColor: const Color.fromARGB(255, 43, 108, 79),
                  thumbColor:
                      const MaterialStatePropertyAll<Color>(Colors.white),
                  onChanged: (bool value) {
                    setState(() {
                      light = value;
                    });
                  },
                )
              ],
            ),
          ),
          Container(
            width: 340,
            child: Column(
              children: [
                Container(
                  width: 290,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('0 PSI'),
                      Text('150 PSI'),
                    ],
                  ),
                ),
                Slider(
                  value: waterValue,
                  max: 150,
                  divisions: 150,
                  label: waterValue.round().toString(),
                  thumbColor: const Color.fromARGB(255, 43, 108, 79),
                  activeColor: const Color.fromARGB(255, 43, 108, 79),
                  overlayColor: const MaterialStatePropertyAll<Color>(
                      Color.fromARGB(188, 72, 159, 120)),
                  inactiveColor: Color.fromARGB(144, 96, 205, 156),
                  onChanged: (double svalue) {
                    setState(() {
                      waterValue = svalue;
                    });
                  },
                ),
              ],
            ),
          ),
          Container(
            width: 300,
            height: 30,
            decoration: BoxDecoration(
              border: Border.all(width: 0.5),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Electricity'),
                Switch(
                  value: light,
                  overlayColor: const MaterialStatePropertyAll<Color>(
                      Color.fromARGB(255, 43, 108, 79)),
                  inactiveTrackColor: Colors.grey,
                  activeTrackColor: const Color.fromARGB(255, 43, 108, 79),
                  thumbColor:
                      const MaterialStatePropertyAll<Color>(Colors.white),
                  onChanged: (bool value) {
                    setState(() {
                      light = value;
                    });
                  },
                )
              ],
            ),
          ),
          Container(
            width: 340,
            child: Column(
              children: [
                Container(
                  width: 290,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('0W'),
                      Text('150W'),
                    ],
                  ),
                ),
                Slider(
                  value: electricityValue,
                  max: 150,
                  divisions: 150,
                  label: electricityValue.round().toString(),
                  thumbColor: const Color.fromARGB(255, 43, 108, 79),
                  activeColor: const Color.fromARGB(255, 43, 108, 79),
                  overlayColor: const MaterialStatePropertyAll<Color>(
                      Color.fromARGB(188, 72, 159, 120)),
                  inactiveColor: Color.fromARGB(144, 96, 205, 156),
                  onChanged: (double svalue) {
                    setState(() {
                      electricityValue = svalue;
                    });
                  },
                ),
              ],
            ),
          ),
          Container(
            width: 300,
            height: 30,
            decoration: BoxDecoration(
              border: Border.all(width: 0.5),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Temperature'),
                Switch(
                  value: light,
                  overlayColor: const MaterialStatePropertyAll<Color>(
                      Color.fromARGB(255, 43, 108, 79)),
                  inactiveTrackColor: Colors.grey,
                  activeTrackColor: const Color.fromARGB(255, 43, 108, 79),
                  thumbColor:
                      const MaterialStatePropertyAll<Color>(Colors.white),
                  onChanged: (bool value) {
                    setState(() {
                      light = value;
                    });
                  },
                )
              ],
            ),
          ),
          Container(
            width: 340,
            child: Column(
              children: [
                Container(
                  width: 290,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('0°C'),
                      const Text('100°C'),
                    ],
                  ),
                ),
                Slider(
                  value: temperatureValue,
                  max: 100,
                  divisions: 100,
                  label: temperatureValue.round().toString(),
                  thumbColor: const Color.fromARGB(255, 43, 108, 79),
                  activeColor: const Color.fromARGB(255, 43, 108, 79),
                  overlayColor: const MaterialStatePropertyAll<Color>(
                      Color.fromARGB(188, 72, 159, 120)),
                  inactiveColor: Color.fromARGB(144, 96, 205, 156),
                  onChanged: (double svalue) {
                    setState(() {
                      temperatureValue = svalue;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      )),
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
                  navToHome(context);
                },
                color: Color.fromARGB(255, 43, 108, 79),
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

  void navToSettings(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => SettingsPage()));
  }

  void navToMonitor(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => MonitorPage()));
  }

  void navToHome(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()));
  }

  void navToMaintenance(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => MaintenancePage()));
  }

  void navToNotification(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => NotificationPage()));
  }
}
