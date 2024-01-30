import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  CustomBottomNavigationBar({required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      iconSize: MediaQuery.of(context).size.width * 0.08,
      fixedColor: Colors.black,
      unselectedItemColor: Colors.grey,
      currentIndex: currentIndex,
      elevation: MediaQuery.of(context).size.width * 0.08,
      useLegacyColorScheme: true,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.apps_sharp),
          label: 'Service',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.work_history),
          label: 'History',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Account',
        ),
      ],
      onTap: onTap,
    );
  }
}
