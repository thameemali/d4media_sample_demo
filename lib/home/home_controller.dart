import 'package:chewie/chewie.dart';
import 'package:d4media_sample_demo_app/home/tabs/audio_tab.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:video_player/video_player.dart';

class HomeController extends GetxController {
  RxInt currentIndex = 0.obs;
  RxInt mainListIndex = 0.obs;
  RxInt subListIndex = 0.obs;

  RxBool videoListClicked = false.obs;
  RxBool fabClicked = false.obs;
  RxBool nothingClicked = true.obs;
  RxBool list1VideoClicked = false.obs;
  RxBool videoPlayerOn = false.obs;
  RxBool viewAllClicked = false.obs;
  RxBool appBarBackPressed=false.obs;

  var isListening = false.obs;
  var speechText = 'Tap the mic and speak...'.obs;

  final SpeechToText speechToText = SpeechToText();
  DateTime backPress = DateTime.now();

  VideoPlayerController videoPlayerController = VideoPlayerController.asset('');
  late Rx<ChewieController> chewieController;

  @override
  void onInit() {
    chewieController =
        ChewieController(videoPlayerController: videoPlayerController).obs;
    super.onInit();
  }

  @override
  void onReady() {}

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController.value.dispose();
    super.dispose();
  }

  List<String> videoList = [
    'assets/videos/costarica.mp4',
    'assets/videos/bikers.mp4',
    'assets/videos/horses.mp4',
    'assets/videos/whale.mp4',
    'assets/videos/lion.mp4',
  ];
  List<String> videoNamesList = [
    'Costa Rica',
    'Mountain Bikers',
    'Horses and Nature',
    'Baby and Beluga Whale',
    'White Lion and Baby',
  ];
  List<double> widthList = [250.0, 200.0, 300.0, 400.0];
  List<double> heightList = [400.0, 200.0, 100.0, 150.0];
  List<String> headingList = [
    '',
    'Animation Videos & Songs',
    'Shorts',
    'Anti CAA Speeches'
  ];
  List<List<String>> mainList = [
    [
      'assets/images/costarica thumbnail 1.png',
      'assets/images/bikers thumbnail.png',
      'assets/images/horses thumbnail.png',
      'assets/images/whale.png',
      'assets/images/lion.png',
    ],
    [
      'assets/images/list_images/main.jpg',
      'assets/images/list_images/steak.jpg',
      'assets/images/list_images/mandi.jpg',
      'assets/images/list_images/mushroom1.png',
      'assets/images/list_images/pizza1.png',
      'assets/images/list_images/noodles (1).jpg',
    ],
    [
      'assets/images/list_images/noodles.jpg',
      'assets/images/list_images/momos (1).jpg',
      'assets/images/list_images/chilli.jpg',
      'assets/images/list_images/shrimp1.png',
      'assets/images/list_images/main.jpg',
      'assets/images/list_images/steak.jpg',
    ],
    [
      'assets/images/list_images/chilli.jpg',
      'assets/images/list_images/shrimp1.png',
      'assets/images/list_images/main.jpg',
      'assets/images/list_images/steak.jpg',
    ]
  ];

  final tabs = [
    AudioTab(),
    const Center(
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
    print('video link : ${videoList[subListIndex.value]}');
    videoPlayerController =
        VideoPlayerController.asset(videoList[subListIndex.value]);
    await Future.wait([videoPlayerController.initialize()]);
    chewieController.value = ChewieController(
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

  void listenToRecord() async {
    if (!isListening.value) {
      bool available = await speechToText.initialize(
        onStatus: (val) {},
        onError: (val) {},
      );
      if (available) {
        isListening.value = true;
        speechToText.listen(
          onResult: (val) {
            speechText.value = val.recognizedWords;
          },
        );
      }
    } else {
      isListening.value = false;
      speechToText.stop();
      speechText.value = 'Tap the mic and speak...';
    }
  }

  Future<bool> onWillPop() async {
    final timegap = DateTime.now().difference(backPress);
    final cantExit = timegap >= const Duration(seconds: 2);
    backPress = DateTime.now();
    if (cantExit) {
      //show snackbar
      Get.snackbar('d4media', 'Press Back button again to Exit',
          duration: const Duration(seconds: 2),
          snackPosition: SnackPosition.BOTTOM);
      return false;
    } else {
      Get.clearRouteTree();
      return true;
    }
  }
}
