import 'package:d4media_sample_demo_app/home/home_controller.dart';
import 'package:d4media_sample_demo_app/home/widgets/custom_tab_bar.dart';
import 'package:d4media_sample_demo_app/home/widgets/home_tab_lists.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  HomeTab({Key? key, required this.homeController}) : super(key: key);

  HomeController homeController;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: homeController.currentIndex.value,
      child: Scaffold(
        body: Column(
          children: [
            const CustomTabBar(),
            HomeTabLists(
              homeController: homeController,
            ),
          ],
        ),
      ),
    );
  }
}
