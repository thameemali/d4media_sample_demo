import 'package:d4media_sample_demo_app/api/error_handler/server_error.dart';
import 'package:d4media_sample_demo_app/api/generic/base_model.dart';
import 'package:d4media_sample_demo_app/api/response/login_response.dart';
import 'package:d4media_sample_demo_app/api/response/otp_response.dart';
import 'package:d4media_sample_demo_app/api/response/register_response.dart';
import 'package:d4media_sample_demo_app/api/response/resend_otp_response.dart';
import 'package:dio/dio.dart';

import 'api_client.dart';

class ApiService {
  late Dio dio;
  late ApiClient client;

  String baseUrl = "https://dev.qaccess.qa/en/api/";

  ApiService() {
    dio = new Dio();
    client = ApiClient(dio, baseUrl);
  }

  Future<BaseModel<RegisterResponse>> register(
    String name,
    String phone_number,
    String email,
    String password,
    String password_confirmation,
  ) async {
    RegisterResponse response;
    try {
      response = await client.register(name, "1994-6-22", email, phone_number,
          "1", password, password_confirmation, "1");
    } catch (error, stacktrace) {
      print(stacktrace);
      return BaseModel()
        ..setException(ServerError.withErrorAndCode(error: error as DioError));
    }
    return BaseModel()..data = response;
  }

  Future<BaseModel<OtpResponse>> otpVerification(
    String phoneNumber,
    String otp,
    int userId,
  ) async {
    OtpResponse response;
    try {
      response = await client.otpVerification(phoneNumber,otp,userId);
    } catch (error, stacktrace) {
      print(stacktrace);
      return BaseModel()
        ..setException(ServerError.withErrorAndCode(error: error as DioError));
    }
    return BaseModel()..data = response;
  }

Future<BaseModel<ResendOtpResponse>> resendOtp(String phoneNo,int userId) async {
    ResendOtpResponse response;
    try {
      response = await client.resendOtp(phoneNo,userId);
    } catch (error, stacktrace) {
      print(stacktrace);
      return BaseModel()
        ..setException(ServerError.withErrorAndCode(error: error as DioError));
    }
    return BaseModel()..data = response;
  }

/*Future<BaseModel<ValidMobileNumberResponse>> validMobileNumber(
      String mobileNumber) async {
    ValidMobileNumberResponse response;
    try {
      response = await client.validMobileNumber(mobileNumber);
    } catch (error, stacktrace) {
      print(stacktrace);
      return BaseModel()
        ..setException(ServerError.withErrorAndCode(error: error as DioError));
    }
    return BaseModel()..data = response;
  }*/

  Future<BaseModel<LoginResponse>> login(
      String mobileNumber, String password) async {
    LoginResponse response;
    try {
      response = await client.login(
          mobileNumber,
          password,'android','Adsdsaf');
    } catch (error, stacktrace) {
      print(stacktrace);
      return BaseModel()
        ..setException(ServerError.withErrorAndCode(error: error as DioError));
    }
    return BaseModel()..data = response;
  }
}
