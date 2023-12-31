import 'package:flutter/material.dart';
import '../utils/connections.dart';
import '../utils/navigation.dart';
import '../widgets/bottom_nav_bar.dart';

class Maintenance extends StatelessWidget {
  const Maintenance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: getMaintenanceData(),
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
            return MaintenancePage();
          } else {
            return Text('No Data found');
          }
        });
  }
}

class MaintenancePage extends StatefulWidget {
  const MaintenancePage({ Key? key }) : super(key: key);

  @override
  State<MaintenancePage> createState() => _MaintenancePageState();
}

class _MaintenancePageState extends State<MaintenancePage> {
  // late AnimationController controller;
  // @override
  // void initState() {
  //   controller = AnimationController(
  //     vsync: this,
  //     duration: const Duration(seconds: 15)
  //   );

  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
          tooltip: 'Go back',
          iconSize: 30,
          padding: const EdgeInsets.only(left: 15),
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
            icon: const Icon(Icons.notifications),
            tooltip: 'Notifications',
            iconSize: 30,
            padding: EdgeInsets.only(right: 15),
          )
        ],
        backgroundColor: Color.fromARGB(205, 60, 60, 60),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top:50, bottom: 50),
          width: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Predicted Upcoming Maintenance',
                  style: TextStyle(
                      fontSize: 22, color: Color.fromARGB(255, 43, 108, 79))),
              Container(
                padding: const EdgeInsets.only(top: 25),
                width: 250,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 250,
                      padding: const EdgeInsets.only(bottom: 10),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Water',
                            style: TextStyle(fontSize: 15),
                          ),
                          Text('40%', style: TextStyle(fontSize: 15)),
                        ],
                      ),
                    ),
                    const LinearProgressIndicator(
                      minHeight: 20,
                      backgroundColor: Color.fromARGB(255, 254, 203, 127),
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
                      value: 0.9,
                    ),
                    Container(
                      width: 250,
                      padding: const EdgeInsets.only(top: 10),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'To be maintained by:',
                            style: TextStyle(fontSize: 13),
                          ),
                          Text('DD/MM/YY',
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Color.fromARGB(255, 43, 108, 79))),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: const Color.fromARGB(255, 43, 108, 79),
                width: 300,
                height: 1,
                margin: const EdgeInsets.only(top: 12),
              ),
              Container(
                padding: EdgeInsets.only(top: 15),
                width: 250,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 250,
                      padding: EdgeInsets.only(bottom: 10),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Water',
                            style: TextStyle(fontSize: 15),
                          ),
                          Text('40%', style: TextStyle(fontSize: 15)),
                        ],
                      ),
                    ),
                    const LinearProgressIndicator(
                      minHeight: 20,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.yellow),
                      backgroundColor: Color.fromARGB(255, 245, 255, 140),
                      value: 0.9,
                    ),
                    Container(
                      width: 250,
                      padding: const EdgeInsets.only(top: 10),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'To be maintained by:',
                            style: TextStyle(fontSize: 13),
                          ),
                          Text('DD/MM/YY',
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Color.fromARGB(255, 43, 108, 79))),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: const Color.fromARGB(255, 43, 108, 79),
                width: 300,
                height: 1,
                margin: const EdgeInsets.only(top: 12),
              ),
              Container(
                padding: EdgeInsets.only(top: 15),
                width: 250,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 250,
                      padding: EdgeInsets.only(bottom: 10),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Software Update to version 1.17',
                            style: TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 250,
                      padding: const EdgeInsets.only(top: 10),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'To be maintained by:',
                            style: TextStyle(fontSize: 13),
                          ),
                          Text(
                            'DD/MM/YY',
                            style: TextStyle(
                                fontSize: 13,
                                color: Color.fromARGB(255, 43, 108, 79)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: const Color.fromARGB(255, 43, 108, 79),
                width: 300,
                height: 1,
                margin: const EdgeInsets.only(top: 15, bottom: 50),
              ),
              // OEE
              Container(
                width: 375,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      child: const Text('Overall Equipment Effectiveness', style: TextStyle(fontSize: 17))),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              height: 80.0,
                              width: 80.0,
                              child: Stack(
                                children: <Widget>[
                                  Center(
                                    child: Container(
                                      height: 80,
                                      width: 80,
                                      child: const CircularProgressIndicator(
                                        strokeWidth: 12,
                                        value: 0.9,
                                        valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
                                        backgroundColor: Color.fromARGB(255, 254, 203, 127),
                                      ),
                                    ),
                                  ),
                                  const Align(
                                    alignment: Alignment.center,
                                    child: Text('90%',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold, 
                                        fontSize: 18,
                                      )
                                    )
                                  )
                                ],
                              )
                            ),
                            Container(
                              margin: const EdgeInsets.only(top:15),
                              child: const Text('AVAILABILITY',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: 80.0,
                              width: 80.0,
                              child: Stack(
                                children: <Widget>[
                                  Center(
                                    child: Container(
                                      height: 80,
                                      width: 80,
                                      child: const CircularProgressIndicator(
                                        strokeWidth: 12,
                                        value: 0.9,
                                        valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                                        backgroundColor: Color.fromARGB(255, 145, 195, 255),
                                      ),
                                    ),
                                  ),
                                  const Align(
                                    alignment: Alignment.center,
                                    child: Text('90%',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold, 
                                        fontSize: 18,
                                      )
                                    )
                                  )
                                ],
                              )
                            ),
                            Container(
                              margin: const EdgeInsets.only(top:15),
                              child: const Text('PERFORMANCE',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: 80.0,
                              width: 80.0,
                              child: Stack(
                                children: <Widget>[
                                  Center(
                                    child: Container(
                                      height: 80,
                                      width: 80,
                                      child: const CircularProgressIndicator(
                                        strokeWidth: 12,
                                        value: 0.9,
                                        valueColor: AlwaysStoppedAnimation<Color>(Colors.purple),
                                        backgroundColor: Color.fromARGB(255, 209, 142, 253),
                                      ),
                                    ),
                                  ),
                                  const Align(
                                    alignment: Alignment.center,
                                    child: Text('90%',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold, 
                                        fontSize: 18,
                                      )
                                    )
                                  )
                                ],
                              )
                            ),
                            Container(
                              margin: const EdgeInsets.only(top:15),
                              child: const Text('QUALITY',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Estimated OEE
              Container(
                width: 375,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 20, top: 40),
                      child: const Text('Estimated OEE after maintenance', style: TextStyle(fontSize: 17))),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              height: 80.0,
                              width: 80.0,
                              child: Stack(
                                children: <Widget>[
                                  Center(
                                    child: Container(
                                      height: 80,
                                      width: 80,
                                      child: const CircularProgressIndicator(
                                        strokeWidth: 12,
                                        value: 1,
                                        valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                  const Align(
                                    alignment: Alignment.center,
                                    child: Text('100%',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold, 
                                        fontSize: 18,
                                      )
                                    )
                                  )
                                ],
                              )
                            ),
                            Container(
                              margin: const EdgeInsets.only(top:15),
                              child: const Text('AVAILABILITY',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: 80.0,
                              width: 80.0,
                              child: Stack(
                                children: <Widget>[
                                  Center(
                                    child: Container(
                                      height: 80,
                                      width: 80,
                                      child: const CircularProgressIndicator(
                                        strokeWidth: 12,
                                        value: 1,
                                        valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                  const Align(
                                    alignment: Alignment.center,
                                    child: Text('100%',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold, 
                                        fontSize: 18,
                                      )
                                    )
                                  )
                                ],
                              )
                            ),
                            Container(
                              margin: const EdgeInsets.only(top:15),
                              child: const Text('PERFORMANCE',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: 80.0,
                              width: 80.0,
                              child: Stack(
                                children: <Widget>[
                                  Center(
                                    child: Container(
                                      height: 80,
                                      width: 80,
                                      child: const CircularProgressIndicator(
                                        strokeWidth: 12,
                                        value: 1,
                                        valueColor: AlwaysStoppedAnimation<Color>(Colors.purple),
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                  const Align(
                                    alignment: Alignment.center,
                                    child: Text('100%',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold, 
                                        fontSize: 18,
                                      )
                                    )
                                  )
                                ],
                              )
                            ),
                            Container(
                              margin: const EdgeInsets.only(top:15),
                              child: const Text('QUALITY',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
