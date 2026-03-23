import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/data/services/api_caller.dart';
import 'package:task_manager/data/services/api_response.dart';
import 'package:task_manager/screens/home_screen.dart';
import 'package:task_manager/screens/sign_up.dart';
import 'package:task_manager/utils/app_colors.dart';
import 'package:task_manager/widget/screen_background.dart';

import '../utils/urls.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState>_formKey=GlobalKey<FormState>();
 TextEditingController emailController = TextEditingController();
 TextEditingController fistNameController = TextEditingController();
 TextEditingController lastnameController = TextEditingController();
 TextEditingController mobileController = TextEditingController();
 TextEditingController passwordController = TextEditingController();

 bool isLoading= false;
 _clearTextField(){
   emailController.clear();
   fistNameController.clear();
   lastnameController.clear();
   mobileController.clear();
   passwordController.clear();
 }

 Future<void>_signUp() async {
   Map<String,dynamic>requestBody={
     "email":emailController.text,
     "firstName":fistNameController.text,
     "lastName":lastnameController.text,
     "mobile":mobileController.text,
     "password":passwordController.text,
   };

   setState(() {
     isLoading=true;
   });
   
   final ApiResponse response =await ApiCaller.PostRequest(
       URL: Urls.signUpUrl,
     body: requestBody,
   );

   setState(() {
     isLoading =false;
   });

   if(response.isSuccess){
     _clearTextField();
     ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(content: Text('signup success'))
     );
   }else{
     ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(content: Text(response.responseData['data']))
     );
   }
 }



  void _onHomeScreen(){
    Navigator.push(context,
        MaterialPageRoute(builder: (context)=>HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child:Form(
            key: _formKey,
            child: Column(


              children:[
                SizedBox(height: 140,),
                Text("Join with US",
                    style:Theme.of(context).textTheme.titleLarge),
                SizedBox(
                  height: 20,
                ),

                TextFormField(
                  controller: emailController,
                  decoration:InputDecoration(
                      hintText: 'Email'
                  ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your email";
                      }

                      if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                        return "Please enter a valid email";
                      }

                      return null;
                    },

                ),

                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: fistNameController,
                  decoration:InputDecoration(
                      hintText: 'Frist Name'
                  ),
                  validator: (value){
                    if(value==null||value.isEmpty){
                      return "please enter your phone number";
                    }
                  },

                ),

                SizedBox(
                  height: 15,
                ),

                TextFormField(
                  controller: lastnameController,
                  decoration:InputDecoration(
                      hintText: 'Last Name'
                  ),

                  validator: (value){
                    if(value==null||value.isEmpty){
                      return "please enter your lastname";
                    }
                  },


                ),

                SizedBox(
                  height: 15,
                ),


                TextFormField(
                  controller: mobileController,
                  decoration:InputDecoration(
                      hintText: 'Mobile'
                  ),

                  validator: (value){
                    if(value==null||value.isEmpty){
                      return "please enter your fristname";
                    }
                  },

                ),

                SizedBox(
                  height: 15,
                ),



                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration:InputDecoration(
                    hintText: 'password',

                  ),

                  validator:(value) {
          if (value == null || value.isEmpty) {
          return "Please enter password";
          }

          if (value.length < 6) {
          return "Password must be at least 6 characters";
          }

          return null;
          },


                ),


                isLoading?CircularProgressIndicator():FilledButton(onPressed: (){

                  if(_formKey.currentState!.validate()){
                    _signUp();

                  }
                },
                    child: Icon(Icons.arrow_circle_right_outlined )),

                SizedBox(
                  height: 30,
                ),


                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    RichText(text: TextSpan(
                        text: " have an account?",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black
                        ),
                        children: [
                          TextSpan(
                              text: 'Login',
                              style: TextStyle(
                                  color: AppColors.Pcolor,
                                  fontWeight: FontWeight.bold
                              ),

                              recognizer: TapGestureRecognizer()..onTap= _onHomeScreen

                          )
                        ]
                    ))
                  ],
                )

              ],
            ),
          ),
        ),
      )),
    );
  }
}
