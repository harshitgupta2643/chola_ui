import 'dart:async';
import 'package:chola_chariots_ui/Pages/TermsAndPrivacy.dart';
import 'package:chola_chariots_ui/Widgets/BackButton.dart';
import 'package:chola_chariots_ui/Widgets/Buttonfill.dart';
import 'package:chola_chariots_ui/Widgets/LanscapeIcon.dart';
import 'package:flutter/material.dart';

class OTPPage extends StatefulWidget {
  const OTPPage({Key? key}) : super(key: key);

  @override
  State<OTPPage> createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  bool invalidOtp = false;
  int resendTime = 15;
  late Timer countdownTimer;
  TextEditingController txt1 = TextEditingController();
  TextEditingController txt2 = TextEditingController();
  TextEditingController txt3 = TextEditingController();
  TextEditingController txt4 = TextEditingController();
  TextEditingController txt5 = TextEditingController();
  TextEditingController txt6 = TextEditingController();

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  void startTimer() {
    countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        resendTime = resendTime - 1;
      });
      if (resendTime < 1) {
        stopTimer();
      }
    });
  }

  void stopTimer() {
    if (countdownTimer.isActive) {
      countdownTimer.cancel();
    }
  }

  String strFormatting(n) => n.toString().padLeft(2, '0');

  @override
  void dispose() {
    // Cancel the timer in the dispose method
    stopTimer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'OTP Verification',
            style: TextStyle(
              color: Colors.black,
              fontSize: MediaQuery.of(context).size.shortestSide * 0.06,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              height: 0,
            ),
          ),
          centerTitle: true,
          leading: BackButton1(),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              color: Color(0xFFBAC1FF),
            ),
          ),
        ),
        body: OrientationBuilder(builder: (context, orientation) {
          if (orientation == Orientation.landscape) {
            return LandscapeIcon();
          } else {
            return Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Color(0xFFFBD0FF),
                Color(0xFFFBD0FF),
                Color(0xDBD8D4FF),
                Color(0xDBD8D4FF)
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.03,
                  vertical: MediaQuery.of(context).size.height * 0.03,
                ),
                child: Column(
                  children: [
                    Text(
                      'Enter the received 6 digits verification code.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: MediaQuery.of(context).size.width * 0.06,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.width * 0.06),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        myInputBox(context, txt1),
                        myInputBox(context, txt2),
                        myInputBox(context, txt3),
                        myInputBox(context, txt4),
                        myInputBox(context, txt5),
                        myInputBox(context, txt6),
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.width * 0.06),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                            height: MediaQuery.of(context).size.width * 0.03),
                        resendTime == 0
                            ? Row(
                                children: [
                                  Text(
                                    "Haven't received OTP yet?",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: MediaQuery.of(context)
                                              .size
                                              .shortestSide *
                                          0.045,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  AgreeButton(
                                      buttonText: "Resend OTP",
                                      onPressed: () {
                                        invalidOtp = false;
                                        resendTime = 15;
                                        startTimer();
                                      },
                                      padding: 0.01),
                                ],
                              )
                            : SizedBox(
                                height:
                                    MediaQuery.of(context).size.width * 0.06),
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.width * 0.03),
                    resendTime != 0
                        ? Text(
                            'You can resend OTP after ${strFormatting(resendTime)} second(s)',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize:
                                  MediaQuery.of(context).size.shortestSide *
                                      0.045,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        : SizedBox(
                            height: MediaQuery.of(context).size.width * 0.06),
                    SizedBox(height: MediaQuery.of(context).size.width * 0.03),
                    Text(
                      invalidOtp ? 'Invalid otp!' : '',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize:
                            MediaQuery.of(context).size.shortestSide * 0.045,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.width * 0.03),
                    AgreeButton(
                      padding: 0.1,
                      buttonText: "Log In",
                      onPressed: () {
                        final otp = txt1.text +
                            txt2.text +
                            txt3.text +
                            txt4.text +
                            txt5.text +
                            txt6.text;
                        if (otp == '000000') {
                          // Go to welcome
                          setState(() {
                            invalidOtp = false;
                          });
                          stopTimer();
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const TermsAndPrivacy(),
                            ),
                          );
                        } else {
                          setState(() {
                            invalidOtp = true;
                          });
                        }
                      },
                    )
                  ],
                ),
              ),
            );
          }
        }));
  }

  Widget myInputBox(BuildContext context, TextEditingController controller) {
    return Container(
      height: MediaQuery.of(context).size.width * 0.1,
      width: MediaQuery.of(context).size.width * 0.1,
      decoration: BoxDecoration(
        border: Border.all(width: 1),
        borderRadius: const BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: TextField(
        controller: controller,
        maxLength: 1,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.05),
        decoration: const InputDecoration(
          counterText: '',
        ),
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
      ),
    );
  }
}
