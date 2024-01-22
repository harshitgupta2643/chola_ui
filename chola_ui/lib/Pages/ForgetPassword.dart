import 'package:chola_chariots_ui/Pages/ForgetPassOTP.dart';
import 'package:chola_chariots_ui/Widgets/LanscapeIcon.dart';
import 'package:flutter/material.dart';
import '../Widgets/BackButton.dart';
import '../Widgets/Buttonfill.dart';
import '../Widgets/DropDown.dart';
import '../Widgets/Field.dart';
import 'VerifyOtp.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _authTypeController = TextEditingController();
  final TextEditingController _countryCodeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  List<String> _countryCodes = ['+91'];
  List<String> AuthType = ['Email', 'Phone Number'];

  String selectedAuthType = 'Phone Number';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Forget Password',
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
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFFBD0FF),
                    Color(0xFFFBD0FF),
                    Color(0xDBD8D4FF),
                    Color(0xDBD8D4FF),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.04,
                  vertical: MediaQuery.of(context).size.height * 0.03,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    Text(
                      'Enter your registered',
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
                    DropdownButtonFormField<String>(
                      value: selectedAuthType,
                      onChanged: (value) {
                        setState(() {
                          selectedAuthType = value!;
                        });
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        labelText: "Registered Type",
                        labelStyle: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.06,
                          fontWeight: FontWeight.w500,
                        ),
                        icon: Icon(Icons.login_outlined),
                        contentPadding: EdgeInsets.symmetric(
                          vertical:
                              MediaQuery.of(context).size.shortestSide * 0.03,
                          horizontal:
                              MediaQuery.of(context).size.shortestSide * 0.04,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      items: AuthType.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.02,
                    ),
                    selectedAuthType == 'Phone Number'
                        ? Row(
                            children: [
                              CustomDropDown(
                                flex: 1,
                                controller: _countryCodeController,
                                ListOfDropDown: _countryCodes,
                                labelText: "Code",
                                vertical: 0.02,
                                horizontal: 0.02,
                                icon: Icon(Icons.phone),
                                onChanged: (value) {
                                  setState(() {
                                    _countryCodeController.text = value!;
                                  });
                                },
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.02,
                              ),
                              Expanded(
                                flex: 2,
                                child: Field(
                                  labelText: "Phone Number",
                                  hintText: "Enter Your Phone Number",
                                  keyboardType: TextInputType.phone,
                                  vertical: 0.03,
                                  horizontal: 0.04,
                                  snackbarText:
                                      'Please enter your Phone Number',
                                  fieldController: _phoneNumberController,
                                ),
                              ),
                            ],
                          )
                        : Field(
                            labelText: "Email",
                            hintText: "Enter Your Email",
                            keyboardType: TextInputType.emailAddress,
                            vertical: 0.03,
                            horizontal: 0.04,
                            icon: Icon(Icons.email),
                            snackbarText: 'Please enter a valid Email',
                            fieldController: _emailController),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    AgreeButton(
                      padding: 0.1,
                      buttonText: "Send OTP",
                      onPressed: () {
                        if (selectedAuthType == 'Phone Number') {
                          if (_isValidPhoneNumber(
                              _phoneNumberController.text)) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ForgetPassOTPPage(),
                              ),
                            );
                          } else {
                            _showSnackbar('Invalid Phone Number');
                          }
                        } else {
                          if (_isValidEmail(_emailController.text)) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ForgetPassOTPPage(),
                              ),
                            );
                          } else {
                            _showSnackbar('Invalid Email');
                          }
                        }
                      },
                    ),
                  ],
                ),
              ),
            );
          }
        }));
  }

  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
      ),
    );
  }

  // Helper function to check valid phone number format
  bool _isValidPhoneNumber(String phoneNumber) {
    return phoneNumber.length == 10 && int.tryParse(phoneNumber) != null;
  }

  // Helper function to check valid email format
  bool _isValidEmail(String email) {
    final emailRegex =
        RegExp(r'^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return emailRegex.hasMatch(email);
  }
}
