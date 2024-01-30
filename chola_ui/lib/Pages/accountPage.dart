import 'dart:io';

import 'package:chola_chariots_ui/Pages/Services.dart';
import 'package:chola_chariots_ui/Pages/history.dart';
import 'package:chola_chariots_ui/Pages/homePage.dart';
import 'package:chola_chariots_ui/Pages/profile.dart';
import 'package:chola_chariots_ui/Widgets/Buttonfill.dart';
import 'package:chola_chariots_ui/Widgets/CustomButton.dart';
import 'package:chola_chariots_ui/Widgets/DropDown.dart';
import 'package:chola_chariots_ui/Widgets/Field.dart';
import 'package:chola_chariots_ui/Widgets/LanscapeIcon.dart';
import 'package:chola_chariots_ui/Widgets/NavigationBar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _countryCodeController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  int _currentIndex = 3;
  bool _isFirstNameEdit = false;
  bool _isLastNameEdit = false;
  bool _isEmailEdit = false;
  bool _isPhoneNumberEdit = false;
  bool _isCountryCodeEdit = false;
  String? _selectedPhoto;

  List<String> _countryCodes = ['+91'];
  Future<void> _selectPhoto() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _selectedPhoto = pickedFile.path;
      });
    }
  }

  void _handleDone() {
    String firstname = _firstnameController.text;
    String lastname = _lastnameController.text;
    String email = _emailController.text;
    String phoneNumber = _phoneNumberController.text;

    // Check if any of the required fields are empty
    if ((firstname.isEmpty && _isFirstNameEdit) ||
        (lastname.isEmpty && _isLastNameEdit) ||
        (email.isEmpty && _isEmailEdit) ||
        (phoneNumber.isEmpty && _isPhoneNumberEdit)) {
      _showSnackBar('Please fill out all fields, None should be left empty.');
      return;
    }

    // Check if the email is valid
    if (!_isValidEmail(email) && _isEmailEdit) {
      _showSnackBar('Invalid email address');
      return;
    }
    if (phoneNumber.length != 10 && _isPhoneNumberEdit) {
      _showSnackBar('Phone number should be of length 10');
      return;
    }
    if (firstname == lastname && (_isFirstNameEdit || _isLastNameEdit)) {
      _showSnackBar('First name and last name cannot be the same');
      return;
    }
    setState(() {
      _isEmailEdit = false;
      _isPhoneNumberEdit = false;
      _isFirstNameEdit = false;
      _isLastNameEdit = false;
      _isCountryCodeEdit = false;
    });
    _showSnackBar('Changes saved successfully.');
  }

  void _showSnackBar(String message) {
    final snackBar = SnackBar(
      content: Text(message),
      duration: Duration(seconds: 3),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  bool _isValidEmail(String email) {
    String emailPattern = r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$';
    RegExp regExp = RegExp(emailPattern);
    return regExp.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      if (orientation == Orientation.landscape) {
        return LandscapeIcon();
      } else {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFFBAC1FF),
            centerTitle: true,
            title: Text(
              'My Account',
              style: TextStyle(
                color: Colors.black,
                fontSize: MediaQuery.of(context).size.shortestSide * 0.06,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),
            leading: ElevatedButton(
              child: Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
              ),
              onPressed: () {
                setState(() {
                  _currentIndex = 0;
                });
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => HomePage())));
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
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    GestureDetector(
                      onTap: _selectPhoto,
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: CircleAvatar(
                              radius: MediaQuery.of(context).size.width * 0.15,
                              backgroundColor:
                                  Color.fromARGB(255, 255, 255, 255),
                              backgroundImage: _selectedPhoto != null
                                  ? FileImage(File(_selectedPhoto!))
                                  : null,
                              child: _selectedPhoto == null
                                  ? Icon(
                                      Icons.person,
                                      size: MediaQuery.of(context).size.width *
                                          0.15,
                                    )
                                  : null,
                            ),
                          ),
                          Image.asset(
                            'assets/edit.png',
                            height: MediaQuery.of(context).size.height * 0.03,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.04,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _isFirstNameEdit = !_isFirstNameEdit;
                              });
                            },
                            child: Field(
                                labelText: "First Name",
                                hintText: "",
                                vertical: 0.03,
                                icon: Icon(Icons.person),
                                horizontal: 0.04,
                                isEditable: _isFirstNameEdit,
                                fieldController: _firstnameController),
                          ),
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.03),
                        Expanded(
                          flex: 2,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _isLastNameEdit = !_isLastNameEdit;
                              });
                            },
                            child: Field(
                                labelText: "Last Name",
                                hintText: "",
                                vertical: 0.03,
                                horizontal: 0.04,
                                isEditable: _isLastNameEdit,
                                fieldController: _lastnameController),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _isEmailEdit = !_isEmailEdit;
                        });
                      },
                      child: Field(
                          labelText: "Email",
                          icon: Icon(Icons.email),
                          hintText: "",
                          vertical: 0.03,
                          horizontal: 0.04,
                          isEditable: _isEmailEdit,
                          fieldController: _emailController),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Row(
                      children: [
                        CustomDropDown(
                            controller: _countryCodeController,
                            flex: 1,
                            ListOfDropDown: _countryCodes,
                            labelText: "Code",
                            onChanged: (_isCountryCodeEdit)
                                ? ((value) {
                                    setState(() {
                                      _countryCodeController.text = value!;
                                    });
                                  })
                                : null,
                            icon: Icon(Icons.phone),
                            isEditable: _isCountryCodeEdit,
                            onTap: () {
                              setState(() {
                                _isCountryCodeEdit = !_isCountryCodeEdit;
                              });
                            },
                            vertical: 0.02,
                            horizontal: 0.02),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.03),
                        Expanded(
                          flex: 2,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _isPhoneNumberEdit = !_isPhoneNumberEdit;
                              });
                            },
                            child: Field(
                                labelText: "Phone Number",
                                // icon: Icon(Icons.phone),
                                hintText: "",
                                keyboardType: TextInputType.phone,
                                vertical: 0.03,
                                horizontal: 0.04,
                                isEditable: _isPhoneNumberEdit,
                                fieldController: _phoneNumberController),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    (_isEmailEdit ||
                            _isPhoneNumberEdit ||
                            _isFirstNameEdit ||
                            _isLastNameEdit ||
                            _isCountryCodeEdit)
                        ? AgreeButton(
                            buttonText: "Done",
                            onPressed: _handleDone,
                            padding: 0.1)
                        : AgreeButton(
                            buttonText: "Edit",
                            onPressed: () {
                              setState(() {
                                _isEmailEdit = true;
                                _isPhoneNumberEdit = true;
                                _isFirstNameEdit = true;
                                _isLastNameEdit = true;
                              });
                            },
                            padding: 0.1),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomButton(
                            onPressed: () {},
                            icon: Icons.credit_card,
                            text: "Payments"),
                        CustomButton(
                            onPressed: () {},
                            icon: Icons.translate_sharp,
                            text: "Language"),
                        CustomButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) => Profile())));
                            },
                            icon: Icons.person,
                            text: "Profile"),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomButton(
                            onPressed: () {},
                            icon: Icons.chat_bubble_outline_rounded,
                            text: "Ask Us"),
                        CustomButton(
                            onPressed: () {},
                            icon: Icons.card_giftcard,
                            text: "Refer & Earn"),
                        CustomButton(
                            onPressed: () {},
                            icon: Icons.feedback_outlined,
                            text: "Feedback"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar: CustomBottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
              switch (index) {
                case 0:
                  // Navigate to Home page
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                  break;
                case 1:
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ServicesPage()));
                  // Navigate to Service page (current page)
                  break;
                case 2:
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HistoryPage()));
                  // Navigate to History page
                  break;
                case 3:
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AccountPage()));
                  // Navigate to Account page
                  break;
              }
            },
          ),
        );
      }
    });
  }
}
