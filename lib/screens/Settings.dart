import 'package:flutter/material.dart';
import '../utils/navigation.dart';
import '../widgets/bottom_nav_bar.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({ Key? key }) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

// enum SendNoti {on, off}
List<String> dropdown = <String>['Immediately', 'After Task', 'After Current Batch'];

class _SettingsPageState extends State<SettingsPage> {
  bool autoStop = true;
  // SendNoti? _noti = SendNoti.on;
  bool sendNoti = true;
  bool energySave = false;
  bool runBg = true;
  String dropdownItem = dropdown.first;

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
          scrollDirection: Axis.vertical,
          child: Container(
            width: 400,
            margin: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Signed in User layout
                Container(
                  width: 350,
                  height: 150,
                  color: const Color.fromARGB(255, 187, 222, 187),
                  child: Image.asset('assets/images/default_pp.jpg'),
                ),
                Container(
                  width: 350,
                  height: 90,
                  color: const Color.fromARGB(255, 228, 255, 228),
                  child: Container(
                    width: 300,
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Juan Dela Cruz',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                            Text('Admin'),
                          ],
                        ),
                        ElevatedButton(
                          onPressed: () {}, 
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(255, 43, 108, 79),
                          ),
                          child: const Text('SIGN OUT',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                //App Settings
                //Auto stop task on Reset
                Container(
                  width: 300,
                  margin: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Auto stop task on reset',
                        style: TextStyle(fontSize: 15),
                      ),
                      Switch(
                        value: autoStop,
                        overlayColor: const MaterialStatePropertyAll<Color>(
                            Color.fromARGB(255, 43, 108, 79)),
                        inactiveTrackColor: Colors.grey,
                        activeTrackColor: const Color.fromARGB(255, 43, 108, 79),
                        thumbColor:
                            const MaterialStatePropertyAll<Color>(Colors.white),
                        onChanged: (bool value) {
                          setState(() {
                            autoStop = value;
                          });
                        },
                      )
                    ],
                  ),
                ),
                //Line
                Container(
                  width: 300,
                  height: 1,
                  margin: const EdgeInsets.only(bottom: 5),
                  color: const Color(0xff3d9970),
                ),
                //Send notifications
                Container(
                  width: 300,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Send Notifications', style: TextStyle(fontSize: 15)),
                      Switch(
                        value: sendNoti,
                        overlayColor: const MaterialStatePropertyAll<Color>(
                            Color.fromARGB(255, 43, 108, 79)),
                        inactiveTrackColor: Colors.grey,
                        activeTrackColor: const Color.fromARGB(255, 43, 108, 79),
                        thumbColor:
                            const MaterialStatePropertyAll<Color>(Colors.white),
                        onChanged: (bool value) {
                          setState(() {
                            sendNoti = value;
                          });
                        },
                      )
                    ],
                  ),
                ),
                Container(
                  width: 300,
                  height: 1,
                  margin: const EdgeInsets.only(bottom: 15),
                  color: const Color(0xff3d9970),
                ),
                //Dropdown
                Container(
                  width: 300,
                  margin: EdgeInsets.only(bottom: 10),
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Set timer when stop button is pushed',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ),
                DropdownMenu(
                  width: 250,
                  initialSelection: dropdown.first,
                  onSelected: (String? value) {
                    setState(() {
                      dropdownItem = value!;
                    });
                  },
                  dropdownMenuEntries: dropdown.map<DropdownMenuEntry<String>>((String value){
                    return DropdownMenuEntry(value: value, label: value);
                  }).toList(),
                ),
                Container(
                  width: 300,
                  height: 1,
                  margin: const EdgeInsets.only(bottom: 5, top: 15),
                  color: const Color(0xff3d9970),
                ),
                //Energy Saving
                Container(
                  width: 300,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Energy Saving Mode', style: TextStyle(fontSize: 15)),
                      Switch(
                        value: energySave,
                        overlayColor: const MaterialStatePropertyAll<Color>(
                            Color.fromARGB(255, 43, 108, 79)),
                        inactiveTrackColor: Colors.grey,
                        activeTrackColor: const Color.fromARGB(255, 43, 108, 79),
                        thumbColor:
                            const MaterialStatePropertyAll<Color>(Colors.white),
                        onChanged: (bool value) {
                          setState(() {
                            energySave = value;
                          });
                        },
                      )
                    ],
                  ),
                ),
                Container(
                  width: 300,
                  height: 1,
                  margin: const EdgeInsets.only(bottom: 5),
                  color: const Color(0xff3d9970),
                ),
                // Run in Background
                Container(
                  width: 300,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Run in background', style: TextStyle(fontSize: 15)),
                      Switch(
                        value: runBg,
                        overlayColor: const MaterialStatePropertyAll<Color>(
                            Color.fromARGB(255, 43, 108, 79)),
                        inactiveTrackColor: Colors.grey,
                        activeTrackColor: const Color.fromARGB(255, 43, 108, 79),
                        thumbColor:
                            const MaterialStatePropertyAll<Color>(Colors.white),
                        onChanged: (bool value) {
                          setState(() {
                            runBg = value;
                          });
                        },
                      )
                    ],
                  ),
                ),
              ],
            )
          ),
        ),
        bottomNavigationBar: BottomNavBar(),
      );
  }
}