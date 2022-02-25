import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  CustomElevatedButton({
    Key? key,
    required this.showText,
    required this.buttonAction,
  }) : super(key: key);
  String showText;
  final void Function() buttonAction;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: ElevatedButton(
        onPressed:buttonAction,
        child: Text(
          showText,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(
            const Color(0xFF244384),
          ),
        ),
      ),
    );
  }
}
