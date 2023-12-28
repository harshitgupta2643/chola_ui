import 'package:flutter/material.dart';

class LoginWithOtp extends StatefulWidget {
  const LoginWithOtp({Key? key}) : super(key: key);

  @override
  _LoginWithOtpState createState() => _LoginWithOtpState();
}

class _LoginWithOtpState extends State<LoginWithOtp> {
  TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: ElevatedButton(
          child: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
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
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'We will send you an OTP on this Mobile Number',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: MediaQuery.of(context).size.width * 0.06,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: phoneNumberController,
                decoration: InputDecoration(
                  labelText: 'Phone number',
                  hintText: 'Enter your Phone number',
                  contentPadding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.015,
                    horizontal: MediaQuery.of(context).size.width * 0.05,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.2),
                child: ElevatedButton(
                  onPressed: () {
                    // Add logic to send OTP
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(255, 182, 29, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Send OTP',
                    style: TextStyle(
                      color: Colors.black,
                    ),
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
