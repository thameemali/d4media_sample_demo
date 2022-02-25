import 'dart:async';

import 'package:d4media_sample_demo_app/home/home_controller.dart';
import 'package:d4media_sample_demo_app/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login/login_page.dart';

void main() {
 // Get.put(HomeController());
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
  bool flag=false;
  @override
  void initState() {
    Timer(const Duration(seconds: 5), () => flag?Get.off( HomePage()):Get.off(LoginPage()));
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
  Future<void> getSaved(BuildContext context) async {
    WidgetsFlutterBinding.ensureInitialized();
    final sharedPreferences = await SharedPreferences.getInstance();
    final savedUsername = sharedPreferences.getString('mobile');
    if (savedUsername != null) {
      flag = true;
    } else {
      flag = false;
    }
  }
}
