import 'package:BeflexFlutterApp/main.dart';
import 'package:flutter/material.dart';

import 'homeScreen.dart';

String assetPath = 'assets/images/';

class LoginSignup extends StatefulWidget {
  @override
  _LoginSignupState createState() => _LoginSignupState();
}

class _LoginSignupState extends State<LoginSignup> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: mainColor,
      home: new Scaffold(
        body: loginSignupBackGround(context),
      ),
    );
  }
}

Widget loginSignupBackGround(BuildContext context) {
  return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: new BoxDecoration(
        image: new DecorationImage(
            image: new AssetImage(assetPath + 'StartImage.png'),
            fit: BoxFit.fill),
      ),
      child: Stack(
        children: <Widget>[
          mainTitle(),
          bottomButton(context),
        ],
      ));
}

Widget mainTitle() {
  return Flex(
    direction: Axis.vertical,
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Stack(
        children: <Widget>[
          Container(
            child: Image(
              width: 240,
              fit: BoxFit.cover,
              image: AssetImage(assetPath + 'initializingpageRunspectlogo.png'),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 35, top: 55),
            child: Text(
              'Analyze your running form and injury risk',
              style: TextStyle(
                color: fontColor,
                fontSize: 14,
              ),
            ),
          )
        ],
      )
    ],
  );
}

Widget bottomButton(BuildContext context) {
  return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Flex(
        direction: Axis.vertical,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(top: 18),
            color: mainBackgroundColor,
            child: Flex(
              direction: Axis.vertical,
              children: <Widget>[
                Container(
                  child: ExtendedButton(context, 'Sign Up', ''),
                  margin: EdgeInsets.only(bottom: 8),
                ),
                Container(
                  child: ExtendedButton(
                      context, 'Login', '', ButtonTypeEnum.whiteButton),
                  margin: EdgeInsets.only(bottom: 8),
                ),
                Container(
                  child: InkWell(
                    child: Text(
                      'Terms / Privacy Policy',
                      style: TextStyle(
                          fontSize: 16,
                          color: mainColor,
                          fontWeight: FontWeight.bold),
                    ),
                    onTap: () => 'Terms privacy',
                  ),
                  margin: EdgeInsets.only(bottom: 33, top: 15),
                )
              ],
            ),
          )
        ],
      ));
}
