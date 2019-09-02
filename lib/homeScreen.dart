import 'dart:ui' as prefix0;

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'main.dart';

Color mainBackgroundColor = Colors.white;

enum ButtonTypeEnum {
  redButton,
  whiteButton,
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _pressed = false;

  void _isPressed() {
    setState(() {
      _pressed = !_pressed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      color: mainBackgroundColor,
      home: new Scaffold(
        body: GrantPermissionBody(context),
      ),
    );
  }
}

Widget mainContent() {
  return new Container(
    child: Flex(
      direction: Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Container(
          child: Text(
              'Please grant the following permissions to fully use our features.',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              )),
          margin: EdgeInsets.only(left: 16, right: 16, bottom: 22, top: 200),
        ),
        contentBundle(),
      ],
    ),
  );
}

Widget GrantPermissionBody(BuildContext context) {
  return new Flex(
    direction: Axis.vertical,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      mainContent(),
      Container(
        child: ExtendedButton(context, 'Continue', '/LoginSignup'),
        margin: EdgeInsets.only(bottom: 32),
      )
    ],
  );
}

Widget ExtendedButton(BuildContext context, String buttonText, String navPath,
    [ButtonTypeEnum buttonType]) {
  void onPressedEvent(navPath) {
    Navigator.of(context).pushReplacementNamed(navPath);
  }

  Color buttonColor(buttonType) {
    switch (buttonType) {
      case ButtonTypeEnum.redButton:
        return mainColor;
      case ButtonTypeEnum.whiteButton:
        return Colors.white;
      default:
        return mainColor;
    }
  }

  Color buttonTextColor(buttonType) {
    switch (buttonType) {
      case ButtonTypeEnum.redButton:
        return mainBackgroundColor;
      case ButtonTypeEnum.whiteButton:
        return mainColor;
      default:
        return mainBackgroundColor;
    }
  }

  Color buttonBorderColor(buttonType) {
    switch (buttonType) {
      case ButtonTypeEnum.redButton:
        return Colors.transparent;
      case ButtonTypeEnum.whiteButton:
        return mainColor;
      default:
        return Colors.transparent;
    }
  }

  return new Container(
    child: ButtonTheme(
      minWidth: MediaQuery.of(context).size.width - 32,
      height: 52,
      child: FlatButton(
        color: buttonColor(buttonType),
        onPressed: () => onPressedEvent(navPath),
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: 18,
            color: buttonTextColor(buttonType),
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(50.0),
          side: BorderSide(color: buttonBorderColor(buttonType), width: 2),
        ),
      ),
    ),
  );
}

Widget contentBundle() {
  return new Container(
    margin: EdgeInsets.only(
      left: 20,
      top: 22,
    ),
    child: Flex(
      direction: Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        GrantPermissonContent('assets/images/getpermissionpageLocation.png',
            'Location', 'To track your running activity such as distance.'),
        GrantPermissonContent(
            'assets/images/getpermissionpageAlert.png',
            'Notification (Optional)',
            'Receive notices and alerts about your run.'),
      ],
    ),
  );
}

Widget GrantPermissonContent(
    String imagePath, String titleText, String contentText) {
  return new Container(
    margin: EdgeInsets.only(bottom: 24),
    child: Flex(
      direction: Axis.horizontal,
      children: <Widget>[
        Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image(
              image: AssetImage(imagePath),
            ),
            Container(
              margin: EdgeInsets.only(left: 27),
              child: Flex(
                direction: Axis.vertical,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Text(
                      titleText,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    margin: EdgeInsets.only(bottom: 6),
                  ),
                  Container(
                      child: Text(
                    contentText,
                    style: TextStyle(fontSize: 13, color: Colors.black),
                  ))
                ],
              ),
            )
          ],
        ),
      ],
    ),
  );
}
