import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_classifiedappclone/UI/Widgets/splash_screen.dart';
import 'package:flutter_classifiedappclone/UI/screens/main_ui.dart';
import 'package:flutter_classifiedappclone/theme.dart';
import 'package:flutter_classifiedappclone/ui/screens/sign_in/sign_in_screen.dart';
import 'constants.dart';




void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'Super App',
      theme:  theme(),
      routes: <String, WidgetBuilder>{
        MAIN_UI: (BuildContext context) => MainUI(),
        SPLASH_SCREEN: (BuildContext context) => AnimatedSplashScreen(),
        SIGN_IN: (BuildContext context) => SignInScreen(),

      },
      initialRoute: SPLASH_SCREEN,
    );
  }
}
