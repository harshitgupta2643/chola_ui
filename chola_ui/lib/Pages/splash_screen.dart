import 'package:flutter/material.dart';
import '../main.dart';
import 'package:chola_chariots_ui/Widgets/LanscapeIcon.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 7), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const MyHomePage(title: 'Chola Chariots'),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.landscape) {
            return LandscapeIcon();
          } else {
            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/bbg.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'CHOLA\n',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.15,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 255, 255, 255),
                          // decoration: TextDecoration.underline,
                          decorationColor: Colors.white,
                          decorationThickness: 1.2,
                          letterSpacing: 1.0,
                        ),
                      ),
                      TextSpan(
                        text: '            Chariots\n',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.075,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                      TextSpan(
                        text: 'Travel Made Easy',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.055,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
