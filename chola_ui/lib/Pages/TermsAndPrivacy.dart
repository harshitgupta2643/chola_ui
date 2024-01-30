// import 'package:chola_chariots_ui/Pages/Services.dart';
import 'package:chola_chariots_ui/Pages/homePage.dart';
import 'package:chola_chariots_ui/Widgets/BackButton.dart';
import 'package:chola_chariots_ui/Widgets/Buttonfill.dart';
import 'package:chola_chariots_ui/Widgets/LanscapeIcon.dart';
import 'package:flutter/material.dart';
import "../Constants/Terms&Condition.dart";

class TermsAndPrivacy extends StatefulWidget {
  const TermsAndPrivacy({Key? key}) : super(key: key);

  @override
  State<TermsAndPrivacy> createState() => _TermsAndPrivacyState();
}

class _TermsAndPrivacyState extends State<TermsAndPrivacy> {
  final String lastUpdatedDate = "January 4, 2024";
  final ScrollController _scrollController = ScrollController();
  bool atBottom = true;

  void initState() {
    super.initState();

    _scrollController.addListener(() {
      // Check if we are at the bottom of the scroll view
      if (_scrollController.offset >=
              _scrollController.position.maxScrollExtent &&
          !_scrollController.position.outOfRange) {
        setState(() {
          atBottom = false;
        });
      } else {
        setState(() {
          atBottom = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      if (orientation == Orientation.landscape) {
        return LandscapeIcon();
      } else {
        return Scaffold(
            appBar: AppBar(
              leading: BackButton1(),
              flexibleSpace: Container(
                  decoration: BoxDecoration(
                color: Color(0xFFBAC1FF),
              )),
              title: Text(
                'Terms And Privacy Policy',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: MediaQuery.of(context).size.shortestSide * 0.06,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
              centerTitle: true,
            ),
            body: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: [
                  Color(0xFFFBD0FF),
                  Color(0xFFFBD0FF),
                  Color(0xDBD8D4FF),
                  Color(0xDBD8D4FF),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Scrollbar(
                        thumbVisibility: true,
                        showTrackOnHover: true,
                        thickness: MediaQuery.of(context).size.width * 0.03,
                        radius: Radius.circular(6.0),
                        controller: _scrollController,
                        child: SingleChildScrollView(
                          controller: _scrollController,
                          child: TermsAndConditionsWidget(),
                          // Text(
                          //   termsAndConditions,
                          //   style: TextStyle(
                          //       fontSize: MediaQuery.of(context).size.width * 0.05),
                          // ),
                        ),
                      ),
                    ),

                    // Display Last Updated Date
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        'Last Updated: $lastUpdatedDate',
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.04,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            floatingActionButton: Visibility(
              visible:
                  MediaQuery.of(context).orientation == Orientation.portrait,
              child: atBottom
                  ? Stack(
                      children: [
                        Positioned(
                          bottom: MediaQuery.of(context).size.height * 0.03,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.25,
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                _scrollController.animateTo(
                                  _scrollController.position.maxScrollExtent,
                                  duration: Duration(seconds: 2),
                                  curve: Curves.easeInOut,
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  side: BorderSide(
                                    color: Colors.purple,
                                  ),
                                ),
                              ),
                              child: Text(
                                'Scroll to Bottom',
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.05,
                                  fontWeight: FontWeight.bold,
                                  foreground: Paint()
                                    ..shader = LinearGradient(
                                      colors: [
                                        Color(0xFFB10C7B),
                                        Color(0xEBB10C7B),
                                        Color(0xFF3010C2)
                                      ],
                                    ).createShader(
                                      Rect.fromLTWH(0.0, 0.0, 350.0, 400.0),
                                    ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  : Stack(
                      children: [
                        Positioned(
                          bottom: MediaQuery.of(context).size.height * 0.03,
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width * 0.25,
                                ),
                                child: ElevatedButton(
                                  onPressed: () {
                                    _scrollController.animateTo(
                                      0,
                                      duration: Duration(seconds: 1),
                                      curve: Curves.easeInOut,
                                    );
                                    setState(() {
                                      atBottom = !atBottom;
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      side: BorderSide(
                                        color: Colors.purple,
                                      ),
                                    ),
                                  ),
                                  child: Text(
                                    'Scroll to Top',
                                    style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.05,
                                      fontWeight: FontWeight.bold,
                                      foreground: Paint()
                                        ..shader = LinearGradient(
                                          colors: [
                                            Color(0xFFB10C7B),
                                            Color(0xEBB10C7B),
                                            Color(0xFF3010C2)
                                          ],
                                        ).createShader(
                                          Rect.fromLTWH(0.0, 0.0, 350.0, 400.0),
                                        ),
                                    ),
                                  ),
                                ),
                              ),
                              AgreeButton(
                                  padding: 0.25,
                                  buttonText: "Agree & Continue",
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HomePage()),
                                    );
                                  })
                            ],
                          ),
                        ),
                      ],
                    ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.miniCenterFloat);
      }
    });
  }
}

void main() {
  runApp(MaterialApp(
    home: TermsAndPrivacy(),
  ));
}
