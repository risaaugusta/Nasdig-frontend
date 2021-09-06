import 'package:flutter/material.dart';
import 'package:Pegassus/components/common_button.dart';

class TitleMessageView extends StatelessWidget {
  final String title;
  final String message;
  final String textAction;
  final VoidCallback textActionOnTap;
  final String image;
  final double imageWidth;
  final bool textActionButtonStyle;
  final bool loading;

  TitleMessageView({
    this.title = '',
    @required this.message,
    this.textAction = '',
    this.textActionOnTap,
    this.image = '',
    this.imageWidth = 200,
    this.textActionButtonStyle = false,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            image.isNotEmpty
                ? Image.asset(
                    image,
                    width: imageWidth,
                    fit: BoxFit.fill,
                  )
                : Container(),
            title.isNotEmpty
                ? Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff4C6D87),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )
                : Container(),
            SizedBox(
              height: 25,
            ),
            Text(
              message,
              style: TextStyle(
                fontSize: 18,
                color: Color(0xffA4A5A6),
              ),
              textAlign: TextAlign.center,
            ),
            textAction.isNotEmpty
                ? SizedBox(
                    height: 40,
                  )
                : Container(),
            textAction.isNotEmpty && !textActionButtonStyle
                ? GestureDetector(
                    onTap: textActionOnTap != null ? textActionOnTap : null,
                    child: Text(
                      textAction,
                      style: TextStyle(
                        fontSize: 15,
                        decoration: TextDecoration.underline,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )
                : Container(),
            textAction.isNotEmpty && textActionButtonStyle
                ? CommonButton(
                    text: textAction,
                    onPressed: textActionOnTap != null ? textActionOnTap : null,
                    isLoading: loading,
                  )
                : Container(),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
