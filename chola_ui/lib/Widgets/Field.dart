import 'package:flutter/material.dart';

class Field extends StatelessWidget {
  final String labelText;
  final String hintText;
  final Icon? icon;
  final TextInputType? keyboardType;
  final double vertical;
  final double horizontal;
  final double? borderRadius;
  final String? snackbarText;
  final Widget? suffixWidget;
  final Widget? prefixWidget;
  final bool? isEditable;
  final VoidCallback? onTap;
  final Color? color;
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
    this.prefixWidget,
    this.onTap,
    this.color,
    this.isEditable,
    required this.fieldController,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: TextFormField(
        controller: fieldController,
        obscureText: false,
        enabled: isEditable,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(
            color: color ?? Colors.grey,
            fontFamily: 'Roboto Flex',
            fontWeight: FontWeight.w900,
            fontSize: MediaQuery.of(context).size.width * 0.045,
          ),
          hintText: hintText,
          filled: true,
          fillColor: Color.fromARGB(255, 255, 255, 255),
          icon: icon,
          suffixIcon: suffixWidget,
          prefixIcon: prefixWidget,
          contentPadding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.shortestSide * vertical,
            horizontal: MediaQuery.of(context).size.shortestSide * horizontal,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 10.0),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return snackbarText;
          }
          return null;
        },
      ),
    );
  }
}
