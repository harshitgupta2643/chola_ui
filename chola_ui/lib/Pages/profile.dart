import 'dart:io';

import 'package:chola_chariots_ui/Widgets/BackButton.dart';
import 'package:chola_chariots_ui/Widgets/Buttonfill.dart';
import 'package:chola_chariots_ui/Widgets/Date.dart';
import 'package:chola_chariots_ui/Widgets/DropDown.dart';
import 'package:chola_chariots_ui/Widgets/Field.dart';
import 'package:chola_chariots_ui/Widgets/LanscapeIcon.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _bloodgroupController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _insuranceNumberController =
      TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();

  bool _isInsuranceEdit = false;

  bool _isFirstNameEdit = false;
  bool _isLastNameEdit = false;
  bool _isDobEdit = false;
  bool _isBloodEdit = false;
  bool _isGenderEdit = false;

  String? _selectedPhoto;
  List<String> _bloodGroup = ['A+', 'A-', 'B+', 'B-', 'O-', 'O+', 'AB+', 'AB-'];
  List<String> _Gender = ['Male', 'Female', 'Other', 'Prefer Not\n to Say'];

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
    String companyname = _companyNameController.text;
    String insuranceNumber = _insuranceNumberController.text;
    String dob = _dobController.text;
    String expiryDate = _expiryDateController.text;

    // Check if any of the required fields are empty
    if ((firstname.isEmpty && _isFirstNameEdit) ||
        (lastname.isEmpty && _isLastNameEdit) ||
        (companyname.isEmpty && _isInsuranceEdit) ||
        (insuranceNumber.isEmpty && _isInsuranceEdit) ||
        (dob.isEmpty && _isDobEdit) ||
        (expiryDate.isEmpty && _isInsuranceEdit)) {
      _showSnackBar('Please fill out all fields, None should be left empty.');
      return;
    }
    if (firstname == lastname && (_isFirstNameEdit || _isLastNameEdit)) {
      _showSnackBar('First name and last name cannot be the same');
      return;
    }
    setState(() {
      _isFirstNameEdit = false;
      _isLastNameEdit = false;
      _isDobEdit = false;
      _isBloodEdit = false;
      _isInsuranceEdit = false;
      _isGenderEdit = false;
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
              'Profile',
              style: TextStyle(
                color: Colors.black,
                fontSize: MediaQuery.of(context).size.shortestSide * 0.06,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),
            leading: BackButton1(),
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
                    GestureDetector(
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
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    GestureDetector(
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
                          icon: Icon(Icons.person),
                          fieldController: _lastnameController),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Row(
                      children: [
                        CustomDropDown(
                          controller: _bloodgroupController,
                          flex: 1,
                          onChanged: (_isBloodEdit)
                              ? ((value) {
                                  setState(() {
                                    _bloodgroupController.text = value!;
                                  });
                                })
                              : null,
                          ListOfDropDown: _bloodGroup,
                          labelText: "BloodGroup",
                          icon: Icon(Icons.bloodtype),
                          vertical: 0.02,
                          isEditable: _isBloodEdit,
                          horizontal: 0.02,
                          onTap: () {
                            setState(() {
                              _isBloodEdit = !_isBloodEdit;
                            });
                          },
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.01),
                        Expanded(
                          flex: 1,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _isDobEdit = !_isDobEdit;
                              });
                            },
                            child: DobField(
                              labelText: "DOB",
                              suffixicon: Icon(Icons.date_range_outlined),
                              hintText: "Enter Your DOB",
                              vertical: 0.03,
                              isEditable: _isDobEdit,
                              horizontal: 0.04,
                              // icon: Icon(Icons.calendar_today),
                              dobController: _dobController,
                            ),
                          ),
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.01),
                        CustomDropDown(
                          flex: 1,
                          controller: _genderController,
                          onChanged: (_isGenderEdit)
                              ? ((value) {
                                  setState(() {
                                    _genderController.text = value!;
                                  });
                                })
                              : null,
                          ListOfDropDown: _Gender,
                          labelText: "Gender",
                          isEditable: _isGenderEdit,
                          vertical: 0.02,
                          horizontal: 0.02,
                          onTap: () {
                            setState(() {
                              _isGenderEdit = !_isGenderEdit;
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Card(
                      margin: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * 0.02,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(
                          MediaQuery.of(context).size.width * 0.04,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Medical Insurance',
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.shortestSide *
                                        0.04,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _isInsuranceEdit = !_isInsuranceEdit;
                                });
                              },
                              child: Field(
                                labelText: "Company Name",
                                hintText: "",
                                vertical: 0.03,
                                icon: Icon(Icons.business),
                                horizontal: 0.04,
                                isEditable: _isInsuranceEdit,
                                fieldController: _companyNameController,
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _isInsuranceEdit = !_isInsuranceEdit;
                                });
                              },
                              child: Field(
                                labelText: "Insurance Number",
                                hintText: "",
                                vertical: 0.03,
                                icon: Icon(Icons.confirmation_num),
                                horizontal: 0.04,
                                isEditable: _isInsuranceEdit,
                                fieldController: _insuranceNumberController,
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _isInsuranceEdit = !_isInsuranceEdit;
                                });
                              },
                              child: DobField(
                                labelText: "Expiry Date",
                                hintText: "Enter Expiry Date",
                                icon: Icon(Icons.calendar_month_outlined),
                                suffixicon: Icon(Icons.date_range_outlined),
                                vertical: 0.03,
                                isEditable: _isInsuranceEdit,
                                horizontal: 0.04,
                                dobController: _expiryDateController,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    (_isFirstNameEdit ||
                            _isLastNameEdit ||
                            _isDobEdit ||
                            _isGenderEdit ||
                            _isBloodEdit ||
                            _isInsuranceEdit)
                        ? AgreeButton(
                            buttonText: "OKAY",
                            onPressed: _handleDone,
                            padding: 0.1)
                        : AgreeButton(
                            buttonText: "Edit",
                            onPressed: () {
                              setState(() {
                                _isFirstNameEdit = true;
                                _isLastNameEdit = true;
                                _isDobEdit = true;
                                _isBloodEdit = true;
                                _isGenderEdit = true;
                                _isInsuranceEdit = true;
                              });
                            },
                            padding: 0.1),
                  ],
                ),
              ),
            ),
          ),
        );
      }
    });
  }
}
