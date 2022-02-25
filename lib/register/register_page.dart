import 'package:d4media_sample_demo_app/custom_widgets/custom_elevated_button.dart';
import 'package:d4media_sample_demo_app/custom_widgets/custom_heading_text.dart';
import 'package:d4media_sample_demo_app/custom_widgets/custom_logo_image.dart';
import 'package:d4media_sample_demo_app/custom_widgets/custom_text_field.dart';
import 'package:d4media_sample_demo_app/login/login_controller.dart';
import 'package:d4media_sample_demo_app/otp/otp_page.dart';
import 'package:d4media_sample_demo_app/register/password_error_message.dart';
import 'package:d4media_sample_demo_app/register/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);

  final RegisterController _registerController = Get.put(RegisterController());
  final LoginController _loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.loose,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomLogoImage(imagePath: 'assets/images/d4media_logo.png'),
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: CustomHeadingText(
                    headingText: 'Registration',
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 220.0),
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/himalaya (1).png'),
                  opacity: 200,
                  alignment: Alignment.bottomCenter,
                ),
              ),
              child: Container(
                margin: const EdgeInsets.only(bottom: 20.0),
                child: ListView(
                  children: [
                    Obx(
                      () => CustomTextField(
                        errorMessage: _registerController.nameError.value,
                        hintString: 'Name',
                        inputAction: TextInputAction.next,
                        inputFormat: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'[a-zA-Z]')),
                        ],
                        controller: _registerController.nameController,
                        onTap: () {
                          _registerController.nameError.value = '';
                        },
                        errorBorder: _registerController.nameError.value == ''
                            ? _loginController.noErrorBorderFun()
                            : _loginController.errorBorderFun(),
                      ),
                    ),
                    Obx(
                      () => CustomTextField(
                        errorMessage: _registerController.phoneError.value,
                        hintString: 'Phone Number',
                        keyboardType: TextInputType.number,
                        inputAction: TextInputAction.next,
                        inputFormat: [
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          LengthLimitingTextInputFormatter(10),
                        ],
                        controller: _registerController.phoneNoController,
                        onTap: () {
                          _registerController.phoneError.value = '';
                        },
                        errorBorder: _registerController.phoneError.value == ''
                            ? _loginController.noErrorBorderFun()
                            : _loginController.errorBorderFun(),
                      ),
                    ),
                    Obx(
                      () => CustomTextField(
                        errorMessage: _registerController.passwordError.value,
                        hintString: 'Enter Your Password',
                        inputAction: TextInputAction.next,
                        inputFormat: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'[0-9a-zA-Z.,!@#$%^&*]')),
                        ],
                        controller: _registerController.passwordController,
                        onTap: () {
                          _registerController.passwordError.value = '';
                        },
                        errorBorder: _registerController.passwordError.value ==
                                ''
                            ? _registerController.passFormatNeeded.value == ''
                                ? _loginController.noErrorBorderFun()
                                : _loginController.errorBorderFun()
                            : _loginController.errorBorderFun(),
                      ),
                    ),
                    PasswordErrorMessage(),
                    Obx(
                      () => CustomTextField(
                        hintString: 'Confirm Password',
                        inputAction: TextInputAction.done,
                        inputFormat: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'[0-9a-zA-Z.,!@#$%^&*]')),
                        ],
                        controller:
                            _registerController.retypePasswordController,
                        errorMessage:
                            _registerController.passFormatNeeded.value == ''
                                ? _registerController.retypePasswordError.value
                                : '',
                        onTap: () {
                          _registerController.retypePasswordError.value = '';
                        },
                        errorBorder:
                            _registerController.retypePasswordError.value == ''
                                ? _loginController.noErrorBorderFun()
                                : _loginController.errorBorderFun(),
                      ),
                    ),
                    CustomElevatedButton(
                      showText: 'SEND OTP',
                      buttonAction: () {
                        _registerController.validateAfterClick = true;
                        if (_registerController.buttonClickedValidation()) {
                          Get.to(OtpPage());
                          _registerController.nameController.clear();
                          _registerController.phoneNoController.clear();
                          _registerController.passwordController.clear();
                          _registerController.retypePasswordController.clear();
                        } else {}
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
