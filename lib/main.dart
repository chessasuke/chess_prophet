import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'screens/about_screen.dart';
import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';
import 'screens/screen_manager.dart';
import 'screens/rating_calculator.dart';
import 'screens/norm_calculator1.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
// TODO: uncomment the line below after codegen
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return DynamicTheme(
      defaultBrightness: Brightness.dark,
      data: (brightness) {
        return brightness == Brightness.dark
            ? ThemeData(
                backgroundColor: Colors.black,
                primarySwatch: Colors.blueGrey,
                accentColor: Colors.green,
                primaryTextTheme: TextTheme(
                  // title
                  headline6: TextStyle(
                      fontSize: 42.0,
                      color: Colors.white,
                      fontFamily: 'ScopeOne'),
                  headline5: TextStyle(
                      fontSize: 34.0,
                      color: Colors.white,
                      fontFamily: 'ScopeOne'), // body text
                  bodyText1: TextStyle(fontSize: 26.0, color: Colors.white),
                  bodyText2: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
                brightness: brightness,
              )
            : ThemeData(
                backgroundColor: Colors.white,
                primarySwatch: Colors.blueGrey,
                accentColor: Colors.redAccent,
                primaryTextTheme: TextTheme(
                  // title
                  headline6: TextStyle(
                      fontSize: 42.0,
                      color: Colors.black,
                      fontFamily: 'ScopeOne'),
                  headline5: TextStyle(
                      fontSize: 34.0,
                      color: Colors.black,
                      fontFamily: 'ScopeOne'), // body text
                  bodyText1: TextStyle(fontSize: 28.0, color: Colors.black),
                  bodyText2: TextStyle(fontSize: 22.0, color: Colors.black),
                ),
                brightness: brightness,
              );
      },
      themedWidgetBuilder: (context, data) => MaterialApp(
        localizationsDelegates: [
          // ... app-specific localization delegate[s] here
          // TODO: uncomment the line below after codegen
          // AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('en', ''), // English, no country code
          const Locale('ar', ''), // Arabic, no country code
          const Locale.fromSubtags(
              languageCode: 'zh'), // Chinese *See Advanced Locales below*
          // ... other locales the app supports
        ],
        theme: data,
        debugShowCheckedModeBanner: false, //the initial screen of the app
        home: ScreenManager(child: WelcomeScreen()),
        routes: {
          WelcomeScreen.id: (context) => WelcomeScreen(),
          ScreenManager.id: (context) => ScreenManager(),
          NormCalculator1.id: (context) => NormCalculator1(),
          RatingCalculator.id: (context) => RatingCalculator(),
          AboutScreen.id: (context) => AboutScreen(),
        },
      ),
    );
  }
}
