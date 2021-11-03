
import 'dart:async';

import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:islamy/layout/home_layout.dart';
import 'package:islamy/providers/AppConfigProvider.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  static String SplashScreenRoute='SplashScreenRoute';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    Timer(Duration(seconds: 5),(){
     Navigator.pushNamed(context, Home.HomeRoute);
    });

  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          ConditionalBuilder(
            condition:  Provider.of<AppConfigProvider>(context).isDark==true ,
            builder: (context){
              return Container(
                color: Colors.transparent,
                width: double.infinity,
                child: Image.asset('assets/images/bgdark.png',fit: BoxFit.fill,),
              );
            },
            fallback: (context){
              return Container(
                color: Colors.transparent,
                width: double.infinity,
                child: Image.asset('assets/images/bg3.png',fit: BoxFit.fill,),
              );
            },
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
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
          ),
        ],
      ),
    );
  }
}
