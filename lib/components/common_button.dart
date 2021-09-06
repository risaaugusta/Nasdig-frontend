import 'package:flutter/material.dart';
import 'package:Pegassus/utils/common/font.dart';
import 'package:Pegassus/utils/common/color.dart';

class CommonButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final bool isLoading;
  final Color color;
  final double width;

  CommonButton({
    @required this.text,
    this.onPressed,
    this.isLoading = false,
    this.color,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    final btnLabel = text;
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 15),
      width: width,
      child: RaisedButton(
        onPressed: isLoading ? null : onPressed,
        textColor: Colors.white,
        color: color ?? nasdemBlue,
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
          side: BorderSide(
            color: isLoading ? Colors.grey : (color ?? nasdemBlue),
          ),
        ),
        child: isLoading
            ? SizedBox(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                ),
                height: 22,
                width: 22,
              )
            : Text(
                btnLabel,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: FONT_SIZE_H3,
                ),
              ),
      ),
    );
  }
}
