import 'package:flutter/material.dart';

import 'package:flutter_project/Pages/login.dart';
import 'package:flutter_project/Pages/register.dart';
import 'package:flutter_project/Util/UtilPages.dart';

class MyWelcome extends StatefulWidget {
  const MyWelcome({super.key});


  @override
  _MyWelcomeState createState() => _MyWelcomeState();
}

class _MyWelcomeState extends State<MyWelcome> {

  bool isLoginPressed = false;
  bool isSignUpPressed = false;

  @override
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        //color: Color.fromARGB(223, 154, 206, 255),
          gradient: LinearGradient(
              colors: [Color.fromARGB(255, 116, 195, 234), Color.fromARGB(255, 255, 255, 255)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.4, 0.9],
            tileMode: TileMode.clamp,
          )
          ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: UtilitiesPages.LEFT,
          vertical: UtilitiesPages.TOP,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
      
            _buildHeading(),
            SizedBox(height: UtilitiesPages.SIZE_BOX_HEIGHT),
         
           // _buildTitle(),
            SizedBox(height: UtilitiesPages.SIZE_BOX_HEIGHT),
            //_buildSubtitle(),
            SizedBox(height: UtilitiesPages.SIZE_BOX_HEIGHT + 10),
            _buildLoginButton(),
            const SizedBox(height: 20),
            _buildSignUpButton(),
          ],
        ),
      ),
    );
  }

Widget _buildHeading() {
  return Container(
    child: Column(
      children: [
        Image.asset(
          'assests/openPage3.png', // Ensure the image path is correct
          height: 300, // Set desired height for the image
          width: 300,  // Set desired width for the image
        ),
        const SizedBox(height: 10), // Adds spacing between image and text
      ],
    ),
  );
}



  Widget _buildLoginButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromARGB(255, 109, 174, 231),
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(UtilitiesPages.BOX_BORDER_RADIUS),
        ),
      ),
      onPressed: () {
        setState(() {
          isLoginPressed = true;
          isSignUpPressed = false;
        });
        Future.delayed(const Duration(milliseconds: 100), () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyLogin()),
          );
        });
      },
      child: const Text(
        'Log In',
        style: TextStyle(fontSize: 18, color: Colors.white),
      ),
    );
  }

  Widget _buildSignUpButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
               backgroundColor: Color.fromARGB(255, 109, 174, 231),
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(UtilitiesPages.BOX_BORDER_RADIUS),
        ),
      ),
      onPressed: () {
        setState(() {
          isSignUpPressed = true;
          isLoginPressed = false;
        });
        Future.delayed(const Duration(milliseconds: 100), () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyRegister()),
          );
        });
      },
      child: const Text(
        'Register',
        style: TextStyle(fontSize: 18, color: Colors.white),
      ),
    );
  }

}


