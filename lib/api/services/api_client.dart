import 'package:d4media_sample_demo_app/api/response/login_response.dart';
import 'package:d4media_sample_demo_app/api/response/otp_response.dart';
import 'package:d4media_sample_demo_app/api/response/register_response.dart';
import 'package:d4media_sample_demo_app/api/response/resend_otp_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: "")
abstract class ApiClient {
  factory ApiClient(Dio dio, String baseUrl) {
    dio.options = BaseOptions(
      receiveTimeout: 5000,
      connectTimeout: 5000,
    );
/*
    dio.interceptors.add(PrettyDioLogger(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 200));*/

    return _ApiClient(dio, baseUrl: baseUrl);
  }

  @POST("register")
  Future<RegisterResponse> register(
      @Field("name") String name,
      @Field("dob") String dob,
      @Field("email") String email,
      @Field("phone_number") String phone_number,
      @Field("gender") String gender,
      @Field("password") String password,
      @Field("password_confirmation") String password_confirmation,
      @Field("location_id") String location_id);

  @POST("otpverification")
  Future<OtpResponse> otpVerification(
    @Field("phone_number") String phoneNumber,
    @Field("otp") String otp,
    @Field("user_id") int userId,
  );

  @POST("resend_otp")
  Future<ResendOtpResponse> resendOtp(
    @Field("phone_number") String phoneNo,
    @Field('user_id') int userId,
  );

/*@POST("mobile_number_validation")
  Future<ValidMobileNumberResponse> validMobileNumber(
      @Field("phone_number") String mobileNumber);*/

  @POST("sign_in")
  Future<LoginResponse> login(
    @Field("email_or_phone") String mobileNumber,
    @Field("password") String password,
    @Field("device_token") String deviceToken,
    @Field("device_type") String deviceType,
  );
}
