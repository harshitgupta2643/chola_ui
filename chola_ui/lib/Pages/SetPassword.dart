import 'package:chola_chariots_ui/Pages/TermsAndPrivacy.dart';
import 'package:chola_chariots_ui/Widgets/BackButton.dart';
import 'package:chola_chariots_ui/Widgets/Buttonfill.dart';
import 'package:chola_chariots_ui/Widgets/Field.dart';
import 'package:chola_chariots_ui/Widgets/LanscapeIcon.dart';
import 'package:flutter/material.dart';

class SetPassword extends StatefulWidget {
  const SetPassword({super.key});

  @override
  State<SetPassword> createState() => _SetPasswordState();
}

class _SetPasswordState extends State<SetPassword> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  // Function to check if the password is at least 8 characters long
  bool isPasswordValid(String password) {
    return password.length >= 8;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Set Password',
            style: TextStyle(
              color: Colors.black,
              fontSize: MediaQuery.of(context).size.shortestSide * 0.06,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              height: 0,
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
        body: OrientationBuilder(builder: ((context, orientation) {
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
                    Field(
                      labelText: "New Password",
                      hintText: "Enter Your New Password",
                      vertical: 0.03,
                      horizontal: 0.04,
                      icon: Icon(Icons.lock),
                      snackbarText:
                          'Please enter a password of at least 8 characters',
                      fieldController: _passwordController,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.05,
                    ),
                    Field(
                      labelText: "Confirm New Password",
                      hintText: "Enter Your Confirm New Password",
                      vertical: 0.03,
                      horizontal: 0.04,
                      icon: Icon(Icons.lock),
                      snackbarText: 'Please re-enter your password',
                      fieldController: _confirmPasswordController,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.05,
                    ),
                    AgreeButton(
                      buttonText: "Confirm",
                      onPressed: () {
                        // Check if passwords meet the criteria
                        if (isPasswordValid(_passwordController.text) &&
                            _passwordController.text ==
                                _confirmPasswordController.text) {
                          // Passwords are valid, navigate to the next screen
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TermsAndPrivacy()),
                          );
                        } else {
                          // Show a snackbar or any other feedback for invalid passwords
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  'Invalid password OR passwords do not match OR password of at least 8 characters'),
                            ),
                          );
                        }
                      },
                      padding: 0.1,
                    ),
                  ],
                ),
              ),
            );
          }
        })));
  }
}
