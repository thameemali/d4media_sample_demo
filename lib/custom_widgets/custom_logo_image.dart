import 'package:flutter/cupertino.dart';

class CustomLogoImage extends StatelessWidget {
  CustomLogoImage({Key? key, required this.imagePath}) : super(key: key);
  String imagePath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0, left: 10.0),
      child: Image(
        image: AssetImage(imagePath),
        width: 70,
        height: 70,
      ),
    );
  }
}
