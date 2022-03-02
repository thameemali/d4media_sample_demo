import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      isScrollable: true,
      indicator: const UnderlineTabIndicator(
          borderSide: BorderSide(
              style: BorderStyle.solid, width: 3, color: Colors.orange),
          insets: EdgeInsets.only(left: 20, right: 50)),
      labelColor: Colors.orange[700],
      unselectedLabelColor: Colors.black45,
      tabs: [
        SizedBox(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Icon(
                Icons.upload_file_outlined,
                size: 20,
              ),
              Padding(
                padding: EdgeInsets.only(left: 7.0),
                child: Text(
                  'Popular Uploads',
                  style: TextStyle(),
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
            children: const [
              Icon(
                Icons.book_outlined,
                size: 20,
              ),
              Padding(
                padding: EdgeInsets.only(left: 7.0),
                child: Text(
                  'Library',
                  style: TextStyle(),
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
            children: const [
              Icon(
                Icons.library_music_outlined,
                size: 20,
              ),
              Padding(
                padding: EdgeInsets.only(left: 7.0),
                child: Text(
                  'Songs',
                  style: TextStyle(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
