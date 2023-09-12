import 'package:flutter/material.dart';
import 'package:carnone/utils/connections.dart';
import 'package:carnone/widgets/bottom_nav_bar.dart';
import 'package:carnone/widgets/top_nav_bar.dart';

class Controls extends StatelessWidget {

  const Controls({ Key? key 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future: getControlsData(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {

        if (snapshot.connectionState != ConnectionState.done) {

          // Return what ur user sees when loading
          return const Center(child: CircularProgressIndicator());
        
        } else if (snapshot.hasError) {

          // Return what ur user sees when an error occurs
          return Center(
              child: Text("Something went wrong. ${snapshot.error}"));
        
        } else if (snapshot.hasData) {

          // Return ur screen
          return ControlsPage(data: snapshot.data);
        
        } else {

          return Text('No Data found');
        
        }
      
      }
    );
  
  }

}

class ControlsPage extends StatefulWidget {

  const ControlsPage({
    Key? key,
    required this.data
  
  }) : super(key: key);

  final Map<String, dynamic> data;

  @override
  State<ControlsPage> createState() => _ControlsPageState();

}

class _ControlsPageState extends State<ControlsPage> {

  bool saltWaterValve = false;
  bool waterValve = false;
  bool electricitySwitch = false;
  bool temperatureSwitch = false;
  double saltWaterValue = 20;
  double waterValue = 20;
  double electricityValue = 0.0;
  double temperatureValue = 0.0;

  double toDouble(dynamic e) =>
   e is! double ?
    e.toDouble() :
    e;

  @override
  initState() {
    super.initState();

    saltWaterValve = widget.data["salt_valve"];
    waterValve = widget.data["water_valve"];

    electricityValue = toDouble(widget.data["electricity"]);
    temperatureValue = toDouble(widget.data["temperature"]);

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: const TopNavbar(),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              'Controls',
              style: TextStyle(
                fontSize: 25,
                color: Color.fromARGB(255, 43, 108, 79)
              )
            ),
            OverflowBar(
              alignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {

                    },
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
                    onPressed: () {

                    },
                    child: const Text('RESET',
                        style: TextStyle(fontSize: 10, color: Colors.black),
                        textAlign: TextAlign.center),
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(55, 55),
                        shape: const CircleBorder(),
                        backgroundColor: Colors.yellow)),
                ElevatedButton(
                    onPressed: () {

                    },
                    child: const Text('STOP TASK',
                        style: TextStyle(fontSize: 10),
                        textAlign: TextAlign.center),
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(55, 55),
                        shape: const CircleBorder(),
                        backgroundColor: Colors.orange)),
                ElevatedButton(
                    onPressed: () {

                    },
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
                    value: saltWaterValve,
                    overlayColor: const MaterialStatePropertyAll<Color>(
                        Color.fromARGB(255, 43, 108, 79)),
                    inactiveTrackColor: Colors.grey,
                    activeTrackColor: const Color.fromARGB(255, 43, 108, 79),
                    thumbColor:
                        const MaterialStatePropertyAll<Color>(Colors.white),
                    onChanged: (bool value) {

                      setState(() {

                        saltWaterValve = value;
                      
                      });

                      setControlData({
                        "SaltValve": value
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
                    value: waterValve,
                    overlayColor: const MaterialStatePropertyAll<Color>(
                        Color.fromARGB(255, 43, 108, 79)),
                    inactiveTrackColor: Colors.grey,
                    activeTrackColor: const Color.fromARGB(255, 43, 108, 79),
                    thumbColor:
                        const MaterialStatePropertyAll<Color>(Colors.white),
                    onChanged: (bool value) {

                      setState(() {

                        waterValve = value;

                      });

                      setControlData({
                        "WaterValve": value
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
                    value: electricitySwitch,
                    overlayColor: const MaterialStatePropertyAll<Color>(
                        Color.fromARGB(255, 43, 108, 79)),
                    inactiveTrackColor: Colors.grey,
                    activeTrackColor: const Color.fromARGB(255, 43, 108, 79),
                    thumbColor:
                        const MaterialStatePropertyAll<Color>(Colors.white),
                    onChanged: (bool value) {

                      setState(() {

                        electricitySwitch = value;
                      
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

                      setControlData({
                        "Electricity": svalue.toInt()
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
                    value: temperatureSwitch,
                    overlayColor: const MaterialStatePropertyAll<Color>(
                        Color.fromARGB(255, 43, 108, 79)),
                    inactiveTrackColor: Colors.grey,
                    activeTrackColor: const Color.fromARGB(255, 43, 108, 79),
                    thumbColor:
                        const MaterialStatePropertyAll<Color>(Colors.white),
                    onChanged: (bool value) {

                      setState(() {

                        electricitySwitch = value;
                      
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

                      setControlData({
                        "Temperature": svalue.toInt()
                      });
                    
                    },
                  ),
                ],
              ),
            ),
          ],
        )
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  
  }
}
