import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_project/Util/UtilPages.dart';
import 'package:flutter_project/Util/UtilWidgets.dart';

import '../Util/UtilButtons.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({super.key});

  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: UtilWidgets.buildBackgroundContainer(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Padding(
              padding: UtilitiesPages.buildPadding(context),
              child: Column(
                children: [
                  _buildLogo(),
                  const SizedBox(height: 10),
                  _buildFormContainer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // AppBar with title and help actions
  AppBar _buildAppBar() {
    return AppBar(
      title: Text('Trustify'),
      backgroundColor: Color.fromARGB(255, 109, 190, 231),
      actions: <Widget>[
        IconButton(onPressed: () {}, icon: Icon(Icons.help_outline_rounded)),
        TextButton(
          onPressed: () {},
          child: Text('Help  ', style: TextStyle(fontSize: 20)),
        ),
      ],
    );
  }

  // Logo image
  Widget _buildLogo() {
    return Image.asset(
      'assets/openPage3.png',
      height: 200,
      width: 200,
    );
  }

  // Container for all form elements
  Widget _buildFormContainer() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 40),
          _buildMobileNumberField(),
          SizedBox(height: UtilitiesPages.SIZE_BOX_HEIGHT),
          _buildPasswordField(),
          const SizedBox(height: 40),
          UtilButtons.buildButton(context:context,route:'contactRead',title: 'Log In'),
          //_buildLoginButton(),
          const SizedBox(height: 20),
          _buildForgotPasswordButton(),
          const SizedBox(height: 30),
          _buildRegisterButton(),
        ],
      ),
    );
  }

  // Mobile number input field
  Widget _buildMobileNumberField() {
    return TextField(
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(10),
      ],
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          vertical: UtilitiesPages.BOX_VERTICAL_SIZE,
          horizontal: UtilitiesPages.BOX_HORIZONTAL_SIZE,
        ),
        fillColor: Colors.white,
        filled: true,
        hintText: 'Enter your Mobile Number',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(UtilitiesPages.BOX_BORDER_RADIUS),
        ),
      ),
    );
  }

  // Password input field
  Widget _buildPasswordField() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          vertical: UtilitiesPages.BOX_VERTICAL_SIZE,
          horizontal: UtilitiesPages.BOX_HORIZONTAL_SIZE,
        ),
        fillColor: Colors.white,
        filled: true,
        hintText: 'Enter Your Password',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(UtilitiesPages.BOX_BORDER_RADIUS),
        ),
      ),
    );
  }

  // Login button
  Widget _buildLoginButton() {
    return Container(
      width: MediaQuery.of(context).size.width - (2 * UtilitiesPages.LEFT),
      padding: EdgeInsets.symmetric(horizontal: UtilitiesPages.LEFT),
      child: ElevatedButton(
        onPressed: _login,
        style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromARGB(255, 109, 174, 231),
          padding: EdgeInsets.symmetric(vertical: UtilitiesPages.BOX_VERTICAL_SIZE),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Text(
          'Log In',
          style: TextStyle(
            color: Colors.white,
            fontSize: UtilitiesPages.OPTION_FONT_SIZE,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  // "Forgot Password" button
  Widget _buildForgotPasswordButton() {
    return Container(
      width: MediaQuery.of(context).size.width - (2 * UtilitiesPages.LEFT),
      padding: EdgeInsets.symmetric(horizontal: UtilitiesPages.LEFT),
      child: TextButton(
        onPressed: _forgotPassword,
        child: Text(
          'Forget Password?',
          style: TextStyle(
            color: Colors.blue,
            fontSize: UtilitiesPages.OPTION_FONT_SIZE,
          ),
        ),
      ),
    );
  }

  // "New User? Register" button
  Widget _buildRegisterButton() {
    return Container(
      width: MediaQuery.of(context).size.width - (2 * UtilitiesPages.LEFT),
      padding: EdgeInsets.symmetric(horizontal: UtilitiesPages.LEFT),
      child: TextButton(
        onPressed: _navigateToRegister,
        child: RichText(
          text: TextSpan(
            text: 'New User? ',
            style: TextStyle(
              color: Colors.black,
              fontSize: UtilitiesPages.OPTION_FONT_SIZE,
            ),
            children: [
              TextSpan(
                text: 'Register',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: UtilitiesPages.OPTION_FONT_SIZE,
                ),
                recognizer: TapGestureRecognizer()..onTap = _navigateToRegister,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Methods for button actions
  void _login() {
    // Login logic here
  }

  void _forgotPassword() {
    // Forgot password logic here
  }

  void _navigateToRegister() {
    Navigator.pushNamed(context, "register");
  }
}
