import 'package:flutter/material.dart';

class RideButton extends StatelessWidget {
  final ImageProvider image;
  final String text;

  RideButton({required this.image, required this.text});

  @override
  Widget build(BuildContext context) {
    double buttonSize =
        MediaQuery.of(context).size.width * 0.2; // Adjust as needed

    return Column(
      children: [
        GestureDetector(
          onTap: () {
            // Navigate to the specific ride page
            // Example: Navigator.pushNamed(context, '/ridePage1');
          },
          child: Container(
            width: buttonSize,
            height: buttonSize,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: image,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(height: 8.0),
        Text(text),
      ],
    );
  }
}
