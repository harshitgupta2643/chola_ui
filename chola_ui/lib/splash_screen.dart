import 'package:flutter/material.dart';

import 'main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => const MyHomePage(title: 'Chola Chariots')),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 182, 29, 1),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                margin: EdgeInsets.all(0),
                child: Text(
                  'CHOLA',
                  style: TextStyle(
                    fontSize: 48.0,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF000000),
                    letterSpacing: 0,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(0),
                child: Text(
                  'CHARIOTS',
                  style: TextStyle(
                    fontSize: 12.0,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF000000),
                    letterSpacing: 0.78,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.zero,
                child: Text(
                  'TRAVEL MADE EASY',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF000000),
                    letterSpacing: 0.78,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
