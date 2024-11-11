import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_project/Security/Details.dart';
import 'package:flutter_project/Util/UtilPages.dart';
import 'package:flutter_project/Security/PasswordField.dart';
import 'package:flutter_project/Services/api_service.dart';
import 'package:flutter_project/Util/backButton.dart';

class MyRegister extends StatefulWidget {
  MyRegister({super.key});

  @override
  _MyRegisterState createState() => _MyRegisterState();
}

class _MyRegisterState extends State<MyRegister> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _userConfirmPasswordController =
      TextEditingController();
  final TextEditingController _userMobileNumeberController =
      TextEditingController();
  final TextEditingController _userEmailController = TextEditingController();

  void _sumbitRegister() {
    Details.userName = _userNameController.text;
    Details.mobile = _userMobileNumeberController.text;
    Details.password = PassphrasePasswordField.passwordController.text;
    Details.confirmPassword = _userConfirmPasswordController.text;
    Details.email = _userEmailController.text;
    bool isFlag = false;

    if (Details.email == null ||
        Details.confirmPassword == null ||
        Details.password == null ||
        Details.userName == null ||
        Details.email!.isEmpty ||
        Details.mobile!.isEmpty ||
        Details.userName!.isEmpty ||
        Details.password!.isEmpty ||
        Details.confirmPassword!.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("All Fields Are Required To Fill")),
      );
      print("null");
      isFlag = true;
    }
    if (Details.mobile?.length != 10) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please Enter Valid Number ")),
      );
      print("mobile");
      isFlag = true;
    }
    if (Details.email!.endsWith("@gmail.com") ||
        Details.email!.endsWith("@nitkkr.ac.in")) {
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please Enter Valid Gmail Accont")),
      );
      print("Gamil");
      isFlag = true;
    }
    if (Details.password != Details.confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Password Do no Match")),
      );
      print("password");
      isFlag = true;
    }
    if (!isFlag) {
      var userData = {
        "userName": Details.userName,
        "mobileNo": Details.mobile,
        "password": Details.password,
        "email": Details.email,
      };
      ApiService.RegisterUser(userData);
      print('Username: ${Details.userName}');
      print('Mobile: ${Details.mobile}');
      print('Email: ${Details.email}');
      print('Password: ${Details.password}');
      return;
    }
  }

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
          
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*0.15,horizontal:MediaQuery.of(context).size.width*0.40),
                child: 
                  Image.asset(
                  'assests/userIcon.png', // Ensure the image path is correct
                  height: 70, // Set desired height for the image
                  width: 70,  // Set desired width for the image
                ),
                
              ),
              Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height *
                        UtilitiesPages.BOX_ALIGNMENT,
                    right: UtilitiesPages.RIGHT,
                    left: UtilitiesPages.LEFT),
                child: Column(
                  children: [
                    // User Name TextField
                    TextField(
                      controller: _userNameController,
                      decoration: InputDecoration(
                        hintText: 'Enter your Name',
                        fillColor: Colors.white, // Set background to white
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(UtilitiesPages.BOX_BORDER_RADIUS),
                        ),
                      ),
                    ),
                    SizedBox(height: UtilitiesPages.SIZE_BOX_HEIGHT),

                    // Mobile Number TextField
                    TextField(
                      controller: _userMobileNumeberController,
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
                        fillColor: Colors.white, // Set background to white
                        filled: true,
                        hintText: 'Enter your Mobile Number',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(UtilitiesPages.BOX_BORDER_RADIUS),
                        ),
                      ),
                    ),
                    SizedBox(height: UtilitiesPages.SIZE_BOX_HEIGHT),

                    // Password Row (using your custom PasswordField)
                    const PassphrasePasswordField(),
                    SizedBox(height: UtilitiesPages.SIZE_BOX_HEIGHT),

                    // Confirm Password TextField
                    TextField(
                      controller: _userConfirmPasswordController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          vertical: UtilitiesPages.BOX_VERTICAL_SIZE,
                          horizontal: UtilitiesPages.BOX_HORIZONTAL_SIZE,
                        ),
                        fillColor: Colors.white, // Set background to white
                        filled: true,
                        hintText: 'Confirm Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(UtilitiesPages.BOX_BORDER_RADIUS),
                        ),
                      ),
                    ),
                    SizedBox(height: UtilitiesPages.SIZE_BOX_HEIGHT),

                    // Email TextField
                    TextField(
                      controller: _userEmailController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          vertical: UtilitiesPages.BOX_VERTICAL_SIZE,
                          horizontal: UtilitiesPages.BOX_HORIZONTAL_SIZE,
                        ),
                        fillColor: Colors.white, // Set background to white
                        filled: true,
                        hintText: 'Enter Your Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(UtilitiesPages.BOX_BORDER_RADIUS),
                        ),
                      ),
                    ),
                    SizedBox(height: UtilitiesPages.SIZE_BOX_HEIGHT),

                    // Register Button
                    Container(
                      width: MediaQuery.of(context).size.width - (2 * UtilitiesPages.LEFT), // Match the width of the text fields
                      padding: EdgeInsets.symmetric(horizontal: UtilitiesPages.LEFT),
                      child: ElevatedButton(
                        onPressed: () {
                          _sumbitRegister();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 109, 174, 231),
                          padding: EdgeInsets.symmetric(vertical: UtilitiesPages.BOX_VERTICAL_SIZE),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(UtilitiesPages.BOX_BORDER_RADIUS),
                          ),
                        ),
                        child: Text(
                          'Register',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: UtilitiesPages.OPTION_FONT_SIZE,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: UtilitiesPages.SIZE_BOX_HEIGHT),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
