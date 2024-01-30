import 'package:flutter/material.dart';

class AgreeButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final double padding;
  final Widget? prefixWidget; // New parameter for the prefix icon

  const AgreeButton({
    Key? key,
    required this.buttonText,
    required this.onPressed,
    required this.padding,
    this.prefixWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * padding,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.all(0),
          primary: Colors.transparent,
        ),
        child: Ink(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(217, 40, 180, 1),
                Color.fromRGBO(67, 32, 219, 1)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.03,
              vertical: MediaQuery.of(context).size.width * 0.02,
            ),
            child: Row(
              children: [
                if (prefixWidget != null) prefixWidget!,
                SizedBox(width: 8), // Add some spacing between prefix and text
                Center(
                  child: Text(
                    buttonText,
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.05,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
