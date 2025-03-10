import 'package:BeflexFlutterApp/widgets/cancelNavInkwell.dart';
import 'package:BeflexFlutterApp/widgets/loginField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'beflexColorTheme.dart';
import 'widgets/extendedButton.dart';

class LoginPageRoute extends CupertinoPageRoute {
  LoginPageRoute() : super(builder: (BuildContext context) => new LoginPage());

  // OPTIONAL IF YOU WISH TO HAVE SOME EXTRA ANIMATION WHILE ROUTING
  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    var begin = Offset(0.0, 1.0);
    var end = Offset.zero;
    var curve = Curves.ease;
    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

    return new SlideTransition(
        position: animation.drive(tween), child: new LoginPage());
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        body: main(context),
      ),
    );
  }
}

Widget main(BuildContext context) {
  return SingleChildScrollView(
    child: Container(
      child: Stack(
        children: <Widget>[MainContent(context), LoginButton(context)],
      ),
    ),
  );
}

Widget MainContent(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    child: Flex(
      direction: Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          child: modalCancelInkwell(context, 'Quit'),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 16),
          child: TitleContentWidget(context),
        ),
        Container(
          child: SocialLoginButton(context, socialButtonType.FaceBookButton),
          margin: EdgeInsets.only(bottom: 12),
        ),
        Container(
          child: SocialLoginButton(context, socialButtonType.GoogleButton),
        ),
        Container(
          margin: EdgeInsets.only(top: 16),
          child: InkWell(
            child: Text(
              'or login with email',
              style: TextStyle(
                fontSize: 13,
                color: blackFontColor,
              ),
            ),
            onTap: () => '',
          ),
        ),
        Container(
          child: LoginBlock(context),
        ),
      ],
    ),
  );
}

// Top Title / subtitle section
Widget TitleContentWidget(context) {
  return Container(
    margin: EdgeInsets.only(top: 25),
    width: MediaQuery.of(context).size.width,
    child: Flex(
      direction: Axis.vertical,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        // Title
        Container(
          margin: EdgeInsets.only(bottom: 6),
          child: Text(
            'Login with Beflex Account',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: blackFontColor,
            ),
          ),
        ),
        // Subtitle
        Container(
          child: Text(
            'Beflex is the creator of Runspect and BiomechEngine.',
            style: TextStyle(
              fontSize: 13,
              color: blackFontColor,
            ),
          ),
        )
      ],
    ),
  );
}

// Email / Password block
Widget LoginBlock(BuildContext context) {
  return Container(
    child: Flex(
      direction: Axis.vertical,
      children: <Widget>[
        Container(
          child: LoginField(context, 'Email'),
          margin: EdgeInsets.only(bottom: 25, top: 20),
        ),
        Container(
          child: LoginField(context, 'Password'),
        ),
      ],
    ),
  );
}

// Bottom login button
Widget LoginButton(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height,
    padding: EdgeInsets.only(bottom: 50),
    child: Flex(
      direction: Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(bottom: 17),
          child: InkWell(
            child: Text(
              'Forgot password?',
              style: TextStyle(
                fontSize: 16,
                color: mainBeflexRed,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () => '',
          ),
        ),
        Container(child: ExtendedButton(context, 'Login', new LoginPageRoute()))
      ],
    ),
  );
}
