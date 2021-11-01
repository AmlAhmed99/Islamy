
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_L10n/app_localizations.dart';
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
         mainAxisAlignment: MainAxisAlignment.spaceAround,
         children: [
           Image.asset('assets/images/radio.png',height: 170,),
           Text(AppLocalizations.of(context).radio,style: TextStyle(
               fontSize: 20
           ),),
           Image.asset('assets/images/RadioImage.png',height: 170,),
         ],
       ),
     );
   }
 }
