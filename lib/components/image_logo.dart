import 'package:flutter/material.dart';

class ImageLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.width * 0.6;
    return Container(
      child: Image.asset(
        Theme.of(context).brightness == Brightness.light
            ? 'assets/images/logo_white_bg.png'
            : 'assets/images/logo_white_bg_white_red_txt.png',
        height: height,
      ),
      padding: EdgeInsets.only(bottom: 0),
    );
  }
}
