import 'dart:ui' as prefix0;

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'loginSignupPage.dart';
import 'widgets/extendedButton.dart';
import 'beflexColorTheme.dart';
import 'main.dart';

class HomeScreenRoute extends CupertinoPageRoute {
  HomeScreenRoute()
      : super(builder: (BuildContext context) => new HomeScreen());

  // OPTIONAL IF YOU WISH TO HAVE SOME EXTRA ANIMATION WHILE ROUTING
  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return new FadeTransition(opacity: animation, child: new HomeScreen());
  }
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
      color: whiteBackgroundColor,
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
        child: ExtendedButton(context, 'Continue', new LoginSignupRoute()),
        margin: EdgeInsets.only(bottom: 32),
      )
    ],
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
