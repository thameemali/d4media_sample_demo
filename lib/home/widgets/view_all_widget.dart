import 'package:d4media_sample_demo_app/home/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ViewAllWidget extends StatelessWidget {
  ViewAllWidget({Key? key, required this.homeController}) : super(key: key);
  HomeController homeController;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: double.infinity,
        width: 350,
        child: ListView.builder(
          itemBuilder: (context, i) => Padding(
            padding: const EdgeInsets.only(left: 10.0,right: 10.0,bottom: 20.0,top: 10.0),
            child: GestureDetector(
              onTap: () {
                homeController.subListIndex.value = i;
                print(i);
                print(homeController.subListIndex);

                if (homeController.mainListIndex.value == 0) {
                  homeController.videoListClicked.value = true;
                  homeController.initializePlayer();
                  Fluttertoast.showToast(
                      msg: 'Video is about to play',
                      toastLength: Toast.LENGTH_SHORT);
                } else {
                  homeController.videoListClicked.value = false;
                  Fluttertoast.showToast(
                      msg: 'Opening Image',
                      toastLength: Toast.LENGTH_SHORT);
                }
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image(
                  image: AssetImage(
                    homeController.mainList[homeController.mainListIndex.value]
                        [i],
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          itemCount: homeController.mainList[homeController.mainListIndex.value].length,
        ),
      ),
    );
  }
}
