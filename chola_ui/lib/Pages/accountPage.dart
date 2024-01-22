import 'dart:io';

import 'package:chola_chariots_ui/Pages/Services.dart';
import 'package:chola_chariots_ui/Pages/history.dart';
import 'package:chola_chariots_ui/Pages/homePage.dart';
import 'package:chola_chariots_ui/Widgets/BackButton.dart';
import 'package:chola_chariots_ui/Widgets/DropDown.dart';
import 'package:chola_chariots_ui/Widgets/Field.dart';
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

  @override
  Widget build(BuildContext context) {
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
            Navigator.push(
                context, MaterialPageRoute(builder: ((context) => HomePage())));
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
        // child: Padding(
        //   padding: EdgeInsets.symmetric(
        //     horizontal: MediaQuery.of(context).size.width * 0.04,
        //     vertical: MediaQuery.of(context).size.height * 0.03,
        //   ),
        //   child: SingleChildScrollView(
        //       child: Form(
        //     child: Column(
        //       crossAxisAlignment: CrossAxisAlignment.stretch,
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: [
        //         GestureDetector(
        //           onTap: _selectPhoto,
        //           child: Stack(
        //             alignment: Alignment.bottomCenter,
        //             children: [
        //               Align(
        //                 alignment: Alignment.center,
        //                 child: CircleAvatar(
        //                   radius: MediaQuery.of(context).size.width * 0.1,
        //                   backgroundColor: Color.fromARGB(91, 158, 158, 158),
        //                   backgroundImage: _selectedPhoto != null
        //                       ? FileImage(File(_selectedPhoto!))
        //                       : null,
        //                   child: _selectedPhoto == null
        //                       ? Icon(
        //                           Icons.person,
        //                           size: MediaQuery.of(context).size.width * 0.1,
        //                         )
        //                       : null,
        //                 ),
        //               ),
        //               Image.asset('assets/edit.png',
        //                   height: MediaQuery.of(context).size.height * 0.02),
        //             ],
        //           ),
        //         ),
        //         SizedBox(
        //           height: MediaQuery.of(context).size.width * 0.05,
        //         ),
        //         Row(
        //           children: [
        //             Expanded(
        //               flex: 2,
        //               child: Field(
        //                   labelText: "First Name",
        //                   hintText: "Enter Your First Name",
        //                   icon: Icon(Icons.person),
        //                   vertical: 0.03,
        //                   horizontal: 0.04,
        //                   snackbarText: 'Please enter your firstname',
        //                   fieldController: _firstnameController),
        //             ),
        //             SizedBox(width: MediaQuery.of(context).size.width * 0.03),
        //             Expanded(
        //               flex: 2,
        //               child: Field(
        //                   labelText: "Last Name",
        //                   hintText: "Enter Your Last Name",
        //                   vertical: 0.03,
        //                   horizontal: 0.04,
        //                   snackbarText: 'Please enter your Lastname',
        //                   fieldController: _lastnameController),
        //             ),
        //           ],
        //         ),
        //         SizedBox(
        //           height: MediaQuery.of(context).size.width * 0.05,
        //         ),
        //         Field(
        //             labelText: "Email",
        //             hintText: "Enter Your Email",
        //             keyboardType: TextInputType.emailAddress,
        //             vertical: 0.03,
        //             horizontal: 0.04,
        //             icon: Icon(Icons.email),
        //             snackbarText: 'Please enter your Email',
        //             fieldController: _emailController),
        //         SizedBox(
        //           height: MediaQuery.of(context).size.width * 0.05,
        //         ),
        //         Row(
        //           children: [
        //             CustomDropDown(
        //                 controller: _countryCodeController,
        //                 flex: 1,
        //                 ListOfDropDown: _countryCodes,
        //                 labelText: "Code",
        //                 onChanged: (value) {
        //                   setState(() {
        //                     _countryCodeController.text = value!;
        //                   });
        //                 },
        //                 icon: Icon(Icons.phone),
        //                 vertical: 0.02,
        //                 horizontal: 0.02),
        //             SizedBox(width: MediaQuery.of(context).size.width * 0.03),
        //             Expanded(
        //               flex: 2,
        //               child: Field(
        //                   labelText: "Phone Number",
        //                   hintText: "Enter Your Phone Number",
        //                   keyboardType: TextInputType.phone,
        //                   vertical: 0.03,
        //                   horizontal: 0.03,

        //                   // icon: Icon(Icons.phone),
        //                   snackbarText: 'Please enter your Phone Number',
        //                   fieldController: _phoneNumberController),
        //             ),
        //           ],
        //         ),
        //       ],
        //     ),
        //   )),
        // ),
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
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
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
}
