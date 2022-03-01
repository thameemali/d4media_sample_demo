import 'package:d4media_sample_demo_app/home/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomeTabLists extends StatelessWidget {
  HomeTabLists({Key? key, required this.homeController}) : super(key: key);
  HomeController homeController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: homeController.mainList.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      'View All',
                      style: TextStyle(
                          color: Color(0xFF244384),
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    Image.asset('assets/icons/navigate_next_black_24dp (1).png')
                  ],
                ),
              ),
              SizedBox(
                height: 250,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, i) => Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: GestureDetector(onTap: (){
                      homeController.mainListIndex.value=index;
                      homeController.subListIndex.value=i;
                      print(i);
                      print(homeController.subListIndex);

                      if(index==0){
                        homeController.videoListClicked.value=true;
                        homeController.initializePlayer();
                        Fluttertoast.showToast(
                            msg: 'Video is about to play',
                            toastLength: Toast.LENGTH_SHORT);
                      }
                      else{
                        homeController.videoListClicked.value=false;
                        Fluttertoast.showToast(
                            msg: 'Opening Image',
                            toastLength: Toast.LENGTH_SHORT);

                      }
                    },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image(
                          image: AssetImage(
                            homeController.mainList[index][i],
                          ),
                          width: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  itemCount: homeController.mainList[index].length,
                ),
              ),
            ],
          );

          /*Container(
            padding: const EdgeInsets.only(left: 20.0, top: 20.0),
            child: GestureDetector(
              onTap: () {
                if (index == 0) {
                  Fluttertoast.showToast(
                      msg: 'Video is about to play',
                      toastLength: Toast.LENGTH_SHORT);
                  homeController.list1VideoClicked.value=true;

                }
                else{
                  Fluttertoast.showToast(
                      msg: 'Clicked on Image',
                      toastLength: Toast.LENGTH_SHORT);
                  homeController.list1VideoClicked.value=false;
                }
                print(homeController.list1VideoClicked.value);
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image(
                  image: AssetImage(
                    homeController.list1[index],
                  ),
                  width: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );*/
        },
      ),
    );
  }
}
