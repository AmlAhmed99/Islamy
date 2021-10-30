
import 'package:flutter/material.dart';

class RadioScreen extends StatefulWidget {
   @override
   _RadioScreenState createState() => _RadioScreenState();
 }

 class _RadioScreenState extends State<RadioScreen> {
   @override
   Widget build(BuildContext context) {
     return Container(
       width: double.infinity,
       child: Column(
         children: [
           Image.asset('assets/images/radio.png',height: 170,),
           Text('عدد التسبيحات',style: TextStyle(
               fontSize: 20
           ),),

         ],
       ),
     );
   }
 }
