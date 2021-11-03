
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:islamy/shared/Colors.dart';
import 'package:provider/provider.dart';
import 'package:islamy/providers/AppConfigProvider.dart';
import 'package:flutter_gen/gen_L10n/app_localizations.dart';
import 'package:islamy/providers/AppConfigProvider.dart';
class ShowModeItem extends StatefulWidget {

  @override
  _ShowModeItemState createState() => _ShowModeItemState();
}

class _ShowModeItemState extends State<ShowModeItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
          height: 60,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(AppLocalizations.of(context).modes,style: TextStyle(
                    color: Appcolors.black,
                    fontSize: 20
                ),),
                Icon(Icons.arrow_drop_down)
              ],
            ),
          )),
      onTap: () {
        showLanguageButtomSheet(AppLocalizations.of(context).light,AppLocalizations.of(context).dark);
      },
    );
  }

  void showLanguageButtomSheet(text1,text2){
    showModalBottomSheet(
        context: context,
        builder: (context){
          return Container(
            child: ConditionalBuilder(
              condition: Provider.of<AppConfigProvider>(context).isDark==true ,
              builder: (context){
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DarkItem(text2,Appcolors.secondryColor),
                    lightItem(text1,Appcolors.black)
                  ],
                );
              },
              fallback: (context){
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DarkItem(text2,Appcolors.black),
                    lightItem(text1,Appcolors.secondryColor)
                  ],
                );
              } ,
            ),
          );

        }
    );
  }

  Widget lightItem(text1,Color color){
    return Row(
      children: [
        TextButton(
          onPressed: (){
            Provider.of<AppConfigProvider>(context,listen: false).changeLightMode();
          },
          child: Text(text1,style: TextStyle(
            color: color,
          ),),
        ),

      ],
    );
  }

  Widget DarkItem(text2,Color color){
    return TextButton(
      onPressed: (){
        Provider.of<AppConfigProvider>(context,listen: false).changeDarkMode();
      },
      child: Text(text2,style: TextStyle(
        color: color,
      ),),
    );
  }
}
