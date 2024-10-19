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
          gradient: LinearGradient(
            colors: [Colors.white, Colors.green],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.5, 1],
            tileMode: TileMode.clamp,
          )),
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
            _buildImage(),
            SizedBox(height: UtilitiesPages.SIZE_BOX_HEIGHT),
            _buildTitle(),
            SizedBox(height: UtilitiesPages.SIZE_BOX_HEIGHT),
            _buildSubtitle(),
            SizedBox(height: UtilitiesPages.SIZE_BOX_HEIGHT + 10),
            _buildLoginButton(),
            const SizedBox(height: 20),
            _buildSignUpButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildImage() {
    return Image.asset(
      'assests/welcome.png',
      height: 200,
      errorBuilder: (context, error, stackTrace) {
        return Icon(Icons.error, size: 200, color: Colors.red);
      },
    );
  }

  Widget _buildHeading(){
    return Container(

      child: Text(
        'Welcome To \n TrustedSeller',
        style: TextStyle(
            color: Colors.green,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
            fontSize: UtilitiesPages.WELCOM_FONT_SIZE),
      ),
    );
  }


  Widget _buildTitle() {
    return const Text(
      'ALL YOUR SHOPPING IN ONE APP',
      style: TextStyle(
        fontSize: 20,
        color: Colors.green,
      ),
      textAlign: TextAlign.center,
      softWrap: true,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildSubtitle() {
    return const Text(
      'Sell your products the smarter,\nfaster way for immediate cash and a\n cleaner conscience and trust.',
      style: TextStyle(
        fontSize: 16,
        color: Colors.black,
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildLoginButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: isLoginPressed ? Colors.green : Colors.black,
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
        backgroundColor: isSignUpPressed ? Colors.green : Colors.black,
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
        'Sign Up',
        style: TextStyle(fontSize: 18, color: Colors.white),
      ),
    );
  }

}


