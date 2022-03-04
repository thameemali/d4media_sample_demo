import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AudioController extends GetxController{

  //Audio player items
  RxBool playing = false.obs;
  Rx<IconData> playButton = Icons.play_arrow.obs;
  late AudioPlayer _audioPlayer;
  late AudioCache _audioCache;
  Duration _position = new Duration();
  Duration _musicLength = new Duration();

  Widget sliderWidget() {
    return Slider.adaptive(
        value: _position.inMilliseconds.toDouble(),
        max: _musicLength.inMilliseconds.toDouble(),
        activeColor: Colors.deepOrange,
        inactiveColor: Colors.grey,
        onChanged: (value){
          seekToSec(value.toInt());
        });
  }
  void seekToSec(int sec) {
    Duration newPos=Duration(seconds: sec);
    _audioPlayer.seek(newPos);
  }
}