import 'package:auth_test/misc/colors.dart';
import 'package:auth_test/widgets/app_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResponsiveButton extends StatelessWidget {

  bool isResponsive;
  double width;
  final Function onPressed;

  ResponsiveButton({Key key, 
    this.width=120, 
    this.isResponsive=false,
    this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: isResponsive==true? double.maxFinite:width,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.mainColor
        ),
        child: Row(
          mainAxisAlignment: isResponsive==true?MainAxisAlignment.spaceBetween: MainAxisAlignment.center,
          children: [
            isResponsive==true?Container(
              margin: const EdgeInsets.only(left:30,),
              child: AppText(text: "Book Trip Now", color:Colors.white,)
              ):Container(),
            Container(
              margin: const EdgeInsets.only(right:30),
              child: Image.asset("assets/arrow.png", width: 30, height: 30, color: Colors.white,)),
        ]),
      ),
    );
  }
}