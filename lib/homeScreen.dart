import 'dart:ui' as prefix0;

import 'package:flutter/material.dart';

import 'main.dart';

Color mainBackgroundColor = Colors.white;

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
    return new Scaffold(
      backgroundColor: mainBackgroundColor,
      body: new Center(
        child: GrantPermissionBody(context),
      ),
    );
  }
}

Widget GrantPermissionBody(BuildContext context) {
  return new Flex(
    direction: Axis.vertical,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Container(
        child: Text(
            'Please grant the following permissions to fully use our features.',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            )),
        margin: EdgeInsets.only(left: 16, right: 16, top: 200),
      ),
      contentBundle(),
      ExtendedButton(context)
    ],
  );
}

Widget ExtendedButton(BuildContext context) {
  void onPressedEvent() {}

  return new Container(
    child: ButtonTheme(
      minWidth: MediaQuery.of(context).size.width - 32,
      height: 52,
      child: RaisedButton(
        onPressed: () => onPressedEvent(),
        child: Text(
          'Continue',
          style: TextStyle(
            fontSize: 18,
            color: mainBackgroundColor,
          ),
        ),
        color: mainColor,
        shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(50.0)),
      ),
    ),
    margin: EdgeInsets.only(bottom: 32),
  );
}

Widget contentBundle() {
  return new Flex(
    direction: Axis.vertical,
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      GrantPermissonContent('assets/images/getpermissionpageLocation.png',
          'Location', 'To track your running activity such as distance.'),
      GrantPermissonContent(
          'assets/images/getpermissionpageAlert.png',
          'Notification (Optional)',
          'Receive notices and alerts about your run.'),
    ],
  );
}

Widget GrantPermissonContent(
    String imagePath, String titleText, String contentText) {
  return new Flex(
    direction: Axis.horizontal,
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
      )
    ],
  );
}
