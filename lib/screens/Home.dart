import 'package:flutter/material.dart';
import '../utils/connections.dart';
import '../utils/navigation.dart';
import '../widgets/bottom_nav_bar.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Home extends StatelessWidget {

  const Home({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return StreamBuilder(
      stream: getHomeData(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {

        if (snapshot.connectionState != ConnectionState.active) {

          // Return what ur user sees when loading
          return const Center(child: CircularProgressIndicator());
        
        } else if (snapshot.hasError) {

          // Return what ur user sees when an error occurs
          return Center(
            child: Text("Something went wrong. ${snapshot.error}")
          );
        
        } else if (snapshot.hasData) {

          print(snapshot.data);

          // Return ur screen
          return HomePage();
        
        } else {

          return Text('No Data found');
        
        }

      }
    );
  
  }

}

class C02E {

  C02E(this.time, this.c02e);
  
  final double c02e;
  final String time;

}

class HomePage extends StatefulWidget {

  const HomePage({ Key? key }) : super(key: key);

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
        margin: const EdgeInsets.only(top: 20, bottom: 20),
        width: 400,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text('Current CO2e',
                  style: TextStyle(
                      fontSize: 22, color: Color.fromARGB(255, 43, 108, 79))),
              // LINE CHART
              Container(
                height: 350,
                width: 350,
                margin: const EdgeInsets.only(top: 20, bottom: 20),
                child: SfCartesianChart(
                  primaryXAxis: CategoryAxis(
                    title: AxisTitle(text: 'Time (24hr)')
                  ),
                  primaryYAxis: CategoryAxis(
                    title: AxisTitle(text: 'Amount of carbon emission')
                  ),
                  palette: const <Color>[Color.fromARGB(255, 43, 108, 79)],
                  // legend: const Legend(isVisible: true),
                  series: <LineSeries<C02E, String>>[
                    LineSeries<C02E, String>(
                      dataSource: <C02E>[
                        C02E('0000', 0),
                        C02E('0400', 0),
                        C02E('0800', 50),
                        C02E('1200', 100),
                        C02E('1600', 200),
                        C02E('2000', 150),
                        C02E('2400', 0)
                      ],
                      yValueMapper: (C02E c02e, _) => c02e.c02e,
                      xValueMapper: (C02E c02e, _) => c02e.time,
                      dataLabelSettings:
                          const DataLabelSettings(isVisible: true),
                    )
                  ],
                ),
              ),
              Container(
                height: 70,
                width: 300,
                margin: const EdgeInsets.only(bottom: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text('Current OEE',
                        style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 43, 108, 79))),
                    Container(
                      margin: const EdgeInsets.only(top:5, bottom: 5),
                      child: const LinearProgressIndicator(
                        // borderRadius: BorderRadius.all(Radius.circular(10)),
                        minHeight: 20,
                        backgroundColor: Color.fromARGB(255, 131, 181, 158),
                        valueColor:
                            AlwaysStoppedAnimation<Color>(Color.fromARGB(255, 43, 108, 79)),
                        value: 0.9,
                      ),
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('0%', style: TextStyle(fontSize: 12),),
                        Text('100%', style: TextStyle(fontSize: 12))
                      ],
                    ),
                  ],
                ),
              ),
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
                          icon:
                              Image.asset('assets/images/controls_icon.png'),
                        ),
                        const Text(
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
                          icon: Image.asset(
                              'assets/images/maintenance_icon.png'),
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
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  
  }

  // void navToControls(BuildContext context) {
  //   Navigator.of(context)
  //       .push(MaterialPageRoute(builder: (context) => ControlsPage()));
  // }

  // void navToMaintenance(BuildContext context) {
  //   Navigator.of(context)
  //       .push(MaterialPageRoute(builder: (context) => MaintenancePage()));
  // }

  // void navToMonitor(BuildContext context) {
  //   Navigator.of(context)
  //       .push(MaterialPageRoute(builder: (context) => MonitorPage()));
  // }

  // void navToOffset(BuildContext context) {
  //   Navigator.of(context)
  //       .push(MaterialPageRoute(builder: (context) => OffsetPage()));
  // }

  // void navToNotification(BuildContext context) {
  //   Navigator.of(context)
  //       .push(MaterialPageRoute(builder: (context) => NotificationPage()));
  // }

  // void navToSettings(BuildContext context) {
  //   Navigator.of(context)
  //       .push(MaterialPageRoute(builder: (context) => SettingsPage()));
  // }
}
