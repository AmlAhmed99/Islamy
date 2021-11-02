import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_L10n/app_localizations.dart';
import 'package:islamy/shared/ShowLanguageItem.dart';
class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ShowLanguageItem(),
        SizedBox(
          height: 50,
        ),
        InkWell(
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
                    Text(AppLocalizations.of(context).modes),
                    Icon(Icons.arrow_drop_down)
                  ],
                ),
              )),
          onTap: () {

          },
        ),

      ],
    );
  }

}
