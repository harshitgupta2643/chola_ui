import 'package:flutter/material.dart';

class DobField extends StatefulWidget {
  final String labelText;
  final String hintText;
  final double vertical;
  final double horizontal;
  final Icon? icon;
  final String? snackbarText;
  final TextEditingController dobController;

  DobField({
    Key? key,
    required this.labelText,
    required this.hintText,
    required this.vertical,
    required this.horizontal,
    this.snackbarText,
    this.icon,
    required this.dobController,
  }) : super(key: key);

  @override
  _DobFieldState createState() => _DobFieldState();
}

class _DobFieldState extends State<DobField> {
  DateTime? selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        widget.dobController.text = "${picked.toLocal()}".split(' ')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.dobController,
      onTap: () => _selectDate(context),
      readOnly: true,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        labelText: widget.labelText,
        labelStyle: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: MediaQuery.of(context).size.width * 0.06,
        ),
        hintText: widget.hintText,
        icon: widget.icon,
        contentPadding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.shortestSide * widget.vertical,
          horizontal:
              MediaQuery.of(context).size.shortestSide * widget.horizontal,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return widget.snackbarText;
        }
        return null;
      },
    );
  }
}
