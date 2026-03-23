import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/screens/sign_up.dart';
import 'package:task_manager/utils/app_colors.dart';
import 'package:task_manager/widget/screen_background.dart';

import 'Email_Pin_verification.dart';

class Emailverify extends StatefulWidget {
  const Emailverify({super.key});

  @override
  State<Emailverify> createState() => _EmailverifyState();
}

class _EmailverifyState extends State<Emailverify> {

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
            Text("Your Email Address",
                style:Theme.of(context).textTheme.titleLarge),
            SizedBox(
              height: 20,
            ),

            Text("A 6 digit verification pin will send to your",
            style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.grey.shade700)),


            Text("Your email address",
                style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.grey.shade700)),

            SizedBox(height: 10),

            TextFormField(
              decoration:InputDecoration(
                  hintText: 'Email'
              ),

            ),

            SizedBox(
              height: 15,
            ),




            FilledButton(onPressed: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>EmailPinVerification()));
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
