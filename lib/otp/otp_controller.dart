import 'package:d4media_sample_demo_app/api/error_handler/server_error.dart';
import 'package:d4media_sample_demo_app/api/services/api_services.dart';
import 'package:d4media_sample_demo_app/home/home_page.dart';
import 'package:d4media_sample_demo_app/login/login_controller.dart';
import 'package:d4media_sample_demo_app/register/register_controller.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';

class OtpController extends GetxController {
  late ApiService _apiService;
  final RegisterController registerController = Get.find();
  final LoginController loginController = Get.put(LoginController());

  late String enteredOTP;
  final otpFieldController = OtpFieldController();

  @override
  void onInit() {
    _apiService = ApiService();
    super.onInit();
  }

  verifyOtp() {
    _apiService
        .otpVerification(loginController.userData.read('mobileNo'), enteredOTP,
            loginController.userData.read('userId'))
        .then((response) {
      if (response.getException != null) {
        ServerError errorResponse = response.getException;
        Fluttertoast.showToast(
            msg: errorResponse.getErrorMessage(),
            toastLength: Toast.LENGTH_SHORT);
      } else if (response.data?.status.toString().toLowerCase() == 'true') {
        Get.to(() => HomePage());
        Fluttertoast.showToast(
            msg: response.data!.result!.msg.toString(),
            toastLength: Toast.LENGTH_LONG);
      } else if (response.data?.status.toString().toLowerCase() == 'false') {
        Fluttertoast.showToast(
            msg: response.data!.result!.msg.toString(),
            toastLength: Toast.LENGTH_LONG);
      }
    });
  }

  otpResend() {
    _apiService
        .resendOtp(loginController.userData.read('mobileNo'),
            loginController.userData.read('userId'))
        .then((response) {
      if (response.getException != null) {
        ServerError errorResponse = response.getException;
        Fluttertoast.showToast(
            msg: errorResponse.getErrorMessage(),
            toastLength: Toast.LENGTH_SHORT);
      } else if (response.data?.status.toString().toLowerCase() == 'true') {
        Fluttertoast.showToast(
            msg:
                "${response.data!.result!.msg.toString()} to ${response.data?.result?.otp}",
            toastLength: Toast.LENGTH_LONG,gravity: ToastGravity.CENTER);
      } else if (response.data?.status.toString().toLowerCase() == 'true') {
        Fluttertoast.showToast(
            msg: response.data!.result!.msg.toString(),
            toastLength: Toast.LENGTH_LONG);
      }
    });
  }
}
