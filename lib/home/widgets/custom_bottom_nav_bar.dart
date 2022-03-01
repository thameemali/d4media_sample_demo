import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home_controller.dart';

class CustomBottomNavBar extends StatelessWidget {
  CustomBottomNavBar({Key? key, required this.homeController})
      : super(key: key);

  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    return Obx(() =>
        AnimatedBottomNavigationBar(
          onTap: (index) {
            print(index);
            if(index==1){
              homeController.videoPlayerOn.value=true;
            }
            else{
              homeController.videoPlayerOn.value=false;
            }
            homeController.nothingClicked.value=false;
            homeController.fabClicked.value = false;
            homeController.currentIndex.value = index;
            homeController.chewieController.value.videoPlayerController.pause();
          },
          activeIndex: homeController.currentIndex.value,
          height: 80,
          activeColor: const Color(0xFF244384),
          backgroundColor: Colors.white,
          elevation: 20,
          notchMargin: 6,
          notchSmoothness: NotchSmoothness.sharpEdge,
          icons: const [
            Icons.volume_up_outlined,
            Icons.videocam_outlined,
            Icons.assignment_outlined,
            Icons.web_asset_sharp
          ],
          gapLocation: GapLocation.center,
          gapWidth: 80,
          leftCornerRadius: 30,
          rightCornerRadius: 30,
        ),
    );
  }
}
