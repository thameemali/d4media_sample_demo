import 'package:avatar_glow/avatar_glow.dart';
import 'package:d4media_sample_demo_app/home/tabs/home_tab.dart';
import 'package:d4media_sample_demo_app/home/widgets/custom_appbar.dart';
import 'package:d4media_sample_demo_app/home/widgets/custom_bottom_nav_bar.dart';
import 'package:d4media_sample_demo_app/home/widgets/custom_drawer.dart';
import 'package:d4media_sample_demo_app/home/widgets/custom_fab.dart';
import 'package:d4media_sample_demo_app/home/widgets/videoplayer_appbar.dart';
import 'package:d4media_sample_demo_app/home/widgets/view_all_widget.dart';
import 'package:d4media_sample_demo_app/video_player/video_player_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: homeController.onWillPop,
      child: Obx(
        () => Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(70),
            child: homeController.videoListClicked.value
                ? VideoPlayerAppBar(homeController: homeController)
                : const CustomAppBar(),
          ),
          drawer: CustomDrawer(),
          floatingActionButton: CustomFAB(
            onTap: () {
              homeController.viewAllClicked.value = false;
              homeController.nothingClicked.value = false;
              homeController.videoListClicked.value = false;
              homeController.fabClicked.value = true;

              homeController.chewieController.value.videoPlayerController
                  .pause();
            },
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: CustomBottomNavBar(
            homeController: homeController,
          ),
          body: Stack(
            fit: StackFit.loose,
            children: [
              Container(
                  margin:
                      const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                  child: Row(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                          color: Color(0xFFDFE4EC),
                        ),
                        width: MediaQuery.of(context).size.width - 100,
                        child: Obx(
                          () => TextField(
                            cursorColor: const Color(0xFF244384),
                            textInputAction: TextInputAction.done,
                            decoration: InputDecoration(
                              hintText: homeController.speechText.value,
                              hintStyle: const TextStyle(fontSize: 16),
                              prefixIcon: const Icon(
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
                      ),
                      Obx(
                        () => GestureDetector(
                          onTap: () {
                            homeController.listenToRecord();
                          },
                          child: Container(
                            margin: const EdgeInsets.only(left: 10.0),
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                              color: Color(0xFFDFE4EC),
                            ),
                            width: 40,
                            height: 50,
                            child: AvatarGlow(
                              animate: homeController.isListening.value,
                              glowColor: const Color(0xFF244384),
                              endRadius: 40,
                              repeat: true,
                              showTwoGlows: true,
                              curve: Curves.slowMiddle,
                              child: Icon(
                                homeController.isListening.value
                                    ? Icons.mic
                                    : Icons.mic_none,
                                color: const Color(0xFF244384),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
              Obx(
                () => Container(
                  margin: const EdgeInsets.only(
                    top: 80.0,
                  ),
                  child: homeController.nothingClicked.value
                      ? homeController.videoListClicked.value
                          ? homeController.appBarBackPressed.value
                              ? HomeTab(homeController: homeController)
                              : VideoPlayerPage(controller: homeController)
                          : homeController.viewAllClicked.value
                              ? ViewAllWidget(homeController: homeController)
                              : HomeTab(homeController: homeController)
                      : homeController.fabClicked.value
                          ? homeController.videoListClicked.value
                              ? homeController.appBarBackPressed.value
                      ? HomeTab(homeController: homeController)
                      : VideoPlayerPage(controller: homeController)
                              : homeController.viewAllClicked.value
                                  ? ViewAllWidget(
                                      homeController: homeController)
                                  : HomeTab(homeController: homeController)
                          : homeController
                              .tabs[homeController.currentIndex.value],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
