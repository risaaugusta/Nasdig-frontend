import 'package:flutter/material.dart';
import 'package:Pegassus/components/title_message_view.dart';

class ViewNotLoggedIn extends StatelessWidget {
//  final GlobalKey<ScaffoldState> scaffoldKey;
  final VoidCallback textActionOnTap;
//  final String appBarTitle;
  final String title;
  final String message;
  final String textAction;
  final String image;
  final bool textActionButtonStyle;

  ViewNotLoggedIn({
    Key key,
//    this.scaffoldKey,
    this.title = '',
//    this.appBarTitle = '',
    @required this.message,
    this.textActionOnTap,
    this.textAction = '',
    this.image,
    this.textActionButtonStyle = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      children: <Widget>[
        TitleMessageView(
          image: image,
          title: title,
          message: message,
          textAction: textAction,
          textActionOnTap: textActionOnTap,
          textActionButtonStyle: textActionButtonStyle,
        )
      ],
    );
  }
}
