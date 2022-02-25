import 'package:d4media_sample_demo_app/home/home_controller.dart';
import 'package:d4media_sample_demo_app/video_player/video_player_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class HomeTabLists extends StatelessWidget {
  HomeTabLists({Key? key, required this.homeController}) : super(key: key);
  HomeController homeController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text(
                'View All',
                style: TextStyle(color: Color(0xFF244384)),
              ),
              Image.asset('assets/icons/navigate_next_black_-1.png')
            ],
          ),
        ),
        SizedBox(
          height: 270,
          child: ListView.builder(
            itemCount: homeController.list1.length,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Container(
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
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              const Expanded(
                flex: 5,
                child: Text(
                  'Animation Videos & Songs',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              const Text(
                'View All',
                style: TextStyle(color: Color(0xFF244384)),
              ),
              Image.asset('assets/icons/navigate_next_black_-1.png')
            ],
          ),
        ),
        const Divider(
          thickness: 8,
        ),
        SizedBox(
          height: 200,
          child: ListView.builder(
            itemCount: homeController.list2.length,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.only(left: 20.0, top: 20.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image(
                    image: AssetImage(
                      homeController.list2[index],
                    ),
                    width: 150,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 20.0, bottom: 8.0),
          child: Divider(
            thickness: 8,
          ),
        ),
        SizedBox(
          height: 120,
          child: ListView.builder(
            itemCount: homeController.list3.length,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.only(right: 10.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image(
                    image: AssetImage(
                      homeController.list3[index],
                    ),
                    width: 250,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 8.0, bottom: 10.0),
          child: Divider(
            thickness: 8,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Row(
            children: [
              const Expanded(
                flex: 5,
                child: Text(
                  'Anti CAA Speeches',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              const Text(
                'View All',
                style: TextStyle(color: Color(0xFF244384)),
              ),
              Image.asset('assets/icons/navigate_next_black_-1.png')
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 10.0, bottom: 20.0),
          child: Divider(
            thickness: 8,
          ),
        ),
        const Image(
          image: AssetImage('assets/images/himalaya (1).png'),
          width: double.infinity,
          height: 100,
          fit: BoxFit.cover,
        )
      ],
    );
  }
}
