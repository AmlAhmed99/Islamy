import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:islamy/screens/SplashScreen.dart';
import 'package:islamy/layout/home_layout.dart';
import 'package:islamy/screens/hadeesDetails.dart';
import 'package:islamy/screens/moshafDetails.dart';
import 'package:flutter_gen/gen_L10n/app_localizations.dart';


void main() {
  runApp(MyApp());
}
class AppTheme{
 static Color primaryColor=Color.fromRGBO(182, 146, 95, 1.0);
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute:Home.HomeRoute,
     theme: ThemeData(
       primaryColor: AppTheme.primaryColor,
       appBarTheme: AppBarTheme(
         color:  Colors.transparent,
       )
     ),
     routes: {
       SplashScreen.SplashScreenRoute:(context)=>SplashScreen(),
       Home.HomeRoute:(context)=>Home(),
       HadeesDetails.HadeesDetailsRoute:(context)=>HadeesDetails(),
       MoshafDetails.MoshafDetailsRoute:(context)=>MoshafDetails(),
     },
      debugShowCheckedModeBanner: false,

      localizationsDelegates: [
        AppLocalizations.delegate, // Add this line
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale('ar'),


    );
  }
}
