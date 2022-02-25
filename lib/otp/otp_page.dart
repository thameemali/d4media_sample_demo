import 'package:d4media_sample_demo_app/custom_widgets/custom_elevated_button.dart';
import 'package:d4media_sample_demo_app/custom_widgets/custom_heading_text.dart';
import 'package:d4media_sample_demo_app/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:timer_button/timer_button.dart';

class OtpPage extends StatelessWidget {
  OtpPage({Key? key}) : super(key: key);
  String originalOTP = '1234';
  String enteredOTP = '';
  final _otpController = OtpFieldController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/d4_white_bg2.png'),
              fit: BoxFit.fill,
              opacity: 100,
            ),
          ),
          child: Stack(
            fit: StackFit.loose,
            children: [
              Row(
                children: [
                  Container(
                    width: 15,
                    height: 20,
                    margin: const EdgeInsets.only(top: 50),
                    decoration: const BoxDecoration(
                      color: Color(0xFF244384),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(5),
                        bottomRight: Radius.circular(5),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      top: 50.0,
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.keyboard_backspace_sharp,
                        color: Color(0xFF244384),
                        size: 30,
                      ),
                      onPressed: () {
                        Get.back();
                      },
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomHeadingText(headingText: 'Verification Code'),
                  const Padding(
                    padding: EdgeInsets.only(top: 10.0, bottom: 20.0),
                    child: Text(
                      'Enter Your OTP code',
                      style: TextStyle(
                        color: Colors.black45,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Container(
                    width: 300,
                    height: 100,
                    margin: const EdgeInsets.only(left: 50.0, right: 50.0),
                    child: OTPTextField(
                      controller: _otpController,
                      length: 4,
                      fieldWidth: 60,
                      style: const TextStyle(fontSize: 17),
                      textFieldAlignment: MainAxisAlignment.spaceAround,
                      fieldStyle: FieldStyle.box,
                      otpFieldStyle: OtpFieldStyle(
                        backgroundColor: const Color(0x60CADFF3),
                        focusBorderColor: const Color(0xFF244384),
                        borderColor: Colors.transparent,
                      ),
                      margin: const EdgeInsets.only(left: 10),
                      width: 10,
                      keyboardType: TextInputType.number,
                      onCompleted: (pin) {
                        enteredOTP = pin;
                      },
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    margin: const EdgeInsets.only(
                      right: 70.0,
                      bottom: 30.0,
                    ),
                    width: double.infinity,
                    child: TimerButton(
                      buttonType: ButtonType.FlatButton,
                      color: Colors.transparent,
                      disabledColor: Colors.transparent,
                      onPressed: () {
                        Fluttertoast.showToast(
                          msg: 'OTP has been Send to Your Mobile Number',
                          backgroundColor: const Color(0xFF244384),
                          textColor: Colors.white,
                          toastLength: Toast.LENGTH_SHORT,
                          fontSize: 16,
                          gravity: ToastGravity.CENTER,
                        );
                      },
                      timeOutInSeconds: 10,
                      label: 'Resend OTP',
                      activeTextStyle:
                          const TextStyle(color: Color(0xFF244384)),
                    ),
                  ),
                  CustomElevatedButton(
                    showText: 'VERIFY',
                    buttonAction: () {
                      if (enteredOTP == originalOTP) {
                        Get.offAll( HomePage());
                      } else {
                        Fluttertoast.showToast(
                          msg: 'Wrong OTP, Please Try Again ' + enteredOTP,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          toastLength: Toast.LENGTH_SHORT,
                          fontSize: 16,
                          gravity: ToastGravity.CENTER,
                        );
                      }
                    },
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
