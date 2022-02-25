import 'package:d4media_sample_demo_app/home/home_controller.dart';
import 'package:d4media_sample_demo_app/home/tabs/home_tab.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomFAB extends StatelessWidget {
   CustomFAB({Key? key,required this.onTap}) : super(key: key);
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      child: FloatingActionButton(
        backgroundColor: const Color(0xFF244384),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Icon(
              Icons.home,
              size: 25,
            ),
            Text(
              'Home',
              style: TextStyle(fontSize: 10),
            ),
          ],
        ),
        onPressed:onTap,
      ),
    );
  }
}
