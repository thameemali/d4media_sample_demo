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
                padding: const EdgeInsets.only(left: 20.0,right: 20.0),
                child: Row(
                  children: [
                     Expanded(flex:3,
                       child: Text(
                        homeController.headingList[index],
                        style: const TextStyle(
                          color: Color(0xFF244384),
                          fontSize: 18,fontWeight: FontWeight.bold
                        ),
                    ),
                     ),
                    GestureDetector(onTap: (){
                      homeController.viewAllClicked.value=true;
                      homeController.mainListIndex.value=index;
                    },
                      child: const Text(
                        'View All',
                        style: TextStyle(
                          color: Color(0xFF244384),
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Image.asset('assets/icons/navigate_next_black_24dp (1).png')
                  ],
                ),
              ),
              SizedBox(
                height:homeController.heightList[index],
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, i) => Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: GestureDetector(
                      onTap: () {
                        homeController.mainListIndex.value = index;
                        homeController.subListIndex.value = i;
                        print(i);
                        print(homeController.subListIndex);

                        if (index == 0) {
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
                            homeController.mainList[index][i],
                          ),
                          width: homeController.widthList[index],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  itemCount: homeController.mainList[index].length,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10.0,bottom: 10.0),
                child: Divider(thickness: 10,),
              ),
            ],
          );
        },
      ),
    );
  }
}
