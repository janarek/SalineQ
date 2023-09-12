import 'package:flutter/material.dart';
import 'package:salineq/utils/connections.dart';
import 'package:salineq/widgets/bottom_nav_bar.dart';
import 'package:salineq/widgets/top_nav_bar.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Monitor extends StatelessWidget {

  const Monitor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return StreamBuilder(
        stream: getMonitorData(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {

          if (snapshot.connectionState != ConnectionState.active) {

            // Return what ur user sees when loading
            return const Center(child: CircularProgressIndicator());
          
          } else if (snapshot.hasError) {

            // Return what ur user sees when an error occurs
            return Center(child: Text("Something went wrong. ${snapshot.error}"));
          
          } else if (snapshot.hasData) {

            print(snapshot.data);

            // Return ur screen
            return MonitorPage(
              data: snapshot.data
            );
          
          } else {

            return Text('No Data found');
          
          }
        });
  
  }

}

class SalineProduced {

  final int timeTaken;
  final int totalProduced1;
  final int totalProduced2;

  const SalineProduced(this.timeTaken, this.totalProduced1, this.totalProduced2);

}

class MonitorPage extends StatefulWidget {

  const MonitorPage({
    Key? key,
    required this.data
  }) : super(key: key);

  final Map<String, dynamic> data;

  @override
  State<MonitorPage> createState() => _MonitorPageState();

}

class _MonitorPageState extends State<MonitorPage> {

