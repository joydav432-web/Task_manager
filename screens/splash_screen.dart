
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_manager/data/controller/auth_Controller.dart';
import 'package:task_manager/screens/home_screen.dart';
import 'package:task_manager/screens/main_nav_screen.dart';
import 'package:task_manager/utils/asset_path.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(Duration(seconds: 3),() async {
     await AuthController.getUserData();
      final bool isLoggedIn = await AuthController.isUserLoggedIn();


      if(isLoggedIn){
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context)=>MainNavScreen()));
      }else{
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context)=>HomeScreen()));
      }


    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SvgPicture.asset(AssetPaths.backgroundSVG,
          fit:  BoxFit.cover,
            height: double.infinity,
          ),
          Center(child: SvgPicture.asset(AssetPaths.logoSVG)),
        ],
      ),
    );
  }
}
