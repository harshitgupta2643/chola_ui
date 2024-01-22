import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:chola_chariots_ui/Pages/Signup.dart';
import 'package:chola_chariots_ui/Widgets/LandingPageButton.dart';
import 'package:chola_chariots_ui/Widgets/LanscapeIcon.dart';
import 'Pages/Login.dart';
import 'Pages/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chola Chariots',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFFBAC1FF)),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required String title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    if (Platform.isIOS) {
      return CupertinoPageScaffold(
        child: _buildContent(),
      );
    } else {
      return Scaffold(
        body: _buildContent(),
      );
    }
  }

  Widget _buildContent() {
    return OrientationBuilder(
      builder: (context, orientation) {
        if (orientation == Orientation.landscape) {
          return LandscapeIcon();
        } else {
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFFF2DCEE),
                  Color(0xFFF2DCEE),
                  Color(0xFF8A6CC5)
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.15),
                Container(
                  child: Center(
                    child: Image.asset(
                      'assets/logo3.png',
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      LandingPageButton(
                        buttonText: "Login",
                        onPressed: () {
                          Navigator.push(
                            context,
                            Platform.isIOS
                                ? CupertinoPageRoute(
                                    builder: (context) => LoginPage(),
                                  )
                                : MaterialPageRoute(
                                    builder: (context) => LoginPage(),
                                  ),
                          );
                        },
                        padding: 0.1,
                        fontsize: 0.06,
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05),
                      LandingPageButton(
                        buttonText: "Sign Up",
                        onPressed: () {
                          Navigator.push(
                            context,
                            Platform.isIOS
                                ? CupertinoPageRoute(
                                    builder: (context) => SignUpPage(),
                                  )
                                : MaterialPageRoute(
                                    builder: (context) => SignUpPage(),
                                  ),
                          );
                        },
                        padding: 0.1,
                        fontsize: 0.06,
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        }
      },
    );
  }
}
