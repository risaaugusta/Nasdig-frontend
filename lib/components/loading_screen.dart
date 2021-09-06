import 'package:flutter/material.dart';
import 'package:Pegassus/components/image_logo.dart';

class LoadingScreen extends StatelessWidget {
  final String loadingText;
  final bool logo;
  final EdgeInsets padding;

  LoadingScreen({
    this.loadingText,
    this.logo,
    this.padding = const EdgeInsets.all(0),
  });

  @override
  Widget build(BuildContext context) {
    bool withImg = logo != null ? logo : false;
    return Center(
      child: Padding(
        padding: padding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            withImg ? ImageLogo() : Container(),
            CircularProgressIndicator(
              valueColor: Theme.of(context).brightness == Brightness.light
                  ? null
                  : AlwaysStoppedAnimation<Color>(
                      Theme.of(context).secondaryHeaderColor),
            ),
            loadingText != null
                ? Padding(
                    padding: EdgeInsets.all(30),
                    child: Text(
                      loadingText,
                      style: TextStyle(
                        color: Theme.of(context).secondaryHeaderColor,
                        fontSize: 17,
                      ),
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
