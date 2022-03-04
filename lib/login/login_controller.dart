import 'package:d4media_sample_demo_app/api/error_handler/server_error.dart';
import 'package:d4media_sample_demo_app/api/services/api_services.dart';
import 'package:d4media_sample_demo_app/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';

class LoginController extends GetxController {
  late ProgressDialog prDialog;

  late ApiService _apiService;
  late String mobileNo;
  late String password;

  bool validateAfterClick = false;
  RxString mobileError = ''.obs;
  RxString passwordError = ''.obs;
  final userData = GetStorage();

  final mobileNoController = TextEditingController();
  final passwordController = TextEditingController();

  RxString mobileValidation() {
    prDialog.hide();
    mobileNo = mobileNoController.text;
    if (mobileNo.isEmpty) {
      mobileError.value = '*Required Field';
    } else {
      mobileError.value = '';
    }
    return mobileError;
  }

  RxString passwordValidation() {
    prDialog.hide();
    password = passwordController.text;
    if (password.isEmpty) {
      passwordError.value = '*Required Field';
    } else {
      passwordError.value = '';
    }
    return passwordError;
  }

  bool buttonClickedValidation() {
    if (mobileValidation().value == '' && passwordValidation().value == '') {
      prDialog.show();
      apilogin();
      prDialog.hide();
      return true;
    } else {
      return false;
    }
  }

  @override
  void onInit() {
    _apiService = ApiService();
    super.onInit();
  }

  apilogin() {
    _apiService
        .login(mobileNoController.text, passwordController.text)
        .then((response) {
      if (response.getException != null) {
        prDialog.hide();
        ServerError errorResponse = response.getException;
        Fluttertoast.showToast(
            msg: errorResponse.getErrorMessage(),
            toastLength: Toast.LENGTH_SHORT);
      } else if (response.data?.status.toString().toLowerCase() == 'true') {
        prDialog.hide();
        userData.write('isLogged', true);
        userData.write('username', mobileNoController.text);
        Get.offAll(() => HomePage());
        /*MySnackBar.showSnackBar(
            "${response.data?.message}", "${response.data?.result?.msg}");*/
        Fluttertoast.showToast(
            msg: '${response.data?.result?.msg}',
            toastLength: Toast.LENGTH_SHORT);
      } else if (response.data?.status.toString().toLowerCase() == 'false') {
        prDialog.hide();
        /*MySnackBar.errorSnackBar(
            "${response.data?.message}", "${response.data?.result?.msg}");*/
        Fluttertoast.showToast(
            msg: '${response.data?.result?.msg}',
            toastLength: Toast.LENGTH_SHORT);
      }
    });
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

  customProgressbarFunction(context){
    prDialog = ProgressDialog(
        context,
        type: ProgressDialogType.normal,
        textDirection: TextDirection.ltr,
        showLogs: false,
        isDismissible: true,
        customBody: Image.asset('assets/gifs/bars.gif',width: 40,height: 40,fit: BoxFit.cover,)
    );
    prDialog.style(message: "",
      borderRadius: 10.0,backgroundColor: Colors.white10,
      progressWidgetAlignment: Alignment.center,
      insetAnimCurve: Curves.easeInOut,
      /*progressTextStyle: const TextStyle(
            color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w400),
        messageTextStyle: const TextStyle(
            color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w600)*/
    );
  }
}
