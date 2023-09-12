import 'package:flutter/material.dart';
import 'package:salineq/Controls.dart';
import 'package:salineq/Home.dart';
import 'package:salineq/Maintenance.dart';
import 'package:salineq/Monitor.dart';
import 'package:salineq/Notifications.dart';
import 'package:salineq/Offset.dart';
import 'package:salineq/Settings.dart';

int selected = 0;

void navToHome(BuildContext context) {

  Navigator
    .of(context)
    .pushReplacement(
      MaterialPageRoute(
        builder: (context) => const Home()
      )
    );
    selected = 0;

}

void navToControls(BuildContext context) {

  Navigator
    .of(context)
    .pushReplacement(
      MaterialPageRoute(
        builder: (context) => const Controls()
      )
    );
    selected = -1;

}

void navToMaintenance(BuildContext context) {

  Navigator
    .of(context)
    .pushReplacement(
      MaterialPageRoute(
        builder: (context) => const Maintenance()
      )
    );
    selected = 2;

}

void navToMonitor(BuildContext context) {

  Navigator
    .of(context)
    .pushReplacement(
      MaterialPageRoute(
        builder: (context) => const Monitor()
      )
    );
    selected = 1;

}

void navToOffset(BuildContext context) {

  Navigator
    .of(context)
    .pushReplacement(
      MaterialPageRoute(
        builder: (context) => const OffsetPage()
      )
    );
    selected = -1;

}

void navToNotification(BuildContext context) {

  Navigator
    .of(context)
    .pushReplacement(
      MaterialPageRoute(
        builder: (context) => const NotificationPage()
      )
    );

}

void navToSettings(BuildContext context) {

  Navigator
    .of(context)
    .pushReplacement(
      MaterialPageRoute(
        builder: (context) => const SettingsPage()
      )
    );
    selected = 3;

}