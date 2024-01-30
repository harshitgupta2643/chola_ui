import 'package:flutter/material.dart';

class CustomMenuIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget? child_widget;

  const CustomMenuIconButton(
      {Key? key, required this.onPressed, this.child_widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: CircleAvatar(
        backgroundColor: Colors.black,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.015,
            vertical: MediaQuery.of(context).size.height * 0.015,
          ),
          child: child_widget,
        ),
      ),
    );
  }
}
