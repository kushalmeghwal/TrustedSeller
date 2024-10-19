import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_project/Security/Details.dart';
import 'package:flutter_project/Util/UtilPages.dart';
import 'package:flutter_project/Security/PasswordField.dart';

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

    if(Details.email==null || Details.confirmPassword==null || Details.password==null ||
        Details.userName==null||Details.email!.isEmpty||Details.mobile!.isEmpty||
        Details.userName!.isEmpty||Details.password!.isEmpty||Details.confirmPassword!.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("All Fields Are Required To Fill")),
      );
      print("null");
      isFlag=true;
    }
      if(Details.mobile?.length!=10){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please Enter Valid Number ")),
      );
      print("mobile");
      isFlag=true;
    }
      if(Details.email!.endsWith("@gmail.com")|| Details.email!.endsWith("@nitkkr.ac.in")){
    }else{
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Please Enter Valid Gmail Accont")),
        );
        print("Gamil");
        isFlag=true;
      }
    if (Details.password != Details.confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Password Do no Match")),
      );
      print("password");
      isFlag= true;
    }
   if(!isFlag){
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
                        UtilitiesPages.BOX_ALIGNMENT,
                    right: UtilitiesPages.RIGHT,
                    left: UtilitiesPages.LEFT),
                child: Column(
                  children: [
                    //UserName Bo
                    //UtilitiesPages.buildUsernameTextField("Enter Your Name"),
                    TextField(
                      controller: _userNameController,
                      decoration:  InputDecoration(
                        hintText: 'Enter your Name',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                UtilitiesPages.BOX_BORDER_RADIUS)),
                      ),
                    ),
                    SizedBox(
                      height: UtilitiesPages.SIZE_BOX_HEIGHT,
                    ),
                    //Mobile Number Row
                    TextField(
                      controller: _userMobileNumeberController,
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

                    //Password Row
                     const PassphrasePasswordField(),
                    SizedBox(
                      height: UtilitiesPages.SIZE_BOX_HEIGHT,
                    ),

                    //Confirm Password
                    TextField(
                      controller: _userConfirmPasswordController,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: UtilitiesPages.BOX_VERTICAL_SIZE,
                              horizontal: UtilitiesPages.BOX_HORIZONTAL_SIZE),
                          fillColor: Colors.grey.shade100,
                          //filled: true,
                          hintText: 'Confirm Password',
                          hintStyle: TextStyle(
                            fontSize: UtilitiesPages
                                .BOX_TEXT_FONT_SIZE, // Change font size
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  UtilitiesPages.BOX_BORDER_RADIUS))),
                    ),
                    SizedBox(
                      height: UtilitiesPages.SIZE_BOX_HEIGHT,
                    ),

                    TextField(
                      controller: _userEmailController,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: UtilitiesPages.BOX_VERTICAL_SIZE,
                              horizontal: UtilitiesPages.BOX_HORIZONTAL_SIZE),
                          fillColor: Colors.grey.shade100,
                          hintText: 'Enter Your Email',
                          hintStyle: TextStyle(
                            fontSize: UtilitiesPages.BOX_TEXT_FONT_SIZE,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  UtilitiesPages.BOX_BORDER_RADIUS))),
                    ),
                    SizedBox(
                      height: UtilitiesPages.SIZE_BOX_HEIGHT,
                    ),
                    Column(children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.green,
                        child: IconButton(
                            onPressed: () {
                              _sumbitRegister();
                            },
                            icon: const Icon(Icons.arrow_forward)),
                      ),
                      const Text('Press To Confirm',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                          )),
                    ]),
                    SizedBox(
                      height: UtilitiesPages.SIZE_BOX_HEIGHT + 20,
                    ),
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
