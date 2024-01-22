import 'package:flutter/material.dart';

class BackButton1 extends StatelessWidget {
  const BackButton1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Icon(
        Icons.arrow_back_ios_new,
        color: Colors.white,
      ),
      onPressed: () {
        Navigator.pop(context);
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
    );
  }
}
