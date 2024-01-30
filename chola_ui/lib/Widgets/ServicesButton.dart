import 'package:flutter/material.dart';

class ServiceButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Widget child_widget;

  const ServiceButton({
    Key? key,
    required this.onPressed,
    required this.child_widget,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.all(0),
              primary: Colors.transparent,
            ),
            child: Ink(
              decoration: BoxDecoration(
                color: Color(0x7F152BF2),
                borderRadius: BorderRadius.circular(16),
                shape: BoxShape.rectangle,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.03,
                  vertical: MediaQuery.of(context).size.height * 0.03,
                ),
                child: child_widget,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Text(
            text,
            style: TextStyle(
              color: Colors.black,
              fontSize: MediaQuery.of(context).size.shortestSide * 0.05,
              fontFamily: 'Roboto Flex',
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }
}
