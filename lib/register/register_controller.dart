import 'package:d4media_sample_demo_app/api/error_handler/server_error.dart';
import 'package:d4media_sample_demo_app/api/services/api_services.dart';
import 'package:d4media_sample_demo_app/login/login_controller.dart';
import 'package:d4media_sample_demo_app/otp/otp_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  LoginController loginController = Get.find();

  late ApiService _apiService;
  late String name;
  late String phoneNumber;
  late String email;
  late String password;
  late String retypePassword;
  String requiredField = '* Required Field';
  String passwordFormat = "Password must contain at least 1 Capital letter,"
      " 1 small letter, 1 number ,and 1 special character like !@#\$&*~";
  bool validateAfterClick = false;
  RxString passFormatNeeded = ''.obs;

  RxString nameError = ''.obs;
  RxString phoneError = ''.obs;
  RxString emailError = ''.obs;
  RxString passwordError = ''.obs;
  RxString retypePasswordError = ''.obs;

  final nameController = TextEditingController();
  final phoneNoController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final retypePasswordController = TextEditingController();



  RxString nameValidator() {
    loginController.prDialog.hide();
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
    loginController.prDialog.hide();
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

  RxString emailValidator() {
    loginController.prDialog.hide();
    email = emailController.text;
    if (email.isEmpty) {
      emailError.value = requiredField;
    } else if (isEmail(email) != true) {
      emailError.value = 'wrong Email/format';
    } else {
      emailError.value = '';
    }
    return emailError;
  }

  bool isEmail(String em) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp =  RegExp(p);
    return regExp.hasMatch(em);
  }

  bool validateStructure(String value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  RxString passwordValidator() {
    loginController.prDialog.hide();
    password = passwordController.text;
    if (password.isEmpty) {
      passwordError.value = requiredField;
    } else if (validateStructure(password) != true) {
      passwordError.value = "";
      passFormatNeeded.value = 'hello';
    } else if (password.length < 10) {
      passwordError.value = 'Password should be at least 10 letters long';
    } else {
      passwordError.value = '';
      passFormatNeeded.value = '';
    }
    return passwordError;
  }

  RxString retypePasswordValidator() {
    loginController.prDialog.hide();
    retypePassword = retypePasswordController.text;
    if (retypePassword.isEmpty) {
      retypePasswordError.value = requiredField;
    } else if (retypePassword != password && retypePassword.length < 10) {
      retypePasswordError.value = 'Password Mismatch';
    } else {
      retypePasswordError.value = '';
    }
    return retypePasswordError;
  }

  bool buttonClickedValidation() {
    loginController.prDialog.hide();
    if (nameValidator().value == '' &&
        phoneValidator().value == '' &&
        emailValidator().value == '' &&
        passwordValidator().value == '' &&
        retypePasswordValidator().value == '') {
      loginController.userData.write('mobileNo', phoneNoController.text);
      loginController.prDialog.show();
      registration();
      loginController.prDialog.hide();
      return true;
    } else {
      loginController.prDialog.hide();
      return false;
    }
  }

  @override
  void onInit() {
    _apiService = ApiService();
    super.onInit();
  }

  registration() {
    _apiService
        .register(
            nameController.text,
            phoneNoController.text,
            emailController.text,
            passwordController.text,
            retypePasswordController.text)
        .then((response) {
      if (response.getException != null) {
        loginController.prDialog.hide();
        ServerError errorResponse = response.getException;
        //MySnackBar.errorSnackBar("Failed", errorResponse.getErrorMessage());
        Fluttertoast.showToast(
            msg: errorResponse.getErrorMessage(),
            toastLength: Toast.LENGTH_SHORT);
      } else if (response.data?.status.toString().toLowerCase() == 'true') {
        loginController.prDialog.hide();
        loginController.userData.write('userId', response.data?.result?.userId);
        Get.to(() => OtpPage());
        Fluttertoast.showToast(
            msg:
                "${response.data?.result?.msg} is ${response.data?.result?.otp}",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER);
        print("${response.data?.result?.msg} is ${response.data?.result?.otp}");
        /*MySnackBar.showSnackBar("${response.data?.result?.userId}",
            "${response.data?.result?.msg} is ${response.data?.result?.otp}");*/
      } else if (response.data?.status.toString().toLowerCase() == 'false') {
        loginController.prDialog.hide();
        Fluttertoast.showToast(
            msg: "${response.data?.result?.msg}",
            toastLength: Toast.LENGTH_SHORT);
        print("${response.data?.result?.msg}");
      }
    });
  }
}
