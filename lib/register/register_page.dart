import 'package:d4media_sample_demo_app/custom_widgets/custom_elevated_button.dart';
import 'package:d4media_sample_demo_app/custom_widgets/custom_heading_text.dart';
import 'package:d4media_sample_demo_app/custom_widgets/custom_logo_image.dart';
import 'package:d4media_sample_demo_app/custom_widgets/custom_text_field.dart';
import 'package:d4media_sample_demo_app/login/login_controller.dart';
import 'package:d4media_sample_demo_app/register/password_error_message.dart';
import 'package:d4media_sample_demo_app/register/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);

  final RegisterController registerController = Get.put(RegisterController());
  final LoginController _loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    _loginController.customProgressbarFunction(context);
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
                        errorMessage: registerController.nameError.value,
                        hintString: 'Name',
                        inputAction: TextInputAction.next,
                        inputFormat: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'[a-zA-Z]')),
                        ],
                        controller: registerController.nameController,
                        onTap: () {
                          registerController.nameError.value = '';
                        },
                        errorBorder: registerController.nameError.value == ''
                            ? _loginController.noErrorBorderFun()
                            : _loginController.errorBorderFun(),
                      ),
                    ),
                    Obx(
                      () => CustomTextField(
                        errorMessage: registerController.phoneError.value,
                        hintString: 'Phone Number',
                        keyboardType: TextInputType.number,
                        inputAction: TextInputAction.next,
                        inputFormat: [
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          LengthLimitingTextInputFormatter(10),
                        ],
                        controller: registerController.phoneNoController,
                        onTap: () {
                          registerController.phoneError.value = '';
                        },
                        errorBorder: registerController.phoneError.value == ''
                            ? _loginController.noErrorBorderFun()
                            : _loginController.errorBorderFun(),
                      ),
                    ),
                    Obx(
                          () => CustomTextField(
                        errorMessage: registerController.emailError.value,
                        hintString: 'Email ID',
                        keyboardType: TextInputType.emailAddress,
                        inputAction: TextInputAction.next,
                        inputFormat: [
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9a-z.@]')),
                        ],
                        controller: registerController.emailController,
                        onTap: () {
                          registerController.emailError.value = '';
                        },
                        errorBorder: registerController.emailError.value == ''
                            ? _loginController.noErrorBorderFun()
                            : _loginController.errorBorderFun(),
                      ),
                    ),
                    Obx(
                      () => CustomTextField(
                        errorMessage: registerController.passwordError.value,
                        hintString: 'Enter Your Password',
                        inputAction: TextInputAction.next,
                        inputFormat: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'[0-9a-zA-Z.,!@#$%^&*]')),
                        ],
                        controller: registerController.passwordController,
                        onTap: () {
                          registerController.passwordError.value = '';
                        },
                        errorBorder: registerController.passwordError.value ==
                                ''
                            ? registerController.passFormatNeeded.value == ''
                                ? _loginController.noErrorBorderFun()
                                : _loginController.errorBorderFun()
                            : _loginController.errorBorderFun(),
                      ),
                    ),
                    const PasswordErrorMessage(),
                    Obx(
                      () => CustomTextField(
                        hintString: 'Confirm Password',
                        inputAction: TextInputAction.done,
                        inputFormat: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'[0-9a-zA-Z.,!@#$%^&*]')),
                        ],
                        controller:
                            registerController.retypePasswordController,
                        errorMessage:
                            registerController.passFormatNeeded.value == ''
                                ? registerController.retypePasswordError.value
                                : '',
                        onTap: () {
                          registerController.retypePasswordError.value = '';
                        },
                        errorBorder:
                            registerController.retypePasswordError.value == ''
                                ? _loginController.noErrorBorderFun()
                                : _loginController.errorBorderFun(),
                      ),
                    ),
                    CustomElevatedButton(
                      showText: 'SEND OTP',
                      buttonAction: () {
                        registerController.validateAfterClick = true;
                        if (registerController.buttonClickedValidation()) {

                          registerController.nameController.clear();
                          registerController.phoneNoController.clear();
                          registerController.emailController.clear();
                          registerController.passwordController.clear();
                          registerController.retypePasswordController.clear();
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
