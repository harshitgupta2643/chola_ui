import 'dart:io';

import 'package:chola_chariots_ui/Pages/Login.dart';
import 'package:chola_chariots_ui/Widgets/BackButton.dart';
import 'package:chola_chariots_ui/Widgets/Buttonfill.dart';
import 'package:chola_chariots_ui/Widgets/Date.dart';
import 'package:chola_chariots_ui/Widgets/DropDown.dart';
import 'package:chola_chariots_ui/Widgets/Field.dart';
import 'package:chola_chariots_ui/Widgets/LanscapeIcon.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'TermsAndPrivacy.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _countryCodeController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _referralController = TextEditingController();
  final TextEditingController _bloodgroupController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  String? _selectedPhoto;
  List<String> _countryCodes = ['+91'];
  List<String> _bloodGroup = ['A+', 'A-', 'B+', 'B-', 'O-', 'O+', 'AB+', 'AB-'];
  List<String> _Gender = ['Male', 'Female', 'Other', 'Prefer Not\n to Say'];

  void _handleSignUp() {
    String firstname = _firstnameController.text;
    String lastname = _lastnameController.text;
    String email = _emailController.text;
    // String countryCode = _countryCodeController.text;
    String phoneNumber = _phoneNumberController.text;
    String password = _passwordController.text;
    String confirmPassword = _confirmPasswordController.text;
    String bloodGroup = _bloodgroupController.text;
    String dob = _dobController.text;
    String gender = _genderController.text;

    // Check if any of the required fields are empty
    if (firstname.isEmpty ||
        lastname.isEmpty ||
        email.isEmpty ||
        phoneNumber.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty ||
        dob.isEmpty ||
        gender.isEmpty ||
        bloodGroup.isEmpty) {
      _showSnackBar('All fields are required');
      return;
    }

    // Check if passwords match
    if (password != confirmPassword) {
      _showSnackBar('Passwords do not match');
      return;
    }

    // Check if the email is valid
    if (!_isValidEmail(email)) {
      _showSnackBar('Invalid email address');
      return;
    }
    if (phoneNumber.length != 10) {
      _showSnackBar('Phone number should be of length 10');
      return;
    }
    // Check if first name and last name are different
    if (firstname == lastname) {
      _showSnackBar('First name and last name cannot be the same');
      return;
    }

    // All validations passed, proceed with sign up
    _showSnackBar('Signup successful');
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TermsAndPrivacy()),
    );
  }

  void _showSnackBar(String message) {
    final snackBar = SnackBar(
      content: Text(message),
      duration: Duration(seconds: 3),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  _SignUpPageState() {
    _bloodgroupController.text = _bloodGroup[0]; // Set the default blood group
    _genderController.text = _Gender[0]; // Set the default gender
    _countryCodeController.text =
        _countryCodes[0]; // Set the default country code
  }
  bool _isValidEmail(String email) {
    String emailPattern = r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$';
    RegExp regExp = RegExp(emailPattern);
    return regExp.hasMatch(email);
  }

  Future<void> _selectPhoto() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _selectedPhoto = pickedFile.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      if (orientation == Orientation.landscape) {
        return LandscapeIcon();
      } else {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Sign Up',
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
          body: Container(
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
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.04,
                vertical: MediaQuery.of(context).size.height * 0.03,
              ),
              child: SingleChildScrollView(
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: _selectPhoto,
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: CircleAvatar(
                                radius:
                                    MediaQuery.of(context).size.width * 0.15,
                                backgroundColor:
                                    Color.fromARGB(91, 158, 158, 158),
                                backgroundImage: _selectedPhoto != null
                                    ? FileImage(File(_selectedPhoto!))
                                    : null,
                                child: _selectedPhoto == null
                                    ? Icon(
                                        Icons.person,
                                        size:
                                            MediaQuery.of(context).size.width *
                                                0.15,
                                      )
                                    : null,
                              ),
                            ),
                            Image.asset('assets/edit.png',
                                height:
                                    MediaQuery.of(context).size.height * 0.03),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width * 0.05,
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Field(
                                labelText: "First Name",
                                hintText: "Enter Your First Name",
                                icon: Icon(Icons.person),
                                vertical: 0.03,
                                horizontal: 0.04,
                                snackbarText: 'Please enter your firstname',
                                fieldController: _firstnameController),
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.03),
                          Expanded(
                            flex: 2,
                            child: Field(
                                labelText: "Last Name",
                                hintText: "Enter Your Last Name",
                                vertical: 0.03,
                                horizontal: 0.04,
                                snackbarText: 'Please enter your Lastname',
                                fieldController: _lastnameController),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width * 0.05,
                      ),
                      Field(
                          labelText: "Email",
                          hintText: "Enter Your Email",
                          keyboardType: TextInputType.emailAddress,
                          suffixWidget: ElevatedButton(
                            onPressed: () {
                              // Handle button press
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Color(
                                  0xFF9675F4), // Background color of the container
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    MediaQuery.of(context).size.shortestSide *
                                        0.02),
                              ),
                            ),
                            child: Text(
                              'Verify',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize:
                                    MediaQuery.of(context).size.shortestSide *
                                        0.045,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          vertical: 0.03,
                          horizontal: 0.04,
                          icon: Icon(Icons.email),
                          snackbarText: 'Please enter your Email',
                          fieldController: _emailController),
                      SizedBox(
                        height: MediaQuery.of(context).size.width * 0.05,
                      ),
                      Row(
                        children: [
                          CustomDropDown(
                              controller: _countryCodeController,
                              flex: 1,
                              ListOfDropDown: _countryCodes,
                              labelText: "Code",
                              onChanged: (value) {
                                setState(() {
                                  _countryCodeController.text = value!;
                                });
                              },
                              icon: Icon(Icons.phone),
                              vertical: 0.02,
                              horizontal: 0.02),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.03),
                          Expanded(
                            flex: 2,
                            child: Field(
                                labelText: "Phone Number",
                                hintText: "Enter Your Phone Number",
                                keyboardType: TextInputType.phone,
                                vertical: 0.03,
                                horizontal: 0.03,
                                suffixWidget: ElevatedButton(
                                  onPressed: () {
                                    // Handle button press
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: Color(
                                        0xFF9675F4), // Background color of the container
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          MediaQuery.of(context)
                                                  .size
                                                  .shortestSide *
                                              0.02),
                                    ),
                                  ),
                                  child: Text(
                                    'Verify',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: MediaQuery.of(context)
                                              .size
                                              .shortestSide *
                                          0.045,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                // icon: Icon(Icons.phone),
                                snackbarText: 'Please enter your Phone Number',
                                fieldController: _phoneNumberController),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width * 0.05,
                      ),
                      Field(
                          labelText: "Password",
                          hintText: "Enter Your Password",
                          vertical: 0.03,
                          horizontal: 0.04,
                          icon: Icon(Icons.lock),
                          snackbarText: 'Please enter your Password',
                          fieldController: _passwordController),
                      SizedBox(
                        height: MediaQuery.of(context).size.width * 0.05,
                      ),
                      Field(
                          labelText: "Confirm Password",
                          hintText: "Enter Your Confirm Password",
                          vertical: 0.03,
                          horizontal: 0.04,
                          icon: Icon(Icons.lock),
                          snackbarText: 'Please re-enter your Password',
                          fieldController: _confirmPasswordController),
                      SizedBox(
                        height: MediaQuery.of(context).size.width * 0.05,
                      ),
                      Row(
                        children: [
                          CustomDropDown(
                              controller: _bloodgroupController,
                              flex: 1,
                              onChanged: (value) {
                                setState(() {
                                  _bloodgroupController.text = value!;
                                });
                              },
                              ListOfDropDown: _bloodGroup,
                              labelText: "BloodGroup",
                              icon: Icon(Icons.bloodtype),
                              vertical: 0.02,
                              horizontal: 0.02),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.01),
                          Expanded(
                            flex: 1,
                            child: DobField(
                                labelText: "DOB",
                                suffixicon: Icon(Icons.date_range_outlined),
                                hintText: "Enter Your DOB",
                                vertical: 0.03,
                                horizontal: 0.04,
                                // icon: Icon(Icons.calendar_today),
                                dobController: _dobController),
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.01),
                          CustomDropDown(
                              controller: _genderController,
                              flex: 1,
                              onChanged: (value) {
                                setState(() {
                                  _genderController.text = value!;
                                });
                              },
                              ListOfDropDown: _Gender,
                              labelText: "Gender",
                              vertical: 0.02,
                              horizontal: 0.02),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width * 0.05,
                      ),
                      Field(
                          labelText: "Referral Code (Optional)",
                          hintText: "Enter Your Referral Code",
                          vertical: 0.03,
                          horizontal: 0.04,
                          icon: Icon(Icons.discount),
                          snackbarText: null,
                          fieldController: _referralController),
                      SizedBox(
                        height: MediaQuery.of(context).size.width * 0.05,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.01),
                        child: AgreeButton(
                            buttonText: "SIGN UP",
                            onPressed: _handleSignUp,
                            padding: 0.1),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width * 0.04,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account? ",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize:
                                  MediaQuery.of(context).size.shortestSide *
                                      0.04,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()),
                              );
                            },
                            child: Text(
                              'Login',
                              style: TextStyle(
                                color: Color(0xFF9D00FD),
                                fontSize:
                                    MediaQuery.of(context).size.shortestSide *
                                        0.04,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width * 0.01,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Sign up with ",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize:
                                  MediaQuery.of(context).size.shortestSide *
                                      0.04,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
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
                            width: MediaQuery.of(context).size.width * 0.03,
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
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }
    });
  }
}

void main() {
  runApp(MaterialApp(
    home: SignUpPage(),
  ));
}
