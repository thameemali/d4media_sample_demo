import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class HomeController extends GetxController {
  RxBool fabClicked = false.obs;
  RxInt currentIndex = 0.obs;
  RxBool nothingClicked = true.obs;
  RxBool list1VideoClicked = false.obs;
  RxBool videoPlayerOn = false.obs;

  late VideoPlayerController videoPlayerController;
  ChewieController? chewieController;

  @override
  void onInit() {
    initializePlayer();
    super.onInit();
  }

  @override
  void onReady() {}

  @override
  void onClose() {
    videoPlayerController.dispose();
    chewieController!.dispose();
  }

  late List<String> list1 = [
    'assets/images/costarica thumbnail 1.png',
    'assets/images/list_images/biriyani.jpg',
    'assets/images/list_images/chilli.jpg',
    'assets/images/list_images/friedrice.jpg',
    'assets/images/list_images/main.jpg',
  ];
  late List<String> list2 = [
    'assets/images/list_images/main.jpg',
    'assets/images/list_images/steak.jpg',
    'assets/images/list_images/mandi.jpg',
    'assets/images/list_images/mushroom1.png',
    'assets/images/list_images/pizza1.png',
    'assets/images/list_images/noodles (1).jpg',
  ];
  late List<String> list3 = [
    'assets/images/list_images/noodles.jpg',
    'assets/images/list_images/momos (1).jpg',
    'assets/images/list_images/chilli.jpg',
    'assets/images/list_images/shrimp1.png',
    'assets/images/list_images/main.jpg',
    'assets/images/list_images/steak.jpg',
  ];
  late List<String> list4 = [
    'images/list_images/salad.jpg',
    'images/list_images/shrimp.jpg',
    'images/list_images/mandi.jpg',
    'images/list_images/mushroom1.png',
    'images/list_images/soups (1).jpg',
    'images/list_images/noodles (1).jpg',
  ];
  late List<String> list5 = [
    'images/list_images/mushroom (1).jpg',
    'images/list_images/biriyani.jpg',
    'images/list_images/pizza.jpg',
    'images/list_images/friedrice.jpg',
    'images/list_images/soups3.png',
  ];
  late List<String> list6 = [
    'images/list_images/chilli1.png',
    'images/list_images/biriyani (1).jpg',
    'images/list_images/mandi.jpg',
    'images/list_images/friedrice (1).jpg',
    'images/list_images/pizza1.png',
    'images/list_images/hotel1 (1).jpg',
  ];
  late List<String> list7 = [
    'images/list_images/momos (1).jpg',
    'images/list_images/drinks.jpg',
    'images/list_images/mandi.jpg',
    'images/list_images/mushroom1.png',
    'images/list_images/main.jpg',
    'images/list_images/noodles (1).jpg',
  ];

  final tabs = [
    const Center(
      child: Text(
        'Audio',
        style: TextStyle(
            fontSize: 30, color: Colors.orange, fontWeight: FontWeight.bold),
      ),
    ),const Center(
      child: Text(
        'Videos',
        style: TextStyle(
            fontSize: 30, color: Colors.orange, fontWeight: FontWeight.bold),
      ),
    ),
    const Center(
      child: Text(
        'Document',
        style: TextStyle(
            fontSize: 30, color: Colors.orange, fontWeight: FontWeight.bold),
      ),
    ),
    const Center(
      child: Text(
        'Poster',
        style: TextStyle(
            fontSize: 30, color: Colors.orange, fontWeight: FontWeight.bold),
      ),
    ),
  ];

  Future<void> initializePlayer() async {
    videoPlayerController =
        VideoPlayerController.asset('assets/videos/costarica.mp4');
    await Future.wait([videoPlayerController.initialize()]);
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      autoPlay: true,
      looping: true,
      aspectRatio: videoPlayerController.value.aspectRatio,
      materialProgressColors: ChewieProgressColors(
        playedColor: const Color(0xFF244384),
        handleColor: Colors.black45,
        backgroundColor: Colors.orangeAccent,
        bufferedColor: Colors.green,
      ),
      placeholder: Container(),
      autoInitialize: true,
    );
    update();
  }
}
