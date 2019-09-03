import 'package:BeflexFlutterApp/homeScreen.dart';
import 'package:BeflexFlutterApp/loginSignupPage.dart';
import 'package:flutter/material.dart';

import 'main.dart';

Color fbColor = Color.fromRGBO(62, 73, 168, 1);
Color ggColor = Color.fromRGBO(92, 92, 92, 1);

enum socialButtonType { FaceBookButton, GoogleButton }

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
        body: MainContent(context),
      ),
    );
  }
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
                color: Colors.black,
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

Widget LoginBlock(BuildContext context) {
  return Container(
    child: Flex(
      direction: Axis.vertical,
      children: <Widget>[
        Container(
          child: LoginTextField(context, 'Email'),
          margin: EdgeInsets.only(bottom: 25, top: 20),
        ),
        Container(
          child: LoginTextField(context, 'Password'),
        ),
      ],
    ),
  );
}

Widget TitleContentWidget(context) {
  return Container(
    margin: EdgeInsets.only(top: 60),
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
              color: Colors.black,
            ),
          ),
        ),
        // Subtitle
        Container(
          child: Text(
            'Beflex is the creator of Runspect and BiomechEngine.',
            style: TextStyle(
              fontSize: 13,
              color: Colors.black,
            ),
          ),
        )
      ],
    ),
  );
}

Widget SocialLoginButton(BuildContext context, socialButtonType socialName) {
  String buttonString(socialName) {
    switch (socialName) {
      case socialButtonType.FaceBookButton:
        return 'Login with FaceBook';
      case socialButtonType.GoogleButton:
        return 'Login with Google';
      default:
        return '';
    }
  }

  Color buttonColor(socialName) {
    switch (socialName) {
      case socialButtonType.FaceBookButton:
        return fbColor;
      case socialButtonType.GoogleButton:
        return Colors.white;
      default:
        return Colors.transparent;
    }
  }

  Color buttonTextColor(socialName) {
    switch (socialName) {
      case socialButtonType.FaceBookButton:
        return Colors.white;
      case socialButtonType.GoogleButton:
        return ggColor;
      default:
        return Colors.transparent;
    }
  }

  Color buttonBorderColor(socialName) {
    switch (socialName) {
      case socialButtonType.FaceBookButton:
        return Colors.transparent;
      case socialButtonType.GoogleButton:
        return ggColor;
      default:
        return Colors.transparent;
    }
  }

  String socialIconPath(socialName) {
    switch (socialName) {
      case socialButtonType.FaceBookButton:
        return assetPath + 'Facebook.png';
      case socialButtonType.GoogleButton:
        return assetPath + 'Google.png';
      default:
        return assetPath + 'Facebook.png';
    }
  }

  return new Container(
    width: MediaQuery.of(context).size.width - 32,
    child: ButtonTheme(
      minWidth: MediaQuery.of(context).size.width - 32,
      height: 52,
      child: FlatButton(
        color: buttonColor(socialName),
        onPressed: () => '',
        child: Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Image(
                image: AssetImage(socialIconPath(socialName)),
              ),
            ),
            Container(
              child: Text(
                buttonString(socialName),
                style: TextStyle(
                  fontSize: 18,
                  color: buttonTextColor(socialName),
                ),
              ),
            )
          ],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(50.0),
          side: BorderSide(color: buttonBorderColor(socialName), width: 2),
        ),
      ),
    ),
  );
}

Widget LoginTextField(BuildContext context, String labelText) {
  return Container(
    width: MediaQuery.of(context).size.width - 32,
    child: TextField(
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: new TextStyle(color: Colors.black, fontSize: 16),
        enabledBorder: UnderlineInputBorder(
            borderSide: new BorderSide(
          color: Colors.grey,
        )),
        focusedBorder: UnderlineInputBorder(
            borderSide: new BorderSide(
          color: mainColor,
        )),
      ),
    ),
  );
}
