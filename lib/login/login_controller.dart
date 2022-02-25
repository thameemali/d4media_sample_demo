import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  late String mobileNo;
  late String password;
  final String validMobile = '9400477889';
  final String validPassword = 'abc123';
  bool validateAfterClick = false;
  RxString mobileError = ''.obs;
  RxString passwordError = ''.obs;

  final mobileNoController = TextEditingController();
  final passwordController = TextEditingController();

  RxString mobileValidation() {
    mobileNo = mobileNoController.text;
    if (mobileNo.isEmpty) {
      mobileError.value = '*Required Field';
    } else if (mobileNo != validMobile) {
      mobileError.value = 'Please check your Mobile number';
    } else {
      mobileError.value = '';
    }
    return mobileError;
  }

  RxString passwordValidation() {
    password = passwordController.text;
    if (password.isEmpty) {
      passwordError.value = '*Required Field';
    } else if (password != validPassword) {
      passwordError.value = 'Password is Incorrect';
    } else {
      passwordError.value = '';
    }
    return passwordError;
  }

  bool buttonClickedValidation() {
    if (mobileValidation().value == '' && passwordValidation().value == '') {
      return true;
    } else {
      return false;
    }
  }

  InputBorder noErrorBorderFun() => const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        borderSide: BorderSide(
          color: Color(0xFF244384),
        ),
      );

  errorBorderFun() => const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        borderSide: BorderSide(
          color: Colors.green,
        ),
      );
}
