import 'package:flutter/material.dart';

class CustomDropDown extends StatefulWidget {
  final TextEditingController controller;
  final List<String> ListOfDropDown;
  final int flex;
  final String labelText;
  final ValueChanged<String?>? onChanged; // Updated type
  final Icon? icon;
  final double vertical;
  final double horizontal;

  CustomDropDown({
    required this.controller,
    required this.flex,
    this.onChanged,
    required this.ListOfDropDown,
    required this.labelText,
    this.icon,
    required this.vertical,
    required this.horizontal,
  });

  @override
  _CustomDropDownState createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: widget.flex,
      child: DropdownButtonFormField<String>(
        value: widget.controller.text.isNotEmpty
            ? widget.controller.text
            : widget.ListOfDropDown.last,

        onChanged: widget.onChanged, // No need to modify this line
        items: widget.ListOfDropDown.map<DropdownMenuItem<String>>(
          (String value) {
            return DropdownMenuItem<String>(
              value: value,
              alignment: Alignment.center,
              child: Text(value),
            );
          },
        ).toList(),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          labelText: widget.labelText,
          labelStyle: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: MediaQuery.of(context).size.width * 0.06),
          icon: widget.icon,
          contentPadding: EdgeInsets.symmetric(
            vertical:
                MediaQuery.of(context).size.shortestSide * widget.vertical,
            horizontal:
                MediaQuery.of(context).size.shortestSide * widget.horizontal,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }
}
