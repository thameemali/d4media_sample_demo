import 'package:chewie/chewie.dart';
import 'package:d4media_sample_demo_app/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VideoPlayerPage extends StatelessWidget {
  const VideoPlayerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(margin: const EdgeInsets.only(left: 20.0,right: 20.0),
        height: 500,
        width: double.infinity,
        decoration: BoxDecoration(color: const Color(0x659E9EA1),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          children: [
            GetBuilder<HomeController>(
              init: HomeController(),
              builder: (controller) => Expanded(
                child: Center(
                  child: controller.chewieController != null &&
                          controller.chewieController!.videoPlayerController
                              .value.isInitialized
                      ? Chewie(controller: controller.chewieController!)
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            CircularProgressIndicator(),
                            SizedBox(
                              height: 10,
                            ),
                            Text('Loading...'),
                          ],
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
