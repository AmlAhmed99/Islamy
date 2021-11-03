import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamy/main.dart';
import 'package:flutter_gen/gen_L10n/app_localizations.dart';
import 'package:islamy/providers/AppConfigProvider.dart';
import 'package:islamy/shared/Colors.dart';
import 'package:provider/provider.dart';
class HadeesDetails extends StatefulWidget {
  static const HadeesDetailsRoute = 'HadeesDetailsRoute';

  @override
  _HadeesDetailsState createState() => _HadeesDetailsState();
}

class _HadeesDetailsState extends State<HadeesDetails> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var data = ModalRoute.of(context).settings.arguments as Data;
    if(verses.isEmpty)
       ReadHadeesFile(data.index);
    return SafeArea(
      child: Stack(
        alignment: Alignment.center,
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
            appBar: AppBar(
              title: Text(
                AppLocalizations.of(context).app_title,
            ),
            ),
            body:   Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 300,
                    height: 500,
                    decoration: BoxDecoration(
                      color:  Provider.of<AppConfigProvider>(context).isDark==true ?
                      Appcolors.darkblue
                      :Appcolors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        Text(
                          data.HadeesHeader,
                          style:Theme.of(context).textTheme.subtitle1,
                        ),
                        Divider(
                          thickness: 2,
                          color: Appcolors.primaryColor,
                        ),
                        verses.isEmpty
                            ? Center(
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                                Appcolors.primaryColor),
                          ),
                        )
                            : Expanded(
                          child: ListView.builder(
                              itemCount: verses.length,
                              itemBuilder: (ctx, idx) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  verses[idx],
                                 style:Theme.of(context).textTheme.subtitle1,
                                  textAlign: TextAlign.center,
                                  textDirection: TextDirection.rtl,
                                ),
                              )),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void ReadHadeesFile(int index) async {
    String fileContent =
        await rootBundle.loadString('assets/files/hadeth/h${index + 1}.txt');
    List<String> ayat = fileContent.split('\n');
    for (int i = 0; i < ayat.length; i++)
      this.verses = ayat;

    setState(() {});
  }
}

class Data {
  String HadeesHeader;
  int index;
  Data(this.HadeesHeader, this.index);
}
