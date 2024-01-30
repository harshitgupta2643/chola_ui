import 'package:chola_chariots_ui/Pages/accountPage.dart';
import 'package:chola_chariots_ui/Pages/history.dart';
import 'package:chola_chariots_ui/Pages/homePage.dart';
// import 'package:chola_chariots_ui/Pages/profile.dart';
import 'package:chola_chariots_ui/Widgets/LanscapeIcon.dart';
import 'package:chola_chariots_ui/Widgets/NavigationBar.dart';
import 'package:chola_chariots_ui/Widgets/ServicesButton.dart';
import 'package:flutter/material.dart';

class ServicesPage extends StatefulWidget {
  @override
  _ServicesPageState createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: ((context, orientation) {
      if (orientation == Orientation.landscape) {
        return LandscapeIcon();
      } else {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFFBAC1FF),
            centerTitle: true,
            title: Text(
              'Services',
              style: TextStyle(
                color: Colors.black,
                fontSize: MediaQuery.of(context).size.shortestSide * 0.06,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                height: 0,
              ),
            ),
            leading: ElevatedButton(
              child: Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
              ),
              onPressed: () {
                setState(() {
                  _currentIndex = 0;
                });
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => HomePage())));
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
              ),
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
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ServiceButton(
                            onPressed: () {},
                            child_widget: Image.asset('assets/Trip.png'),
                            // icon: Icons.credit_card,
                            text: "Trip"),
                        ServiceButton(
                            onPressed: () {},
                            child_widget: Image.asset('assets/Trip.png'),
                            // icon: Icons.translate_sharp,
                            text: "Intercity"),
                        ServiceButton(
                            onPressed: () {},
                            child_widget: Image.asset('assets/Trip.png'),
                            // icon: Icons.person,
                            text: "Rental"),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ServiceButton(
                            onPressed: () {},
                            child_widget: Image.asset('assets/Trip.png'),
                            // icon: Icons.chat_bubble_outline_rounded,
                            text: "Reserve"),
                        ServiceButton(
                            onPressed: () {},
                            child_widget: Image.asset('assets/Trip.png'),
                            // icon: Icons.card_giftcard,
                            text: "Group"),
                        ServiceButton(
                            onPressed: () {},
                            child_widget: Image.asset('assets/Trip.png'),
                            // icon: Icons.feedback_outlined,
                            text: "Package"),
                      ],
                    ),
                  ])),
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
    }));
  }
}
