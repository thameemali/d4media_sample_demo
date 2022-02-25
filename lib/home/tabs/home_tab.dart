import 'package:d4media_sample_demo_app/home/home_controller.dart';
import 'package:d4media_sample_demo_app/home/widgets/home_tab_lists.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomeTab extends StatelessWidget {
  HomeTab({Key? key, required this.homeController}) : super(key: key);

  HomeController homeController;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: homeController.currentIndex.value,
      child: SizedBox(
        width: double.infinity,
        child: Scaffold(
          body: ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: [
              TabBar(
                isScrollable: true,
                indicator: const UnderlineTabIndicator(
                    borderSide: BorderSide(
                        style: BorderStyle.solid,
                        width: 3,
                        color: Colors.orange),
                    insets: EdgeInsets.only(left: 20, right: 50)),
                tabs: [
                  SizedBox(
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.upload_file_outlined,
                          size: 20,
                          color: Colors.orange[700],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 7.0),
                          child: Text(
                            'Popular Uploads',
                            style: TextStyle(
                              color: Colors.orange[700],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.book_outlined,
                          size: 20,
                          color: Colors.orange[700],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 7.0),
                          child: Text(
                            'Library',
                            style: TextStyle(color: Colors.orange[700]),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.library_music_outlined,
                          size: 20,
                          color: Colors.orange[700],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 7.0),
                          child: Text(
                            'Songs',
                            style: TextStyle(color: Colors.orange[700]),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              HomeTabLists(
                homeController: homeController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
