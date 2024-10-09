import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}): super(key: key);
  @override
  _MyLoginState createState()=> _MyLoginState();
}

class _MyLoginState extends State<MyLogin>{
  var fontSizes =33.5;
  @override
  Widget build(BuildContext context){
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assests/login.png'),fit: BoxFit.cover)
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                padding:EdgeInsets.only(left:39,top: 130),
                child: Text('Welcome To \n TrustedSeller',
                  style: TextStyle(
                  color: Colors.white,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,
                  fontSize: fontSizes
                ),),
              ),
            ),
             Container(
               padding:EdgeInsets.only(
                   top:MediaQuery.of(context).size.height*0.42,right:35,left: 35) ,
              child: Column(
                children: [
                  TextField(
                    keyboardType: TextInputType.number,  // Show numeric keyboard
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,  // Allow only digits (0-9)
                    ],
                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      hintText: 'Mobile Number',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          hintText: 'Password',
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
                         style: TextStyle(color: Colors.grey,fontSize: 20,fontWeight:FontWeight.w400)
                     ),
                     CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.grey,
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
                            'Sign Up',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 20
                            ),
                          )),
                      TextButton(onPressed: (){},
                          child: Text(
                            'Forget Password',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 20
                            ),
                          )),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}