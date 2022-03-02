import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'appbar_action_logo.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions:  [
        const AppBarActionLogo(),
        SizedBox(
          width: MediaQuery.of(context).size.width-250,
        ),
        const AppBarActionBell(),

        const AppBarActionFavorites(),
        const SizedBox(
          width: 20,
        ),
      ],
      backgroundColor: const Color(0xFF244384),
      elevation: 10,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
    );
  }
}
