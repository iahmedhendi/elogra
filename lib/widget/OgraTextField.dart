import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OgraTextField extends StatelessWidget {

  final String hint;
  final TextEditingController controller;
  final double width;

  OgraTextField(this.hint,this.controller,this.width);

  @override
  Widget build(BuildContext context) {

           var halfOfScreen = MediaQuery.of(context).size.width / 2 - 40;

    return Container(
        height: 42,
        padding: EdgeInsets.only(right: 10, left: 10),
        width: halfOfScreen,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: Color(0xffF9F7FE),
          border: Border.all(
            color: Color(0xffECE6FF),
            width: 1, //                   <--- border width here
          ),
        ),
        child: TextField(
          controller: controller,
          style: TextStyle(
            fontFamily: "Sukar",
            fontSize: 14,
          ),
          textAlign: TextAlign.end,
          decoration: InputDecoration(
              hintStyle: TextStyle(
                fontFamily: "Sukar",
                fontSize: 14,
                color: Color(0xffCEC4FA),
              ),
              border: InputBorder.none,
              hintText: hint),
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            WhitelistingTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(3),
          ],
        ));
  }
}
