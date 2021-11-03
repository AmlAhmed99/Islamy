import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:islamy/screens/SplashScreen.dart';
import 'package:islamy/layout/home_layout.dart';
import 'package:islamy/screens/hadeesDetails.dart';
import 'package:islamy/screens/moshafDetails.dart';
import 'package:flutter_gen/gen_L10n/app_localizations.dart';
import 'package:islamy/shared/Colors.dart';
import 'package:provider/provider.dart';
import 'package:islamy/providers/AppConfigProvider.dart';

void main() {
  runApp(
      ChangeNotifierProvider<AppConfigProvider>(
    create: (context)=>AppConfigProvider(),
      child: MyApp(),
  ));
}
class AppTheme{

}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute:SplashScreen.SplashScreenRoute,
      theme: ThemeData(
          primarySwatch:Colors.orange,
          appBarTheme: AppBarTheme(
              color:Colors.transparent,
              elevation: 0,
              centerTitle: true,
          iconTheme: IconThemeData(
                color: Appcolors.black,
              ),
              titleTextStyle: TextStyle(
                  color: Appcolors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30
              ),
              backwardsCompatibility: false,
              systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Appcolors.white,
                  statusBarIconBrightness: Brightness.dark
              )
          ),
          textTheme: TextTheme(
            bodyText1: TextStyle(
                color: Appcolors.black,
                fontSize: 25,
              fontWeight: FontWeight.w400
            ),
            bodyText2: TextStyle(
                color: Appcolors.black,
                fontSize: 20,
                fontWeight: FontWeight.normal
            ),
            subtitle1 : TextStyle(
                color: Appcolors.black,
                fontSize: 20,
                fontWeight: FontWeight.normal
            ),
          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
              type: BottomNavigationBarType.fixed,
            backgroundColor:Color.fromRGBO(182, 146, 95, 1.0),
            unselectedItemColor: Colors.white,
            selectedItemColor:Colors.black,
          )
      ),
      darkTheme: ThemeData(
          primarySwatch:Colors.orange,
          appBarTheme: AppBarTheme(
              color:Colors.transparent,
              elevation: 0,
              centerTitle: true,
              iconTheme: IconThemeData(
                color: Appcolors.white,
              ),
              titleTextStyle: TextStyle(
                  color: Appcolors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30
              ),
              backwardsCompatibility: false,
              systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Appcolors.darkblue,
                  statusBarIconBrightness: Brightness.light
              )
          ),
          textTheme: TextTheme(
            bodyText1: TextStyle(
                color: Appcolors.white,
                fontSize: 25,
                fontWeight: FontWeight.w400
            ),
            bodyText2: TextStyle(
                color: Appcolors.white,
                fontSize: 20,
                fontWeight: FontWeight.normal
            ),
            subtitle1 : TextStyle(
                color: Appcolors.secondryColor,
                fontSize: 20,
                fontWeight: FontWeight.normal
            ),
          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Appcolors.darkblue,
            unselectedItemColor: Colors.white,
            selectedItemColor: Appcolors.secondryColor,
          )
      ),
      themeMode:Provider.of<AppConfigProvider>(context).isDark ?ThemeMode.dark:ThemeMode.light,
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
      locale: Locale(Provider.of<AppConfigProvider>(context).appLanguage),


    );
  }
}
