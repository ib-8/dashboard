import 'package:flutter/material.dart';
import 'package:myflutterdashboard/calc/constants.dart';

Widget newAppbar(
    {BuildContext context,
    Color barColor = black,
    Color itemColor = white,
    String title,
    int mode,
    onpressed}) {
  return AppBar(
    title: Text(
      title,
      style: TextStyle(color: itemColor),
    ),
    backgroundColor: barColor,
    elevation: 0,
    actions: <Widget>[
      InkWell(
        hoverColor: Colors.transparent,
        child: Icon(
          Icons.lightbulb_outline,
          size: 30,
          color: itemColor,
        ),
        onTap: onpressed,
      ),
    ],
  );
}
