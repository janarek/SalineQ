import 'dart:convert';

import 'package:http/http.dart';

Stream<Map<String, dynamic>> getHomeData() async* {

  while (true) {

    Response response = await get(
      Uri(
        scheme: "http",
        host: '10.0.2.2',
        port: 5000,
        path: "/getHomeData"
      )
    );
    Map body = json.decode(response.body);
    Map<String, dynamic> data = body.map<String, dynamic>((key, value) => MapEntry("$key", value));

    yield data;

    await Future.delayed(const Duration(seconds: 7));
  
  }

}

Stream<Map<String, double>> getMonitorData() async* {

  while (true) {

    Response response = await get(
      Uri(
        scheme: "http",
        host: '10.0.2.2',
        port: 5000,
        path: "/getMonitorData"
      )
    );
    
    Map body = json.decode(response.body);
    Map<String, double> data = body
      .map<String, double>((key, value) => MapEntry(
        "$key",
        value is int ?
          value.toDouble() :
          value
      ));

    yield data;

    await Future.delayed(const Duration(seconds: 7));
  
  }

}

Stream<Map<String, dynamic>> getMaintenanceData() async* {

  while (true) {

    Response response = await get(
      Uri(
        scheme: "http",
        host: '10.0.2.2',
        port: 5000,
        path: "/getHomeData"
      )
    );

    Map body = json.decode(response.body);
    Map<String, dynamic> data = body
      .map((key, value) => MapEntry("$key", value));

    yield data;

    await Future.delayed(const Duration(seconds: 7));
  
  }

}

Future<Map<String, dynamic>> getControlsData() async {

  Response response = await get(
    Uri(
      scheme: "http",
      host: '10.0.2.2',
      port: 5000,
      path: "/getControlsData"
    )
  );

  Map body = json.decode(response.body);
  Map<String, dynamic> data = body
    .map((key, value) => MapEntry("$key", value));

  return data;

}

Future<Map<String, String>> setControlData(Map<String, dynamic> controlData) async {

  Response response = await post(
    Uri(
      scheme: "http",
      host: '10.0.2.2',
      port: 5000,
      path: "/setControlData"
    ),
    headers: {
      "Content-Type": "application/json"
    },
    body: json.encode(controlData)
  );

  Map body = json.decode(response.body);
  Map<String, String> data = body
    .map((key, value) => MapEntry("$key", value));

  return data;

}