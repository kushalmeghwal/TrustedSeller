import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_project/Pages/LoginPage.dart';
import 'package:flutter_project/Pages/RegisterPage.dart';
import 'package:flutter_project/Util/UtilButtons.dart';
import 'package:flutter_project/Util/UtilPages.dart';
import 'package:flutter_project/Util/UtilWidgets.dart';

class MyWelcome extends StatefulWidget {
  const MyWelcome({super.key});

  @override
  _MyWelcomeState createState() => _MyWelcomeState();
}

class _MyWelcomeState extends State<MyWelcome> {
  bool isLoginPressed = false;
  bool isSignUpPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: UtilWidgets.buildBackgroundContainer(
        child: Padding(
          padding: UtilitiesPages.buildPadding(context),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildHeading(),
              SizedBox(height: UtilitiesPages.SIZE_BOX_HEIGHT),
              UtilButtons.buildButton(context:context,route:'login',title: 'Log In'),
              const SizedBox(height: 20),
              UtilButtons.buildButton(context:context,route:'register',title: 'Register'),

            ],
          ),
        ),
      ),
    );
  }

  // AppBar with close icon and help actions
  AppBar _buildAppBar() {
    return AppBar(
      leading: IconButton(
        onPressed: () => exit(0),
        icon: Icon(Icons.close),
      ),
      title: Text('Trustify'),
      backgroundColor: Color.fromARGB(255, 109, 190, 231),
      actions: <Widget>[
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.help_outline_rounded),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            'Help  ',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ],
    );
  }

  // Heading with logo image
  Widget _buildHeading() {
    return Column(
      children: [
        Image.asset(
          'assets/openPage3.png',
          height: 300,
          width: 300,
        ),
        const SizedBox(height: 10),
      ],
    );
  }

}
