import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    Key? key,
    required this.hintString,
    this.inputAction = TextInputAction.none,
    required this.inputFormat,
    this.keyboardType = TextInputType.text,
    required this.controller,
    required this.errorMessage,
    required this.onTap,
    required this.errorBorder
  }) : super(key: key);

  String hintString;
  TextInputAction inputAction;
  List<TextInputFormatter> inputFormat;
  TextInputType keyboardType;
  TextEditingController controller;
  String? errorMessage;
  final void Function() onTap;
  InputBorder errorBorder;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0,top: 7.0),
      child: TextField(
        onTap: onTap,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 16,
        ),
        decoration: InputDecoration(
            focusColor: Colors.black45,
            errorText: errorMessage,
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              borderSide: BorderSide(
                color: Color(0xFF244384),
              ),
            ),
            focusedErrorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              borderSide: BorderSide(width: 2,
                color: Color(0xFF244384),
              ),
            ),
            // ignore: unrelated_type_equality_checks
            errorBorder: errorBorder,
            errorStyle: const TextStyle(
            color: Colors.green, fontWeight: FontWeight.bold, fontSize: 14),
        hintText: hintString,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          borderSide: BorderSide(
            color: Color(0xFF244384),
          ),
        ),
      ),
      textInputAction: inputAction,
      inputFormatters: inputFormat,
      keyboardType: keyboardType,
      controller: controller,
    ),);
  }
}
