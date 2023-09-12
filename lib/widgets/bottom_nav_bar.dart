import 'package:flutter/material.dart';
import 'package:salineq/utils/navigation.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({ super.key });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Color(0xff3d9970),
      child: Container(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NavItem(
              selected: selected == 0,
              icon: Icons.home,
              tooltip: 'Home Page',
              onPress: navToHome,
            ),
            NavItem(
              selected: selected == 1,
              icon: Icons.query_stats,
              tooltip: 'Monitoring Page',
              onPress: navToMonitor,
            ),
            NavItem(
              selected: selected == 2,
              icon: Icons.handyman,
              tooltip: 'Maintenance Page',
              onPress: navToMaintenance,
            ),
            NavItem(
              selected: selected == 3,
              icon: Icons.settings,
              tooltip: 'Settings Page',
              onPress: navToSettings,
            ),
          ]
        ),
      ),
    );
  }
}

class NavItem extends StatelessWidget {

  const NavItem({
    super.key,
    required this.selected,
    required this.icon,
    required this.tooltip,
    required this.onPress,
  });

  final bool selected;
  final IconData icon;
  final String tooltip;
  final void Function(BuildContext) onPress;

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: IconButton(
        icon: Icon(icon),
        tooltip: tooltip,
        onPressed: () {
          onPress(context); 
        },
        color: selected ?
          Colors.white :
          const Color.fromARGB(255, 43, 108, 79),
      ),
    );
  
  }

}