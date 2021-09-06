import 'package:flutter/material.dart';

class LinkButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final Color color;

  LinkButton({@required this.text, this.onTap, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      child: GestureDetector(
        onTap: onTap,
        child: Text(
          text,
          style: TextStyle(
              fontSize: 16,
              decoration: TextDecoration.underline,
              color: color != null ? color : null),
        ),
      ),
    );
  }
}
