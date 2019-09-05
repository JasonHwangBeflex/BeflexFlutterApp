import 'package:BeflexFlutterApp/loginPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'widgets/extendedButton.dart';
import 'beflexColorTheme.dart';

String assetPath = 'assets/images/';

class LoginSignupRoute extends CupertinoPageRoute {
  LoginSignupRoute()
      : super(builder: (BuildContext context) => new LoginSignup());

  // OPTIONAL IF YOU WISH TO HAVE SOME EXTRA ANIMATION WHILE ROUTING
  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return new FadeTransition(opacity: animation, child: new LoginSignup());
  }
}

class LoginSignup extends StatefulWidget {
  @override
  _LoginSignupState createState() => _LoginSignupState();
}

class _LoginSignupState extends State<LoginSignup> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: mainBeflexRed,
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
                color: whiteFontColor,
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
            color: whiteBackgroundColor,
            child: Flex(
              direction: Axis.vertical,
              children: <Widget>[
                Container(
                  child: ExtendedButton(context, 'Sign Up', new LoginPageRoute(), ButtonColorEnum.redButton, buttonTypeEnum.popupButton),
                  margin: EdgeInsets.only(bottom: 8),
                ),
                Container(
                  child: ExtendedButton(context, 'Login', new LoginPageRoute(),
                      ButtonColorEnum.whiteButton),
                  margin: EdgeInsets.only(bottom: 8),
                ),
                Container(
                  child: InkWell(
                    child: Text(
                      'Terms / Privacy Policy',
                      style: TextStyle(
                          fontSize: 16,
                          color: mainBeflexRed,
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
