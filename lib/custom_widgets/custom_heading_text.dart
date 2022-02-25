import 'package:flutter/material.dart';

class CustomHeadingText extends StatelessWidget {
  CustomHeadingText({Key? key, required this.headingText}) : super(key: key);

  String headingText;

  @override
  Widget build(BuildContext context) {
    return Text(
      headingText,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 25,
      ),
    );
  }
}
