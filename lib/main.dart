import 'package:flutter/material.dart';
import 'package:flutter_project/Pages/home.dart';
import 'package:flutter_project/Pages/register.dart';
import 'package:flutter_project/Pages/welcome.dart';
import 'package:flutter_project/Util/backButton.dart';
import 'Pages/login.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'home',
    routes: {
      'home':(context) => MyHome(),
      'register': (context) => MyRegister(),
      'login': (context) => MyLogin(),
      'welcome': (context) => MyWelcome(),
    },
  )); //MaterailApp
}
