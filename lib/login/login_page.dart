import 'package:d4media_sample_demo_app/custom_widgets/custom_elevated_button.dart';
import 'package:d4media_sample_demo_app/custom_widgets/custom_heading_text.dart';
import 'package:d4media_sample_demo_app/custom_widgets/custom_logo_image.dart';
import 'package:d4media_sample_demo_app/custom_widgets/custom_text_field.dart';
import 'package:d4media_sample_demo_app/home/home_page.dart';
import 'package:d4media_sample_demo_app/login/login_controller.dart';
import 'package:d4media_sample_demo_app/register/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final LoginController _loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
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
                    headingText: 'Login',
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
                        hintString: 'Enter Your Mobile Number',
                        keyboardType: TextInputType.number,
                        inputAction: TextInputAction.next,
                        inputFormat: [
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          LengthLimitingTextInputFormatter(10),
                        ],
                        controller: _loginController.mobileNoController,
                        errorMessage: _loginController.mobileError.value,
                        onTap: () {
                          _loginController.mobileError.value = '';
                        },
                        errorBorder: _loginController.mobileError.value == ''
                            ? _loginController.noErrorBorderFun()
                            : _loginController.errorBorderFun(),
                      ),
                    ),
                    Obx(
                      () => CustomTextField(
                        hintString: 'Password',
                        inputAction: TextInputAction.done,
                        inputFormat: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'[0-9a-zA-Z.,!@#$%^&*]')),
                        ],
                        controller: _loginController.passwordController,
                        errorMessage: _loginController.passwordError.value,
                        onTap: () {
                          _loginController.passwordError.value = '';
                        },
                        errorBorder: _loginController.passwordError.value == ''
                            ? _loginController.noErrorBorderFun()
                            : _loginController.errorBorderFun(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 20.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                bottom: 10.0,
                              ),
                              child: Text(
                                'Forgot Password',
                                style: TextStyle(
                                  color: Colors.blue[900],
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            onTap: () {
                              Get.bottomSheet(
                                Container(
                                  alignment: Alignment.center,
                                  child: const Text(
                                    'Change your Password',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                  height: 100,
                                  color: const Color(0x2879A4D9),
                                ),
                              );
                            },
                          )
                        ],
                      ),
                    ),
                    CustomElevatedButton(
                      showText: 'CONTINUE',
                      buttonAction: () async {
                        _loginController.validateAfterClick = true;
                        if (_loginController.buttonClickedValidation()) {
                          final sharedPreference =
                              await SharedPreferences.getInstance();
                          sharedPreference.setString('mobile',
                              _loginController.validMobile);

                          Get.off( HomePage());

                          _loginController.mobileNoController.clear();
                          _loginController.passwordController.clear();
                        } else {}
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Don\'t have an account ?',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(RegisterPage());
                          },
                          child: const Text(
                            'Sign up',
                            style: TextStyle(
                              fontSize: 16,
                              decoration: TextDecoration.underline,
                              color: Color(0xFF244384),
                            ),
                          ),
                        ),
                      ],
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
