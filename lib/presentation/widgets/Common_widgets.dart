import 'package:flutter/material.dart';


class Common_widgets {

  static Widget custom_icon(IconData symbol,
      {Color color = Colors.white, double size = 28}) {
    return Icon(
        symbol,
        color: color,
        size: size
    );
  }

  static Color light_blue = Colors.lightBlueAccent;

  static Widget text(String title, double size,{Color color = Colors.white,bool flag=false,FontWeight fontweight= FontWeight.normal}) {
    return Text(title,
      softWrap: flag,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: fontweight,
      ),
    );
  }
}