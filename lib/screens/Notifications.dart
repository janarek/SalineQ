import 'package:flutter/material.dart';
import 'package:salineq/widgets/bottom_nav_bar.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({ Key? key }) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
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
              onPressed: () {setState(() {});},
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
            margin: const EdgeInsets.only(top: 20, bottom: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 320,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Notifications',
                        style: TextStyle(fontSize: 25),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 43, 108, 79),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                        onPressed: () {}, 
                        child: const Text('CLEAR ALL',
                          style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white),
                        )
                      ),
                    ],
                  ),
                ),
                //Start of notifications
                Container(
                  width: 320,
                  height: 60,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  margin: const EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0,3)
                      )
                    ]
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('WARNING:',
                            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          Text('Water Pressure too low', style: TextStyle(fontSize: 15))
                        ],
                      ),
                      Text('1h ago',
                        style: TextStyle(fontSize: 10, color: Color.fromARGB(255, 43, 108, 79)),
                      ),
                    ],
                  ),
                ),
                //new Noti
                Container(
                  width: 320,
                  height: 60,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  margin: const EdgeInsets.only(top: 15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0,3)
                      )
                    ]
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('WARNING:',
                            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          Text('Water Pressure too low', style: TextStyle(fontSize: 15))
                        ],
                      ),
                      Text('1h ago',
                        style: TextStyle(fontSize: 10, color: Color.fromARGB(255, 43, 108, 79)),
                      ),
                    ],
                  ),
                ),
                //new noti
                Container(
                  width: 320,
                  height: 60,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  margin: const EdgeInsets.only(top: 15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0,3)
                      )
                    ]
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('WARNING:',
                            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          Text('Water Pressure too low', style: TextStyle(fontSize: 15))
                        ],
                      ),
                      Text('1h ago',
                        style: TextStyle(fontSize: 10, color: Color.fromARGB(255, 43, 108, 79)),
                      ),
                    ],
                  ),
                ),
                //new noti
                Container(
                  width: 320,
                  height: 60,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  margin: const EdgeInsets.only(top: 15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0,3)
                      )
                    ]
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('WARNING:',
                            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          Text('Water Pressure too low', style: TextStyle(fontSize: 15))
                        ],
                      ),
                      Text('1h ago',
                        style: TextStyle(fontSize: 10, color: Color.fromARGB(255, 43, 108, 79)),
                      ),
                    ],
                  ),
                ),
                //new noti
                Container(
                  width: 320,
                  height: 60,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  margin: const EdgeInsets.only(top: 15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0,3)
                      )
                    ]
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('WARNING:',
                            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          Text('Water Pressure too low', style: TextStyle(fontSize: 15))
                        ],
                      ),
                      Text('1h ago',
                        style: TextStyle(fontSize: 10, color: Color.fromARGB(255, 43, 108, 79)),
                      ),
                    ],
                  ),
                ),
                //new noti
                Container(
                  width: 320,
                  height: 60,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  margin: const EdgeInsets.only(top: 15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0,3)
                      )
                    ]
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('WARNING:',
                            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          Text('Water Pressure too low', style: TextStyle(fontSize: 15))
                        ],
                      ),
                      Text('1h ago',
                        style: TextStyle(fontSize: 10, color: Color.fromARGB(255, 43, 108, 79)),
                      ),
                    ],
                  ),
                ),
                //new noti
                Container(
                  width: 320,
                  height: 60,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  margin: const EdgeInsets.only(top: 15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0,3)
                      )
                    ]
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('WARNING:',
                            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          Text('Water Pressure too low', style: TextStyle(fontSize: 15))
                        ],
                      ),
                      Text('1h ago',
                        style: TextStyle(fontSize: 10, color: Color.fromARGB(255, 43, 108, 79)),
                      ),
                    ],
                  ),
                ),
              ],
            )
          )
        ),
        bottomNavigationBar: BottomNavBar(),
      );
  }
}