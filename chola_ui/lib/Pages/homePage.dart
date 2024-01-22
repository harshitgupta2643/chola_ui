import 'package:chola_chariots_ui/Pages/Services.dart';
import 'package:chola_chariots_ui/Pages/accountPage.dart';
import 'package:chola_chariots_ui/Pages/history.dart';
import 'package:chola_chariots_ui/Widgets/BackButton.dart';
import 'package:chola_chariots_ui/Widgets/NavigationBar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFBAC1FF),
        centerTitle: true,
        title: Text('Home'),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFBD0FF),
              Color(0xFFFBD0FF),
              Color(0xDBD8D4FF),
              Color(0xDBD8D4FF),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          switch (index) {
            case 0:
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
              // Navigate to Home page
              break;
            case 1:
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ServicesPage()));
              // Navigate to Service page (current page)
              break;
            case 2:
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HistoryPage()));
              // Navigate to History page
              break;
            case 3:
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AccountPage()));
              // Navigate to Account page
              break;
          }
        },
      ),
    );
  }
}
