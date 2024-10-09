import 'package:flutter/material.dart';
import 'package:flutter_project/Pages/register.dart';
import 'Pages/login.dart';
void main() {
  runApp(MaterialApp(
   debugShowCheckedModeBanner: false,
    initialRoute: 'login',
    routes: {'login':(context)=>MyLogin()},
  ));//MaterailApp
}


