
import 'package:flutter/material.dart';
import 'package:islamy/main.dart';
import 'package:islamy/screens/hadeesDetails.dart';
import 'package:flutter_gen/gen_L10n/app_localizations.dart';
class AhadeesScreen extends StatefulWidget {

  @override
  _AhadeesScreenState createState() => _AhadeesScreenState();
}

class _AhadeesScreenState extends State<AhadeesScreen> {
  var a7adesHeader=[
    'الحديث الاول','الحديث الثاني','الحديث الثالث','الحديث الرابع','الحديث الخامس',
    'الحديث السادس','الحديث السابع','الحديث الثامن','الحديث التاسع','الحديث العاشر',
    'الحديث الحادي عشر','الحديث الثاني عشر','الحديث الثالث عشر','الحديث الرابع عشر','الحديث الخامس عشر',
    'الحديث السادس عشر','الحديث السابع عشر','الحديث الثامن عشر','الحديث التاسع عشر','الحديث العشرون',
    'الحديث الحادي وعشرون','الحديث الثاني وعشرون','الحديث الثالث وعشرون','الحديث الرابع وعشرون','الحديث الخامس وعشرون',
    'الحديث السادس والعشرون','الحديث السابع والعشرون','الحديث الثامن والعشرون','الحديث التاسع والعشرون','الحديث الثلاثين',
    'الحديث الحادي وثلاثون','الحديث الثاني وثلاثون','الحديث الثالث وثلاثون','الحديث الرابع وثلاثون','الحديث الخامس وثلاثون',
    'الحديث السادس وثلاثون','الحديث السابع وثلاثون','الحديث الثامن وثلاثون','الحديث التاسع وثلاثون','الحديث الاربعون',
    'الحديث الحادي والاربعون','الحديث الثاني والاربعون','الحديث الثالث والاربعون','الحديث الرابع والاربعون','الحديث الخامس والاربعون',
    'الحديث السادس والاربعون','الحديث السابع والاربعون','الحديث الثامن والاربعون','الحديث التاسع والاربعون','الحديث الخمسون',
  ];


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          Image.asset('assets/images/a7ades.png',height: 170,),
          Divider(color: AppTheme.primaryColor,thickness: 2,),
          Text(AppLocalizations.of(context).alahadeth,style: TextStyle(
            fontSize: 20
          ),),
          Divider(color: AppTheme.primaryColor,thickness: 2,),
          Expanded(
            child: ListView.builder(
              itemCount: a7adesHeader.length,
                itemBuilder: (ctx,idx)=>
                InkWell(
                  onTap: (){


                    Navigator.pushNamed(context, HadeesDetails.HadeesDetailsRoute,
                        arguments: Data(a7adesHeader[idx],idx));
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                      alignment: Alignment.center,
                      child: Text(a7adesHeader[idx],style: TextStyle(
                          fontSize: 18
                      ),)),
                )
            ),
          )


        ],
      ),
    );
  }
}
