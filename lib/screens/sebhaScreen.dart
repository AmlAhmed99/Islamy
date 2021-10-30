
import 'package:flutter/material.dart';
import 'package:islamy/main.dart';
import 'dart:math' as math;

class SebhaScreen extends StatefulWidget {

  @override
  _SebhaScreenState createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> with SingleTickerProviderStateMixin{
   AnimationController controller;
   Animation<double> animation;
  int counter=0;
  static const  PI=3.14;
   @override
  void initState() {

   controller=AnimationController(
     vsync: this,
     duration: Duration(milliseconds: 700),
   );

   controller.addStatusListener((status) async{
     if(status==AnimationStatus.completed){
       await Future.delayed(Duration(seconds: 1));
       controller.reset();
     }
   });
   setRotation(360);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  void setRotation(int degree){
     final angle=degree*PI/180;
     animation=Tween<double>(begin: 0,end: angle).animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    String doaa=ChangeDoaa();
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [

          AnimatedBuilder(
          animation: animation,
          builder: (context,child)=>Transform.rotate(
              angle: animation.value,
          child: child,
          ),
          child: InkWell(
            child: Image.asset('assets/images/seb7a.png',height: 170,),
            onTap: (){
              counter++;
              setRotation(360);
              controller.forward(from: 0);
              setState(() {

              });
            },
          ),
        ),
          Text('عدد التسبيحات',style: TextStyle(
            fontSize: 20
          ),),
          Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(213, 172, 118, 0.7),
              borderRadius: BorderRadius.circular(12)
            ),
            width: 55,
            height: 60,
            alignment: Alignment.center,
            child:Text('${counter}',style: TextStyle(
              fontSize: 20
            ),textAlign: TextAlign.center,),
          ),
          Container(
            decoration: BoxDecoration(
                color: AppTheme.primaryColor,
                borderRadius: BorderRadius.circular(12)
            ),
            width: 100,
            height: 50,
            alignment: Alignment.center,
            child:Text(doaa,style: TextStyle(
                fontSize: 20
            ),textAlign: TextAlign.center,),
          ),

        ],
      ),
    );
  }
  String ChangeDoaa(){
    String doaa='سبحان الله';
      if (counter>30&&counter<60)
        doaa='الله اكبر';
      else if(counter>60&&counter<90)
        doaa='لا اله الا الله';
      else if(counter>90&&counter<120)
        doaa='الحمد لله';
      else if(counter>120) {
        doaa = 'سبحان الله';
        counter = 0;
      }

      return doaa;


  }

}
