import 'package:d4media_sample_demo_app/register/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final RegisterController _registerController = Get.put(RegisterController());

class PasswordErrorMessage extends StatelessWidget {
  const PasswordErrorMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(padding: EdgeInsets.only(bottom: 7.0),
        child:
            _registerController.passFormatNeeded.value=='hello' ? ErrorWidget() : null,
      ),
    );
  }
}

Widget ErrorWidget() {
  return Padding(
    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
    child: Text(
      _registerController.passwordFormat,
      style: const TextStyle(
          color: Colors.green, fontWeight: FontWeight.bold, fontSize: 14),
    ),
  );
}
