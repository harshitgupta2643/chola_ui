import 'package:flutter/material.dart';

class Field extends StatelessWidget {
  final String labelText;
  final String hintText;
  final Icon? icon;
  final TextInputType? keyboardType;
  final double vertical;
  final double horizontal;
  final String? snackbarText;
  final Widget? suffixWidget;
  final TextEditingController fieldController;

  Field({
    Key? key,
    required this.labelText,
    required this.hintText,
    this.icon,
    this.keyboardType,
    required this.vertical,
    required this.horizontal,
    this.snackbarText,
    this.suffixWidget,
    required this.fieldController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: fieldController,
      obscureText: false,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: MediaQuery.of(context).size.width * 0.059),
        hintText: hintText,
        filled: true,
        fillColor: Color.fromARGB(255, 255, 255, 255),
        icon: icon,
        suffixIcon: suffixWidget,
        contentPadding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.shortestSide * vertical,
          horizontal: MediaQuery.of(context).size.shortestSide * horizontal,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return snackbarText;
        }
        return null;
      },
    );
  }
}
