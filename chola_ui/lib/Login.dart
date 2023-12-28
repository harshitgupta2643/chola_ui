import 'package:chola_chariots_ui/Login_with_otp.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'LOGIN',
          style: TextStyle(
            color: Colors.black,
            fontSize: MediaQuery.of(context).size.width * 0.06,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
            height: 0,
          ),
        ),
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
      body: Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Form(
                child: Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: 'Email/phone number',
                        hintText: 'Enter your email/phone number',
                        contentPadding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.width * 0.03,
                          horizontal: MediaQuery.of(context).size.width * 0.05,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        hintText: 'Enter your password',
                        contentPadding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.width * 0.03,
                          horizontal: MediaQuery.of(context).size.width * 0.05,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Login With',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.035,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.facebook_sharp),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: Icon(Icons.facebook),
                              onPressed: () {},
                            ),
                          ],
                        ),
                        TextButton(
                          onPressed: () {
                            // Implement your Forgot Password logic here
                          },
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.04,
                              fontFamily: 'Roboto Flex',
                              fontWeight: FontWeight.w400,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.3),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginWithOtp()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(255, 182, 29, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: Text(
                      'LOGIN WITH OTP',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Access the form data from the state
                      String email = emailController.text;
                      String password = passwordController.text;

                      // Perform login logic using email and password

                      // Example: Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => NextScreen()),
                      // );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(255, 182, 29, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: Text(
                      'LOGIN',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
