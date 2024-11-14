import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UtilWidgets{
 static Widget buildBackgroundContainer({required Widget child}) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color.fromARGB(255, 116, 195, 234), Color.fromARGB(255, 255, 255, 255)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.4, 0.9],
          tileMode: TileMode.clamp,
        ),
      ),
      child: child,
    );
  }

  static AppBar buildAppBar({required String title,required IconData icon,required BuildContext context}) {
    return AppBar(
      leading: IconButton(
        onPressed: () {Navigator.of(context).pop();},
        icon: Icon(Icons.arrow_back),
      ),
      title: Text(title),
      backgroundColor: Color.fromARGB(255, 109, 190, 231),
      actions: <Widget>[
        IconButton(
          onPressed: () {},
          icon: Icon(icon),
        ),
      ],
    );
  }


}