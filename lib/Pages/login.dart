import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_project/Util/UtilPages.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({super.key});
  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  FocusNode _focusNode = FocusNode();
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
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.only(
                    left: UtilitiesPages.LEFT, top: UtilitiesPages.TOP),
                child: Text(
                  'Welcome To \n TrustedSeller',
                  style: TextStyle(
                      color: Colors.green,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      fontSize: UtilitiesPages.WELCOM_FONT_SIZE),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height *
                        (UtilitiesPages.BOX_ALIGNMENT+0.15),
                    right: UtilitiesPages.RIGHT,
                    left: UtilitiesPages.LEFT),
                child: Column(
                  children: [
                    TextField(
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter
                            .digitsOnly, // Allow only digits
                        LengthLimitingTextInputFormatter(10),
                      ],
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: UtilitiesPages.BOX_VERTICAL_SIZE,
                            horizontal: UtilitiesPages.BOX_HORIZONTAL_SIZE),
                        fillColor: Colors.grey.shade100,
                        hintText: 'Enter your Mobile Number',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                UtilitiesPages.BOX_BORDER_RADIUS)),
                      ),
                    ),
                    SizedBox(
                      height: UtilitiesPages.SIZE_BOX_HEIGHT,
                    ),
                    UtilitiesPages.buildUsernameTextField(
                        "Enter Your Password"),
                    const SizedBox(
                      height: 40,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.green,
                          child: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.arrow_forward),color: Colors.white,),
                        ),
                        Text('Sign In',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: UtilitiesPages.OPTION_FONT_SIZE,
                                fontWeight: FontWeight.w400)),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, "register");
                            },
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: UtilitiesPages.OPTION_FONT_SIZE,
                              ),
                            )),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              'Forget Password',
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontSize: UtilitiesPages.OPTION_FONT_SIZE),
                            )),
                      ],
                    )
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
