import 'package:d4media_sample_demo_app/home/home_controller.dart';
import 'package:d4media_sample_demo_app/home/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VideoPlayerAppBar extends StatelessWidget {
  VideoPlayerAppBar({Key? key,required this.homeController}) : super(key: key);
  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFF244384),
      leading: GestureDetector(
        child: const Icon(Icons.keyboard_backspace_sharp),
        onTap: () {
          Get.offAll(HomePage());
          homeController.chewieController.value.videoPlayerController.pause();
        },
      ),
      title: Text(
        homeController.videoNamesList[homeController.subListIndex.value],
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
      centerTitle: true,
    );
  }
}
