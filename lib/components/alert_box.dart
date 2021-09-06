import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';

enum AlertType {
  success,
  error,
  warning,
  info,
}

class AlertBox extends StatelessWidget {
  final String message;
  final AlertType alertType;

  AlertBox({
    Key key,
    this.alertType = AlertType.success,
    @required this.message,
  });

  @override
  Widget build(BuildContext context) {
    Color bgColor, fontColor, borderColor = Color(0xffc3e6cb);
    switch (alertType) {
      case AlertType.success:
        fontColor = Color(0xff155724);
        bgColor = Color(0xffd4edda);
        borderColor = Color(0xffc3e6cb);
        break;
      case AlertType.error:
        fontColor = Color(0xff721c24);
        bgColor = Color(0xfff8d7da);
        borderColor = Color(0xfff5c6cb);
        break;
      case AlertType.warning:
      // alert-warning{color:856404;background-color:fff3cd;border-color:ffeeba}
        fontColor = Color(0xff856404);
        bgColor = Color(0xfffff3cd);
        borderColor = Color(0xffffeeba);
        break;
      default:
      // alert-info{color:0c5460;background-color:d1ecf1;border-color:bee5eb}
        fontColor = Color(0xff0c5460);
        bgColor = Color(0xffd1ecf1);
        borderColor = Color(0xffbee5eb);
    }

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      child: Html(
        data: message,
        style: {
          "html": Style.fromTextStyle(
            TextStyle(
              fontSize: 15,
              color: fontColor,
              fontWeight: FontWeight.w100,
            ),
          ),
        },
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: borderColor,
          width: 1,
        ),
        color: bgColor,
//        boxShadow: [
//          BoxShadow(color: Colors.green, spreadRadius: 3),
//        ],
      ),
    );
  }
}
