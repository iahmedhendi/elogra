import 'package:flutter/material.dart';

class OgraText extends StatelessWidget {

  final String title;
  
  OgraText(this.title);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.end,
      style: TextStyle(
          fontFamily: "Sukar", fontSize: 20, fontWeight: FontWeight.bold),
    );
  }
}
