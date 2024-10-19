import 'package:flutter/material.dart';
import 'package:flutter_project/Pages/register.dart';
import 'package:flutter_project/Pages/welcome.dart';
import 'Pages/login.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'welcome',
    routes: {
      'register': (context) => MyRegister(),
      'login': (context) => MyLogin(),
      'welcome': (context) => MyWelcome(),
    },
  )); //MaterailApp
}
