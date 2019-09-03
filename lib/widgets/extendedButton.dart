import 'package:flutter/material.dart';
import '../beflexColorTheme.dart';
import '../loginSignupPage.dart';

enum ButtonTypeEnum {
  redButton,
  whiteButton,
}

enum socialButtonType { FaceBookButton, GoogleButton }

// Normal Extended button
Widget ExtendedButton(BuildContext context, String buttonText, String navPath,
    [ButtonTypeEnum buttonType]) {
  void onPressedEvent(navPath) {
    Navigator.of(context).pushNamed(navPath);
  }

  Color buttonColor(buttonType) {
    switch (buttonType) {
      case ButtonTypeEnum.redButton:
        return mainBeflexRed;
      case ButtonTypeEnum.whiteButton:
        return Colors.white;
      default:
        return mainBeflexRed;
    }
  }

  Color buttonTextColor(buttonType) {
    switch (buttonType) {
      case ButtonTypeEnum.redButton:
        return whiteBackgroundColor;
      case ButtonTypeEnum.whiteButton:
        return mainBeflexRed;
      default:
        return whiteBackgroundColor;
    }
  }

  Color buttonBorderColor(buttonType) {
    switch (buttonType) {
      case ButtonTypeEnum.redButton:
        return transparent;
      case ButtonTypeEnum.whiteButton:
        return mainBeflexRed;
      default:
        return transparent;
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

// Icon Extended button
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
        return faceBookButtonColor;
      case socialButtonType.GoogleButton:
        return whiteBackgroundColor;
      default:
        return transparent;
    }
  }

  Color buttonTextColor(socialName) {
    switch (socialName) {
      case socialButtonType.FaceBookButton:
        return whiteFontColor;
      case socialButtonType.GoogleButton:
        return googleButtonColor;
      default:
        return transparent;
    }
  }

  Color buttonBorderColor(socialName) {
    switch (socialName) {
      case socialButtonType.FaceBookButton:
        return transparent;
      case socialButtonType.GoogleButton:
        return googleButtonColor;
      default:
        return transparent;
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
