import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../audio_controller.dart';

class AudioTab extends StatelessWidget {
  AudioTab({Key? key}) : super(key: key);

  final AudioController audioController = Get.put(AudioController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            topRight: Radius.elliptical(100, 20),
            topLeft: Radius.elliptical(100, 20)),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.black,
            Colors.blue.shade900,
          ],
        ),
      ),
      child: ListView(
        children: [
          Container(
            color: Colors.white30,
            padding: const EdgeInsets.only(top: 20.0),
            child: const Center(
              child: Text(
                'WOW PLAYER',
                style: TextStyle(
                  color: Colors.black45,
                  letterSpacing: 10,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ),
          Container(
            decoration:  const BoxDecoration(
              color: Colors.white30,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.elliptical(100, 20),
                  bottomLeft: Radius.elliptical(100, 20)),
            ),
            padding: const EdgeInsets.only(top: 10.0,bottom: 10.0),
            child: const Center(
              child: Text(
                'Enjoy the flawless music instantly...',
                style: TextStyle(
                  color: Colors.deepOrange,
                  fontSize: 16,
                  fontWeight: FontWeight.w200,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ),
          const Divider(
            thickness: 1,
            height: 20.0,
            color: Colors.white60,
            indent: 20.0,
            endIndent: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 20.0, right: 20.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: Image.asset(
                'assets/images/romance_song_thumbnail.jpg',
                fit: BoxFit.cover,
                width: 300,
                height: 160,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 20.0),
            height: 300,
            decoration: const BoxDecoration(
              color: Color(0x30F1B6C2),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 30.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.skip_previous,
                        size: 40,
                        color: Colors.white60,
                      ),
                      onPressed: () {},
                    ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    Obx(
                      () => IconButton(
                        icon: Icon(
                          audioController.playButton.value,
                          size: 45,
                          color: Colors.white60,
                        ),
                        onPressed: () {
                          if (!audioController.playing.value) {
                            audioController.playButton.value = Icons.pause;
                            audioController.playing.value = true;
                          } else {
                            audioController.playButton.value = Icons.play_arrow;
                            audioController.playing.value = false;
                          }
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.skip_next,
                        size: 40,
                        color: Colors.white60,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
                audioController.sliderWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
