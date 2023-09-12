import 'package:flutter/material.dart';
import '../utils/navigation.dart';

class TopNavbar extends StatelessWidget implements PreferredSizeWidget {

  const TopNavbar({ super.key });
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {

    return AppBar(
      // leading: IconButton(
      //   icon: const Icon(Icons.arrow_back),
      //   onPressed: () {Navigator.pop(context);},
      //   tooltip: 'Go back',
      //   iconSize: 30,
      //   padding: const EdgeInsets.only(left:15),
      // ),
      title: Image.asset('assets/images/bw_salineq_logo.png', fit: BoxFit.cover, height: 55),
      centerTitle: true,
      toolbarHeight: 70,
      actions: [
        IconButton(
          onPressed: () {navToNotification(context);},
          icon: const Icon(Icons.notifications),
          tooltip: 'Notifications',
          iconSize: 30,
          padding: const EdgeInsets.only(right: 15),
        )
      ],
      backgroundColor: const Color.fromARGB(205, 60, 60, 60),
    );

  }

}