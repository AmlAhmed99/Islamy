import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_L10n/app_localizations.dart';
import 'package:islamy/shared/ShowLanguageItem.dart';
import 'package:islamy/shared/ShowModeItem.dart';
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
        ShowModeItem(),

      ],
    );
  }

}
