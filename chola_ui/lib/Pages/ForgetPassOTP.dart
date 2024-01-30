// ignore_for_file: must_be_immutable

import 'dart:async';
import 'package:chola_chariots_ui/Pages/SetPassword.dart';
import 'package:chola_chariots_ui/Widgets/BackButton.dart';
import 'package:chola_chariots_ui/Widgets/Buttonfill.dart';
import 'package:chola_chariots_ui/Widgets/LanscapeIcon.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgetPassOTPPage extends StatefulWidget {
  String verificationId;
  TextEditingController phoneNumberController = TextEditingController();

  ForgetPassOTPPage({
    Key? key,
    required this.verificationId,
    required this.phoneNumberController,
  }) : super(key: key);

  @override
  State<ForgetPassOTPPage> createState() => _ForgetPassOTPPageState();
}

class _ForgetPassOTPPageState extends State<ForgetPassOTPPage> {
  bool invalidOtp = false;
  int resendTime = 30;
  late Timer countdownTimer;
  TextEditingController txt1 = TextEditingController();
  TextEditingController txt2 = TextEditingController();
  TextEditingController txt3 = TextEditingController();
  TextEditingController txt4 = TextEditingController();
  TextEditingController txt5 = TextEditingController();
  TextEditingController txt6 = TextEditingController();
  bool _isMounted = false;

  @override
  void initState() {
    _isMounted = true;
    startTimer();
    super.initState();
  }

  void startTimer() {
    countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_isMounted) {
        setState(() {
          resendTime = resendTime - 1;
        });
        if (resendTime < 1) {
          stopTimer();
        }
      }
    });
  }

  void stopTimer() {
    if (countdownTimer.isActive) {
      countdownTimer.cancel();
    }
  }

  @override
  void dispose() {
    // Cancel the timer in the dispose method
    stopTimer();
    _isMounted = false;
    super.dispose();
  }

  String strFormatting(n) => n.toString().padLeft(2, '0');
  void _showSnackBar(String message) {
    final snackBar = SnackBar(
      content: Text(message),
      duration: Duration(seconds: 3),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future<void> resendOTP() async {
    stopTimer();
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: "+91" + widget.phoneNumberController.text,
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException ex) {
          print("Verification failed: ${ex.message}");

          // Check if the error code is due to too many requests
          if (ex.code == 'auth/too-many-requests') {
            _showSnackBar(
              'All requests from this device have been blocked now due to too many attempts for OTP login. Please try again later.',
            );
          } else {
            // Handle other verification failure scenarios
            _showSnackBar('Verification failed: ${ex.message}');
          }
        },
        codeSent: (String verificationId, int? resendToken) {
          // Update the verificationId and start the timer
          if (_isMounted) {
            setState(() {
              widget.verificationId = verificationId;
              resendTime = 30;
            });
            startTimer();
          }
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
        timeout: const Duration(seconds: 30),
      );
    } catch (e) {
      _showSnackBar("Error resending OTP: $e");
      print("Error resending OTP: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Enter OTP',
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
            height: double.maxFinite,
            width: double.maxFinite,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Color(0xFFFBD0FF),
                Color(0xFFFBD0FF),
                Color(0xDBD8D4FF),
                Color(0xDBD8D4FF)
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
            ),
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
                                      resendTime = 30;
                                      startTimer();
                                      resendOTP();
                                    },
                                    padding: 0.01),
                              ],
                            )
                          : SizedBox(
                              height: MediaQuery.of(context).size.width * 0.06),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.width * 0.03),
                  resendTime != 0
                      ? Text(
                          'You can resend OTP after ${strFormatting(resendTime)} second(s)',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: MediaQuery.of(context).size.shortestSide *
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
                    buttonText: "Set Password",
                    onPressed: () async {
                      final otp = txt1.text +
                          txt2.text +
                          txt3.text +
                          txt4.text +
                          txt5.text +
                          txt6.text;

                      if (otp.length == 6) {
                        try {
                          // Use the verificationId obtained during phone number verification
                          PhoneAuthCredential credential =
                              PhoneAuthProvider.credential(
                            verificationId: widget.verificationId,
                            smsCode: otp,
                          );

                          // Sign in with the phone number and OTP
                          await FirebaseAuth.instance
                              .signInWithCredential(credential);

                          // OTP verification successful, navigate to the next screen (TermsAndPrivacy)
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => SetPassword(),
                            ),
                          );
                        } catch (e) {
                          // Handle OTP verification failure
                          _showSnackBar("Error verifying OTP: $e");
                          if (_isMounted) {
                            setState(() {
                              invalidOtp = true;
                            });
                          }
                        }
                      } else {
                        if (_isMounted) {
                          setState(() {
                            invalidOtp = true;
                          });
                        }
                      }
                    },
                  )
                ],
              ),
            ),
          );
        }
      }),
    );
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
