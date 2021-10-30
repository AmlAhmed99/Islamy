
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:islamy/layout/home_layout.dart';

class SplashScreen extends StatefulWidget {
  static String SplashScreenRoute='SplashScreenRoute';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Timer(Duration(seconds: 3),(){
     Navigator.pushNamed(context, Home.HomeRoute);
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/logo.png',height: 180,),
              SizedBox(height: 50,),
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Color.fromRGBO(182, 146, 95, 1.0)),
              )

            ],
          ),
        ),
      ),
    );
  }
}
