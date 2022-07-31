import 'package:flutter/material.dart';

class CommonStyle {
  static final Color blueColor = Color(0xFF3298D8);
  static final Color denimColor = Color(0xFF5F82CF);
  static final Color violetColor = Color(0xFF8369B9);
  static final Color greenColor = Color(0xFF29C195);
  static final Color redColor = Color(0xFFD91A1A);


  static BoxShadow shadow(BuildContext context) => BoxShadow(
    color: Theme.of(context).shadowColor,
    spreadRadius: 1,
    blurRadius: 6,
    offset: Offset(0, 3), // changes position of shadow
  );
}
