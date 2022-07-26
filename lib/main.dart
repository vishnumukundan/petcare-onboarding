import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:petcare_onboarding/constants.dart';
import 'package:petcare_onboarding/onboarding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: kColorPrimary,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: kColorPrimary,
      systemNavigationBarIconBrightness: Brightness.light,
    ));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Montserrat'),
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark(),
      home: ScreenOnboarding(),
    );
  }
}
