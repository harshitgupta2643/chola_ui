import 'package:flutter/material.dart';
import 'Login.dart';
import 'next_screen.dart';
import 'splash_screen.dart';

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
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromRGBO(255, 174, 0, 1)),
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
    return Scaffold(
      body: Container(
        color: Color.fromRGBO(255, 182, 29, 1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.15),
            Container(
              child: Center(
                child: Image.asset(
                  'assets/logo2.png',
                ),
              ),
            ),
            Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      margin: EdgeInsets.all(0),
                      child: Text(
                        'CHOLA',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.15,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF000000),
                          letterSpacing: 0,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(0),
                      child: Text(
                        'The Chariots...',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.05,
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
                        'Travel Made Easy',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.04,
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
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.1,
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'LOGIN',
                        style: TextStyle(
                          color: Color.fromRGBO(255, 182, 29, 1),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.1,
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WalletScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'SIGNUP',
                        style: TextStyle(
                          color: Color.fromRGBO(255, 182, 29, 1),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
