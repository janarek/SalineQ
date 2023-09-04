// import 'dart:convert';
// import 'package:http/http.dart';
import 'Home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // Future<Map<String, dynamic>> getData() async {
  //   Response response = await get(
  //     Uri(
  //       scheme: "http",
  //       host: '10.0.2.2',
  //       port: 5000,
  //       path: "/getData"
  //     )
  //   );
    
  //   return json.decode(response.body);
  // }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: const HomePage());

    // return FutureBuilder(
    //   future: getData(),
    //   builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
    //     if (snapshot.connectionState != ConnectionState.done) {
    //       // Return what ur user sees when loading
    //       return const Center(child: CircularProgressIndicator());
    //     }
    //     else if (snapshot.hasError) {
    //       // Return what ur user sees when an error occurs
    //       return Center(child: Text("Something went wrong. ${snapshot.error}"));
    //     }
    //     else if (snapshot.hasData) {
    //       // Return ur screen
    //       return HomePage();
    //     }
    //     else {
    //       return Container();
    //     }
    //   }
    // );
  }
}
