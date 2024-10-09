import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyRegister extends StatefulWidget {
  const MyRegister({Key? key}): super(key: key);
  @override
  _MyRegisterState createState()=> _MyRegisterState();
}

class _MyRegisterState extends State<MyRegister>{
  var fontSizes =33.5;
  @override
  Widget build(BuildContext context){
    return Container(
      decoration: BoxDecoration(
          color: Colors.greenAccent.shade100,
          // image: DecorationImage(
          //     image: AssetImage('assests/register.png'),fit: BoxFit.cover)
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [

              Container(
                padding:EdgeInsets.only(left:39,top: 130),
                child: Text('Welcome To \n TrustedSeller',
                  style: TextStyle(
                      color: Colors.green,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,
                      fontSize: fontSizes
                  ),),
              ),

            SingleChildScrollView  (
                child: Container(
              padding:EdgeInsets.only(
                  top:MediaQuery.of(context).size.height*0.30,right:35,left: 35) ,
              child: Column(
                children: [
                  //UserName Bo
                  TextField(
                    decoration: InputDecoration(
                        filled: true,
                        hintText: 'Enter Your Name',
                        hintStyle: TextStyle(
                          color: Colors.green, // Set hint text color to green
                          fontSize: 16,        // Change font size
                          fontStyle: FontStyle.italic, // Make the hint text italic (optional)
                          fontWeight: FontWeight.bold, // Set a different font weight (optional)
                        ),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  //Mobile Number Row
                  TextField(
                    keyboardType: TextInputType.number,  // Show numeric keyboard
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,  // Allow only digits (0-9)
                    ],
                    decoration: InputDecoration(
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        hintText: 'Enter Mobile Number',
                        hintStyle: TextStyle(
                          color: Colors.green, // Set hint text color to green
                          fontSize: 16,        // Change font size
                          fontStyle: FontStyle.italic, // Make the hint text italic (optional)
                          fontWeight: FontWeight.bold, // Set a different font weight (optional)
                        ),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),

                  //Password Row
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        hintText: 'Create Password',
                        hintStyle: TextStyle(
                          color: Colors.green, // Set hint text color to green
                          fontSize: 16,        // Change font size
                          fontStyle: FontStyle.italic, // Make the hint text italic (optional)
                          fontWeight: FontWeight.bold, // Set a different font weight (optional)
                        ),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),

                  //Confirm Password
                  TextField(

                    decoration: InputDecoration(
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        hintText: 'Confirm Password',
                        hintStyle: TextStyle(
                          color: Colors.green, // Set hint text color to green
                          fontSize: 16,        // Change font size
                          fontStyle: FontStyle.italic, // Make the hint text italic (optional)
                          fontWeight: FontWeight.bold, // Set a different font weight (optional)
                        ),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          'Sign In',
                          style: TextStyle(color: Colors.green,fontSize: 25,fontWeight:FontWeight.w900)
                      ),
                      CircleAvatar(

                        radius: 30,
                        backgroundColor: Colors.green,
                        child: IconButton(onPressed: (){}, icon:Icon(Icons.arrow_forward) ),
                      ),

                    ],

                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      TextButton(onPressed: (){},
                          child: Text(
                            'Sign In',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 20
                            ),
                          )),
                      TextButton(onPressed: (){},
                          child: Text(
                            'Press To Confirm',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 20
                            ),
                          )),
                    ],
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}