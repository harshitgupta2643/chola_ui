import 'package:chola_chariots_ui/Pages/Services.dart';
import 'package:chola_chariots_ui/Pages/accountPage.dart';
import 'package:chola_chariots_ui/Pages/history.dart';
import 'package:chola_chariots_ui/Widgets/Buttonfill.dart';
import 'package:chola_chariots_ui/Widgets/CustomMenuButton.dart';
import 'package:chola_chariots_ui/Widgets/Field.dart';
// import 'package:chola_chariots_ui/Widgets/BackButton.dart';
import 'package:chola_chariots_ui/Widgets/LanscapeIcon.dart';
import 'package:chola_chariots_ui/Widgets/NavigationBar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final TextEditingController wheretoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      if (orientation == Orientation.landscape) {
        return LandscapeIcon();
      } else {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(
              MediaQuery.of(context).size.height * 0.075,
            ),
            child: AppBar(
              backgroundColor: Color(0xFFBAC1FF),
              centerTitle: true,
              leading: CustomMenuIconButton(
                onPressed: () {
                  print('Menu Button Pressed');
                },
                child_widget: Image.asset('assets/Menu.png'),
              ),
              title: Image.asset(
                'assets/logo_home.png',
                height: MediaQuery.of(context).size.height * 0.09,
                alignment: Alignment.center,
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      print('Notification Button Pressed');
                    },
                    icon: CircleAvatar(
                        backgroundColor: Colors.black,
                        child: Icon(
                          Icons.notifications,
                          color: Colors.amber,
                        )))
              ],
              automaticallyImplyLeading: false,
              elevation: 5,
            ),
          ),
          body: Container(
            height: double.maxFinite,
            width: double.maxFinite,
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
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.04,
                vertical: MediaQuery.of(context).size.height * 0.03,
              ),
              child: Column(
                children: [
                  Field(
                      labelText: "Where to?",
                      hintText: "",
                      onTap: () {
                        print('Tapped on Where to?');
                      },
                      borderRadius: 30.0,
                      vertical: 0.03,
                      horizontal: 0.04,
                      color: Colors.black,
                      isEditable: false,
                      prefixWidget: Transform.rotate(
                          angle: 45 * (3.141592653589793 / 180),
                          child: Icon(Icons.navigation_rounded)),
                      fieldController: wheretoController),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.03,
                  ),
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
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
    });
  }
}
