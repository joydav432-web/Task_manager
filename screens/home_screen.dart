import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/data/Models/user_model.dart';
import 'package:task_manager/data/controller/auth_Controller.dart';
import 'package:task_manager/screens/email_verify_screen.dart';
import 'package:task_manager/screens/main_nav_screen.dart';
import 'package:task_manager/screens/new_task_screen.dart';
import 'package:task_manager/screens/sign_up.dart';
import 'package:task_manager/utils/app_colors.dart';
import 'package:task_manager/widget/screen_background.dart';

import '../data/services/api_caller.dart';
import '../data/services/api_response.dart';
import '../utils/urls.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final GlobalKey<FormState>_formKey=GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isLoading = false;


  Future<void>_signIn() async {
    Map<String,dynamic>requestBody={
      "email":emailController.text,

      "password":passwordController.text,
    };

    setState(() {
      isLoading=true;
    });

    final ApiResponse response =await ApiCaller.PostRequest(
      URL: Urls.logInUrl,
      body: requestBody,
    );

    setState(() {
      isLoading =false;
    });

    if(response.isSuccess){


      UserModel model = UserModel.fromJson(response.responseData['data']);
      String accessToken = response.responseData['token'];
      AuthController.saveUserData(model, accessToken);
      Navigator.push(context,
          MaterialPageRoute(builder: (context)=>MainNavScreen()));


      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('signIn success'))
      );
    }else{
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(response.responseData['data']?.toString()??"login failled"))
      );
    }
  }



  void _onTapSignUp (){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignUp()),
    );
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SingleChildScrollView(

          child: Form(
            key: _formKey,
            child: Column(


                children:[
                  SizedBox(height: 140,),
                  Text("Get Started With",
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
                  FilledButton(onPressed: (){





                    if(_formKey.currentState!.validate()){
                      _signIn();



                    }

                  },
                      child: Icon(Icons.arrow_circle_right_outlined )),

                  SizedBox(
                    height: 60,
                  ),


                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(onPressed: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context)=>Emailverify()));
                      },

                          child: Text('Forget password ?',
                          style: TextStyle(
                            color: Colors.grey
                          ),
                          )),
                      RichText(text: TextSpan(
                        text: "Don't have an account?",
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
          ),
        ),
      )),
    );
  }
}
