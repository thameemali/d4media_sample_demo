import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icon_badge/icon_badge.dart';

class AppBarActionLogo extends StatelessWidget {
  const AppBarActionLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Image(
        image: AssetImage('assets/icons/d4media.png'),
        width: 80,
        height: 80,
        fit: BoxFit.cover,
        filterQuality: FilterQuality.high,
      ),
    );
  }
}

class AppBarActionBell extends StatelessWidget {
  const AppBarActionBell({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  IconBadge(
      icon: const Icon(Icons.notifications_none,size: 30,),
      itemCount: 1,
      badgeColor: Colors.deepOrange,
      itemColor: Colors.deepOrange,
      hideZero: true,top: 7,
      right: 10,
      onTap: () {},
    );

  }
}

class AppBarActionFavorites extends StatelessWidget {
  const AppBarActionFavorites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Icon(Icons.favorite_border,size: 30,);

  }
}
