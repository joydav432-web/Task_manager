import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/screens/set_Password.dart';
import 'package:task_manager/screens/sign_up.dart';
import 'package:task_manager/utils/app_colors.dart';
import 'package:task_manager/widget/screen_background.dart';
import 'package:pin_code_fields/pin_code_fields.dart';



class EmailPinVerification extends StatefulWidget {
  const EmailPinVerification({super.key});

  @override
  State<EmailPinVerification> createState() => _EmailPinVerificationState();
}

class _EmailPinVerificationState extends State<EmailPinVerification> {

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
            Text("Pin Verification",
                style:Theme.of(context).textTheme.titleLarge),
            SizedBox(
              height: 20,
            ),

            Text("A 6 digit verification pin will send to your",
                style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.grey.shade700)),


            Text("Your email address",
                style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.grey.shade700)),

            SizedBox(height: 10),

            PinInput(
              length: 6,
              builder: (context, cells) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: cells.map((cell) {
                    return Container(
                      width: 45,
                      height: 50,
                      margin: EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: cell.isFocused ? Colors.blue : Colors.grey[200],
                      ),
                      child: Center(
                        child: Text(
                          cell.character ?? '',
                          style: TextStyle(fontSize: 10),
                        ),
                      ),
                    );
                  }).toList(),
                );
              },
              onCompleted: (pin) => print('PIN: $pin'),
            ),

            SizedBox(
              height: 15,
            ),




            FilledButton(onPressed: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>Set_Password()));
            },
                child: Text('verify',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Colors.white
                ),)),

            SizedBox(
              height: 40,
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
