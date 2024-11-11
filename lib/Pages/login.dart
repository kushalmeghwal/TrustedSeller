import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_project/Util/UtilPages.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({super.key});
  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  @override
  Widget build(BuildContext context) {
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
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.15),
            child: Column(
              children: [
                Image.asset(
                  'assests/openPage3.png', // Ensure the image path is correct
                  height: 200, // Set desired height for the image
                  width: 200,  // Set desired width for the image
                ),
                const SizedBox(height: 10),
                Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: UtilitiesPages.LEFT),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 40),
                        // Mobile Number TextField
                        TextField(
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
                        ),
                        SizedBox(height: UtilitiesPages.SIZE_BOX_HEIGHT),
                        // Password TextField
                        TextField(
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
                        ),
                        const SizedBox(height: 40),
                        // Sign In Button (more rounded corners)
                        Container(
                          width: MediaQuery.of(context).size.width - (2 * UtilitiesPages.LEFT), // Matches width of the text fields
                          padding: EdgeInsets.symmetric(horizontal: UtilitiesPages.LEFT),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 109, 174, 231),
                              padding: EdgeInsets.symmetric(
                                  vertical: UtilitiesPages.BOX_VERTICAL_SIZE),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30), // Increase this value for more roundness
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
                        ),
                        const SizedBox(height: 20),
                        // "Forgot Password" button before "New User? Register"
                        Container(
                          width: MediaQuery.of(context).size.width - (2 * UtilitiesPages.LEFT),
                          padding: EdgeInsets.symmetric(horizontal: UtilitiesPages.LEFT),
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              'Forget Password ?',
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: UtilitiesPages.OPTION_FONT_SIZE,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30), // Increased gap between buttons
                        Container(
                          width: MediaQuery.of(context).size.width - (2 * UtilitiesPages.LEFT),
                          padding: EdgeInsets.symmetric(horizontal: UtilitiesPages.LEFT),
                          child: TextButton(
                            onPressed: () {},
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
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.pushNamed(context, "register");
                                      },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
