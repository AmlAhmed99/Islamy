
import 'package:flutter/material.dart';
import 'package:islamy/main.dart';
import 'package:islamy/screens/hadeesDetails.dart';
import 'package:islamy/screens/moshafDetails.dart';
import 'package:flutter_gen/gen_L10n/app_localizations.dart';

class MoshafScreen extends StatefulWidget {
  @override
  _MoshafScreenState createState() => _MoshafScreenState();
}

class _MoshafScreenState extends State<MoshafScreen> {
   static  List<String> suraNames=["الفاتحه","البقرة","آل عمران","النساء","المائدة","الأنعام","الأعراف","الأنفال","التوبة","يونس","هود"
  ,"يوسف","الرعد","إبراهيم","الحجر","النحل","الإسراء","الكهف","مريم","طه","الأنبياء","الحج","المؤمنون"
  ,"النّور","الفرقان","الشعراء","النّمل","القصص","العنكبوت","الرّوم","لقمان","السجدة","الأحزاب","سبأ"
  ,"فاطر","يس","الصافات","ص","الزمر","غافر","فصّلت","الشورى","الزخرف","الدّخان","الجاثية","الأحقاف"
  ,"محمد","الفتح","الحجرات","ق","الذاريات","الطور","النجم","القمر","الرحمن","الواقعة","الحديد","المجادلة"
  ,"الحشر","الممتحنة","الصف","الجمعة","المنافقون","التغابن","الطلاق","التحريم","الملك","القلم","الحاقة","المعارج"
  ,"نوح","الجن","المزّمّل","المدّثر","القيامة","الإنسان","المرسلات","النبأ","النازعات","عبس","التكوير","الإنفطار"
  ,"المطفّفين","الإنشقاق","البروج","الطارق","الأعلى","الغاشية","الفجر","البلد","الشمس","الليل","الضحى","الشرح"
  ,"التين","العلق","القدر","البينة","الزلزلة","العاديات","القارعة","التكاثر","العصر",
  "الهمزة","الفيل","قريش","الماعون","الكوثر","الكافرون","النصر","المسد","الإخلاص","الفلق","الناس"];
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/moshaf.png',height: 170,),
            Divider(color: AppTheme.primaryColor,thickness: 2,),
            Text(AppLocalizations.of(context).alquraan,style: TextStyle(
                fontSize: 20
            ),),
            Divider(color: AppTheme.primaryColor,thickness: 2,),
            Expanded(
              child: ListView.builder(
                  itemCount: suraNames.length,
                  itemBuilder: (ctx,idx)=>
                      InkWell(
                        onTap: (){
                          Navigator.pushNamed(context, MoshafDetails.MoshafDetailsRoute,
                              arguments: DataSura(suraNames[idx],idx));
                        },
                        child: Container(
                            padding: EdgeInsets.all(8),
                            alignment: Alignment.center,
                            child: Text(suraNames[idx],style: TextStyle(
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
