import 'package:auth_test/widgets/app_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../misc/colors.dart';

class AppButtons extends StatelessWidget {

  final Color color;
  String text;
  IconData icon;
  final Color backGroundColor;
  double size;
  final Color borderColor;
  bool isIcon;

  AppButtons({Key key, 
  this.text="Hi",
  this.icon,
  this.isIcon=false,
  @required this.color, 
  @required this.backGroundColor, 
  @required this.size,
  @required this.borderColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor,
          width: 1.0
        ),
        borderRadius: BorderRadius.circular(15),
        color: backGroundColor
      ),
      child: isIcon==false?Center(child: AppText(text: text, color:color,)):Center(child: Icon(icon, color:color)),
    );
  }
}