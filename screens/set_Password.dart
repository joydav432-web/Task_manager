import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/screens/home_screen.dart';
import 'package:task_manager/screens/sign_up.dart';
import 'package:task_manager/utils/app_colors.dart';
import 'package:task_manager/widget/screen_background.dart';

import 'Email_Pin_verification.dart';

class Set_Password extends StatefulWidget {
  const Set_Password({super.key});

  @override
  State<Set_Password> createState() => _Set_PasswordState();
}

class _Set_PasswordState extends State<Set_Password> {

  void _onTapSignUp (){
    Navigator.push(context,
        MaterialPageRoute(builder: (context)=>SignUp()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(


          children:[
            SizedBox(height: 140,),
            Text("Set Password",
                style:Theme.of(context).textTheme.titleLarge),
            SizedBox(
              height: 20,
            ),

            Text("Minimum length Password 8 character with",
                style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.grey.shade700)),


            Text("Latter and number combination",
                style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.grey.shade700)),

            SizedBox(height: 10),

            TextFormField(
              obscureText: true,
              decoration:InputDecoration(
                  hintText: 'Password'
              ),

            ),

            SizedBox(
              height: 15,
            ),
            TextFormField(
              obscureText: true,
              decoration:InputDecoration(
                  hintText: 'Confirm Password'
              ),

            ),

            SizedBox(
              height: 15,
            ),




            FilledButton(onPressed: (){
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context)=>HomeScreen()));
            },
                child: Icon(Icons.arrow_circle_right_outlined )),

            SizedBox(
              height: 60,
            ),


            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(onPressed: (){},

                    child: Text('',
                      style: TextStyle(
                          color: Colors.grey
                      ),
                    )),
                RichText(text: TextSpan(
                    text: "have an account?",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                    ),
                    children: [
                      TextSpan(
                          text: 'Sing Up',
                          style: TextStyle(
                              color: AppColors.Pcolor,
                              fontWeight: FontWeight.bold
                          ),
                          recognizer: TapGestureRecognizer()..onTap= _onTapSignUp
                      )
                    ]
                ))
              ],
            )



          ],
        ),
      )),
    );
  }
}
