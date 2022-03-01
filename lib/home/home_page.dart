import 'package:d4media_sample_demo_app/home/tabs/home_tab.dart';
import 'package:d4media_sample_demo_app/home/widgets/custom_appbar.dart';
import 'package:d4media_sample_demo_app/home/widgets/custom_bottom_nav_bar.dart';
import 'package:d4media_sample_demo_app/home/widgets/custom_drawer.dart';
import 'package:d4media_sample_demo_app/home/widgets/custom_fab.dart';
import 'package:d4media_sample_demo_app/video_player/video_player_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final HomeController _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: CustomAppBar(),
      ),
      drawer: const CustomDrawer(),
      floatingActionButton: CustomFAB(
        onTap: () {
          _homeController.nothingClicked.value = false;
          _homeController.videoListClicked.value = false;
          _homeController.fabClicked.value = true;
          _homeController.chewieController.value.videoPlayerController.pause();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CustomBottomNavBar(
        homeController: _homeController,
      ),
      body: Stack(
        fit: StackFit.loose,
        children: [
          Container(
              margin: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
              child: Row(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                      color: Color(0xFFDFE4EC),
                    ),
                    width: MediaQuery.of(context).size.width - 90,
                    child: const TextField(
                      cursorColor: Color(0xFF244384),
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          color: Color(0xFF244384),
                        ),
                        disabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        focusedErrorBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10.0),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                      color: Color(0xFFDFE4EC),
                    ),
                    width: 40,
                    height: 50,
                    child: const Icon(
                      Icons.mic,
                      color: Color(0xFF244384),
                    ),
                  ),
                ],
              )),
          Obx(
            () => Container(
              margin: const EdgeInsets.only(
                top: 80.0,
              ),
              child: _homeController.nothingClicked.value
                  ? _homeController.videoListClicked.value
                      ?  VideoPlayerPage(controller: _homeController,)
                      : HomeTab(homeController: _homeController)
                  : _homeController.fabClicked.value
                      ? _homeController.videoListClicked.value
                          ?  VideoPlayerPage(controller: _homeController,)
                          : HomeTab(homeController: _homeController)
                      : _homeController
                          .tabs[_homeController.currentIndex.value],
            ),
          ),
        ],
      ),
    );
  }
}
