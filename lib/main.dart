import 'dart:async';

import 'package:BeflexFlutterApp/beflexColorTheme.dart';
import 'package:BeflexFlutterApp/loginPage.dart';
import 'package:BeflexFlutterApp/loginSignupPage.dart';
import 'package:flutter/material.dart';
import 'package:BeflexFlutterApp/homeScreen.dart';

void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: new SplashScreen(),
    routes: <String, WidgetBuilder>{
      '/HomeScreen': (BuildContext context) => new HomeScreen(),
      '/LoginSignup': (BuildContext context) => new LoginSignup(),
      '/LoginPage': (BuildContext context) => new LoginPage(),
    },
  ));
}

// Splash Screen
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed('/HomeScreen');
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: mainBeflexRed,
      body: new Flex(
        direction: Axis.vertical,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            child: Center(
                child: Image(
              image:
                  AssetImage('assets/images/initializingpageRunspectlogo.png'),
            )),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 60),
            child: Image(
              image: AssetImage('assets/images/White.png'),
            ),
          )
        ],
      ),
    );
  }
}
