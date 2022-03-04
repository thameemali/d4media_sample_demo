import 'dart:async';

import 'package:d4media_sample_demo_app/home/home_page.dart';
import 'package:d4media_sample_demo_app/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'login/login_page.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: const Color(0xFF244384),
      ),
      home: const D4Splash(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class D4Splash extends StatefulWidget {
  const D4Splash({Key? key}) : super(key: key);

  @override
  _D4SplashState createState() => _D4SplashState();
}

class _D4SplashState extends State<D4Splash>
    with SingleTickerProviderStateMixin {
  late LoginController loginController;

  @override
  void initState() {
    loginController = Get.put(LoginController());
    loginController.userData.writeIfNull('isLogged', false);
    Future.delayed(const Duration(seconds: 3), () async {
      checkIfLogged();
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Image(
          image: AssetImage('assets/images/splash.png'),
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  void checkIfLogged() {
    loginController.userData.read('isLogged')
        ? Get.to(HomePage())
        : Get.to(LoginPage());
  }
}
