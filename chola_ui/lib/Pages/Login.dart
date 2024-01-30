import 'package:chola_chariots_ui/Pages/ForgetPassword.dart';
import 'package:chola_chariots_ui/Pages/Login_with_otp.dart';
// import 'package:chola_chariots_ui/Pages/Services.dart';
import 'package:chola_chariots_ui/Pages/homePage.dart';
import 'package:chola_chariots_ui/Widgets/BackButton.dart';
import 'package:chola_chariots_ui/Widgets/Buttonfill.dart';
import 'package:chola_chariots_ui/Widgets/Field.dart';
import 'package:chola_chariots_ui/Widgets/LanscapeIcon.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void _handleLogin() {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    // Check if email is valid
    if (!_isValidEmail(email) && !_isValidphoneNumber(email)) {
      _showSnackBar('Invalid email address OR Phone Number');
      return;
    }

    // Check if the password is not empty
    if (password.isEmpty) {
      _showSnackBar('Please enter your password');
      return;
    }

    // If all checks pass, proceed with login logic
    // ...
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (_) => HomePage()));
    _showSnackBar('Login successful');
  }

  void _showSnackBar(String message) {
    final snackBar = SnackBar(
      content: Text(message),
      duration: Duration(seconds: 3),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  bool _isValidphoneNumber(String email) {
    return email.length == 10;
  }

  bool _isValidEmail(String email) {
    // Simple email validation using a regular expression
    String emailPattern = r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$';
    RegExp regExp = RegExp(emailPattern);
    return regExp.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login',
          style: TextStyle(
            color: Colors.black,
            fontSize: MediaQuery.of(context).size.shortestSide * 0.06,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: BackButton1(),
        centerTitle: true,
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
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(
                        MediaQuery.of(context).size.shortestSide * 0.04,
                      ),
                      child: Column(
                        children: [
                          Form(
                            child: Column(
                              children: [
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.shortestSide *
                                          0.02,
                                ),
                                Field(
                                  labelText: "Email/phone number",
                                  hintText: 'Enter your email/phone number',
                                  vertical: 0.03,
                                  horizontal: 0.05,
                                  icon: Icon(Icons.email),
                                  fieldController: emailController,
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.shortestSide *
                                          0.02,
                                ),
                                Field(
                                  labelText: "Password",
                                  hintText: 'Enter your Password',
                                  vertical: 0.03,
                                  icon: Icon(Icons.lock),
                                  horizontal: 0.05,
                                  fieldController: passwordController,
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.shortestSide *
                                          0.02,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Login With',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .shortestSide *
                                                0.04,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.03,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            // Implement Google sign-up logic
                                          },
                                          child: Image.asset(
                                            'assets/google_.png',
                                          ),
                                        ),
                                        // Text(" or "),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.03,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            // Implement Facebook sign-up logic
                                          },
                                          child: Image.asset(
                                            'assets/fb_.png',
                                          ),
                                        ),
                                      ],
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        // Implement forgot password logic
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ForgetPassword()));
                                      },
                                      child: Text(
                                        'Forgot Password',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .shortestSide *
                                              0.04,
                                          fontFamily: 'Roboto Flex',
                                          fontWeight: FontWeight.w500,
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.all(
                      MediaQuery.of(context).size.shortestSide * 0.02,
                    ),
                    child: Column(
                      children: [
                        AgreeButton(
                          buttonText: "Log In with OTP",
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginWithOtp(),
                              ),
                            );
                          },
                          padding: 0.1,
                        ),
                        SizedBox(
                          height:
                              MediaQuery.of(context).size.shortestSide * 0.05,
                        ),
                        AgreeButton(
                          buttonText: "Log In",
                          onPressed: _handleLogin,
                          padding: 0.1,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      }),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: LoginPage(),
  ));
}
