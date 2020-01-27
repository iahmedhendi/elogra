import 'package:flutter/material.dart';

class OgraButton extends StatelessWidget {
  final String title;
  final Function onTap;
  final double width;

  OgraButton(this.title,this.onTap,this.width);

  @override
  Widget build(BuildContext context) {
 
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(30.0),
        child: Container(
          width: width,
          height: 42,
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.0,
                fontFamily: "Sukar",
              ),
            ),
          ),
        ),
      ),
    );
  }
}
