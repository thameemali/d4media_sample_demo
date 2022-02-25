import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  late String name;
  late String phoneNumber;
  late String password;
  late String retypePassword;
  String requiredField = '* Required Field';
  String passwordFormat = "Password must contain at least 1 Capital letter,"
      " 1 small letter, 1 number ,and 1 special character like !@#\$&*~";
  bool validateAfterClick = false;
  RxString passFormatNeeded=''.obs;

  RxString nameError = ''.obs;
  RxString phoneError = ''.obs;
  RxString passwordError = ''.obs;
  RxString retypePasswordError = ''.obs;

  final nameController = TextEditingController();
  final phoneNoController = TextEditingController();
  final passwordController = TextEditingController();
  final retypePasswordController = TextEditingController();

  RxString nameValidator() {
    name = nameController.text;
    if (name.isEmpty) {
      nameError.value = requiredField;
    } else if (name.length < 3) {
      nameError.value = 'Name should have at least 4 letters';
    } else {
      nameError.value = '';
    }
    return nameError;
  }

  RxString phoneValidator() {
    phoneNumber = phoneNoController.text;
    if (phoneNumber.isEmpty) {
      phoneError.value = requiredField;
    } else if (phoneNumber.length < 10) {
      phoneError.value = 'Phone number should be 10 digits';
    } else {
      phoneError.value = '';
    }
    return phoneError;
  }

  bool validateStructure(String value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  RxString passwordValidator() {
    password = passwordController.text;
    if (password.isEmpty) {
      passwordError.value = requiredField;
    } else if (validateStructure(password) != true) {
      passwordError.value = "";
      passFormatNeeded.value='hello';
    } else if (password.length < 10) {
      passwordError.value = 'Password should be at least 10 letters long';
    } else {
      passwordError.value = '';
      passFormatNeeded.value='';
    }
    return passwordError;
  }

  RxString retypePasswordValidator() {
    retypePassword = retypePasswordController.text;
    if (retypePassword.isEmpty) {
      retypePasswordError.value = requiredField;
    } else if (retypePassword != password && retypePassword.length<10) {
      retypePasswordError.value = 'Password Mismatch';
    } else {
      retypePasswordError.value = '';
    }
    return retypePasswordError;
  }

  bool buttonClickedValidation() {
    if (nameValidator().value == '' &&
        phoneValidator().value == '' &&
        passwordValidator().value == '' &&
        retypePasswordValidator().value == '') {
      return true;
    } else {
      return false;
    }
  }
}
