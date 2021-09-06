import 'package:flutter/material.dart';
import 'package:Pegassus/utils/common/font.dart';

class CommonOutlineButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final bool isLoading;
  final Color color;
  final double width;
  final bool small;

  CommonOutlineButton({
    @required this.text,
    this.onPressed,
    this.isLoading = false,
    this.color,
    this.width,
    this.small = false,
  });

  @override
  Widget build(BuildContext context) {
    final btnLabel = text;
    final Color theColor = color ?? Theme.of(context).primaryColor;

    return Container(
      margin: EdgeInsets.only(top: small ? 0 : 10, bottom: small ? 5 : 15),
      width: width,
      child: FlatButton(
        onPressed: isLoading ? null : onPressed,
        textColor: theColor,
//        color: theColor,
        padding: EdgeInsets.symmetric(
            vertical: small ? 0 : 12, horizontal: small ? 10 : 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(small ? 10 : 25),
          side: BorderSide(
            color: isLoading ? Colors.grey : theColor,
          ),
        ),
        child: isLoading
            ? SizedBox(
                child: CircularProgressIndicator(
                  backgroundColor: theColor,
                ),
                height: 22,
                width: 22,
              )
            : Text(
                btnLabel,
                style: TextStyle(
                  color: theColor,
                  fontSize: small ? 14 : FONT_SIZE_H3,
                ),
              ),
      ),
    );
  }
}