  double saltPercentage = 10;
  final List<SalineProduced> salineProduced = <SalineProduced>[
    const SalineProduced(30, 100, 150),
    const SalineProduced(60, 150, 50),
    const SalineProduced(90, 90, 40),
    const SalineProduced(120, 180, 250),
    const SalineProduced(150, 300, 90),
    const SalineProduced(180, 350, 140),
    const SalineProduced(210, 280, 300),
    const SalineProduced(240, 70, 120),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: const TopNavbar(),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            width: 400,
            margin: const EdgeInsets.only(top: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Saline Composition (Per 100ml)', style: TextStyle(fontSize: 20)),
                Container(
                  width: 300,
                  margin: const EdgeInsets.only(top: 15),
                  child: LinearProgressIndicator(
                    minHeight: 20,
                    valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
                    backgroundColor: Colors.orange,
                    color: Colors.orange,
                    value: widget.data["water_percent"],
                  ),
                ),
                Container(
                  width: 250,
                  margin: const EdgeInsets.only(top: 15, bottom: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: 20,
                              width: 20,
                              color: Colors.blue,
                            ),
                            Text('WATER (${widget.data["water_percent"]}%)', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ),
                      Container(
                        width: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: 20,
                              width: 20,
                              color: Colors.orange,
                            ),
                            Text('SALT (${widget.data["salt_percent"]}%)', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                //SALT SLIDER
                const Text('Salt Percentage', 
                  textAlign: TextAlign.start, 
                  style: TextStyle(fontSize: 15),
                ),

                Container(
                  width: 350,
                  child: Slider(
                    value: saltPercentage,
                    max: 100,
                    divisions: 100,
                    label: saltPercentage.round().toString(),
                    thumbColor: const Color.fromARGB(255, 43, 108, 79),
                    activeColor: const Color.fromARGB(255, 43, 108, 79),
                    overlayColor: const MaterialStatePropertyAll<Color>(
                        Color.fromARGB(188, 72, 159, 120)),
                    inactiveColor: const Color.fromARGB(144, 96, 205, 156),
                    onChanged: (double svalue) {

                      setState(() {

                        saltPercentage = svalue;
                      });
                    },
                  ),
                ),
                Container(
                  width: 300,
                  margin: const EdgeInsets.only(bottom: 20),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('0%'),
                      // ElevatedButton(
                      //   onPressed: () {},
                      //   child: const Text('SET',
                      //     style: TextStyle(fontSize: 10, color: Colors.white),
                      //   ),
                      //   style: ElevatedButton.styleFrom(
                      //     fixedSize: const Size(20, 10),
                      //     shape: LinearBorder(),
                      //     backgroundColor: const Color.fromARGB(255, 43, 108, 79),
                      //   ),
                      // ),
                      Text('100%'),
                    ],
                  ),
                ),
                const Text('Current Batch (Batch No: 164)',
                  style: TextStyle(fontSize: 19),
                ),
                //TASK CONSUMPTION
                Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: 300,
                      child: Container(
                        width: 300,
                        margin: const EdgeInsets.only(top:5, bottom: 5),
                        child: LinearProgressIndicator(
                          // borderRadius: BorderRadius.all(Radius.circular(10)),
                          minHeight: 25,
                          backgroundColor: Color.fromARGB(255, 168, 218, 195),
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Color.fromARGB(255, 43, 108, 79)),
                          value: widget.data["batch_percent"],
                        ),
                      ),
                    ),
                    Container(
                      width: 270,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('TASK:',
                            style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                          Text('${widget.data["batch_percent"]}%',
                            style: const TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ]
                      ),
                    ),
                  ]
                ),
                //ENERGY CONSUMPTION
                Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: 300,
                      child: Container(
                        width: 300,
                        margin: const EdgeInsets.only(top:5, bottom: 5),
                        child: LinearProgressIndicator(
                          // borderRadius: BorderRadius.all(Radius.circular(10)),
                          minHeight: 25,
                          backgroundColor: Color.fromARGB(255, 168, 218, 195),
                          valueColor:
                              AlwaysStoppedAnimation<Color>(const Color.fromARGB(255, 43, 108, 79)),
                          value: widget.data["energy_consume"],
                        ),
                      ),
                    ),
                    Container(
                      width: 270,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('ENERGY CONSUMPTION:',
                            style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                          Text('${widget.data["energy_consume"]}%',
                            style: const TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ]
                      ),
                    ),
                  ]
                ),
                //WATER CONSUMPTION
                Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: 300,
                      child: Container(
                        width: 300,
                        margin: const EdgeInsets.only(top:5, bottom: 5),
                        child: const LinearProgressIndicator(
                          // borderRadius: BorderRadius.all(Radius.circular(10)),
                          minHeight: 25,
                          backgroundColor: Color.fromARGB(255, 168, 218, 195),
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Color.fromARGB(255, 43, 108, 79)),
                          value: 0.9,
                        ),
                      ),
                    ),
                    Container(
                      width: 270,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('WATER CONSUMPTION:',
                            style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                          Text('90%',
                            style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ]
                      ),
                    ),
                  ]
                ),
                //SALT CONSUMPTION
                Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: 300,
                      child: Container(
                        width: 300,
                        margin: const EdgeInsets.only(top:5, bottom: 5),
                        child: const LinearProgressIndicator(
                          // borderRadius: BorderRadius.all(Radius.circular(10)),
                          minHeight: 25,
                          backgroundColor: Color.fromARGB(255, 168, 218, 195),
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Color.fromARGB(255, 43, 108, 79)),
                          value: 0.9,
                        ),
                      ),
                    ),
                    Container(
                      width: 270,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('SALT CONSUMPTION:',
                            style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                          Text('90%',
                            style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ]
                      ),
                    ),
                  ]
                ),
                //Numbers of energy, water and salt consumption
                Container(
                  width: 220,
                  margin: const EdgeInsets.only(top: 10),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('2463', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
                      Text('1236', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
                      Text('826', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold))
                    ],
                  ),
                ),
                //Labels for energy, water and salt consumption
                Container(
                  width: 300,
                  margin: const EdgeInsets.only(bottom: 40),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Energy Consumed (kw/h)', style: TextStyle(fontSize: 10)),
                      Text('Water Consumed (L)', style: TextStyle(fontSize: 10)),
                      Text('Salt Consumed (L)', style: TextStyle(fontSize: 10))
                    ],
                  ),
                ),
                //Amount of Saline Produced in Graphical data
                const Text('Saline Produced',
                  style: TextStyle(fontSize: 15),
                ),
                Container(
                  width: 350,
                  margin: const EdgeInsets.only(top:10),
                  child: SfCartesianChart(
                    primaryXAxis: CategoryAxis(
                      title: AxisTitle(text: 'Time taken (min)')
                    ),
                    series: <ChartSeries>[
                      SplineAreaSeries<SalineProduced, int> (
                        dataSource: salineProduced,
                        xValueMapper: (SalineProduced data, _) => data.timeTaken,
                        yValueMapper: (SalineProduced data, _) => data.totalProduced1
                      ),
                      SplineAreaSeries<SalineProduced, int> (
                        dataSource: salineProduced,
                        xValueMapper: (SalineProduced data, _) => data.timeTaken,
                        yValueMapper: (SalineProduced data, _) => data.totalProduced2
                      ),
                    ]
                  ),
                ),
                //Resources Left

                Container(
                width: 375,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 20, top:40),
                      child: const Text('Resources Left', style: TextStyle(fontSize: 17))),
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
                                      child: CircularProgressIndicator(
                                        strokeWidth: 12,
                                        value: widget.data["salt_resource"],
                                        valueColor: const AlwaysStoppedAnimation<Color>(Colors.grey),
                                        backgroundColor: const Color.fromARGB(255, 187, 187, 187),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text('${widget.data["salt_resource"]}%',
                                      style: const TextStyle(
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
                              child: const Text('SALT',
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
                                      child: CircularProgressIndicator(
                                        strokeWidth: 12,
                                        value: widget.data["water_resource"],
                                        valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
                                        backgroundColor: const Color.fromARGB(255, 125, 191, 252),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text('${widget.data["water_resource"]}%',
                                      style: const TextStyle(
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
                              child: const Text('WATER',
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
                                      child: CircularProgressIndicator(
                                        strokeWidth: 12,
                                        value: widget.data["bottle_resource"],
                                        valueColor: const AlwaysStoppedAnimation<Color>(Color.fromARGB(255, 222, 21, 169)),
                                        backgroundColor: const Color.fromARGB(255, 227, 156, 220)
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text('${widget.data["bottle_resource"]}%',
                                      style: const TextStyle(
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
                              child: const Text('BOTTLES',
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
        bottomNavigationBar: BottomNavBar(),
      );
  
  }
}