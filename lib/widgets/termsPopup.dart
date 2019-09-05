import 'package:flutter/material.dart';
import '../beflexColorTheme.dart';
import '../loginPage.dart';
import 'extendedButton.dart';

Widget termsMain(BuildContext context) {
  return Container(
    child: Stack(
      children: <Widget>[
        TermsPopup(context),
      ],
    ),
  );
}

Widget TermsPopup(BuildContext context) {
  return Container(
    child: AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(12.0),
      ),
      content: Container(
        height: MediaQuery.of(context).size.height - 325,
        child: Stack(
            children: <Widget>[agreeButton(context), termsContent(context)]),
      ),
    ),
  );
}

Widget termsContent(context) {
  return Flex(
      direction: Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          child: popupModalCancelInkwell(context, 'Cancel'),
        ),
        Container(
          child: popupTitle(),
          margin: EdgeInsets.only(bottom: 31),
        ),
        Container(child: termsBundle(context)),
      ]);
}

Widget agreeButton(BuildContext context) {
  return Container(
    child: Flex(
      direction: Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
            child: ExtendedButton(
                context,
                'Agree and Sign up',
                new LoginPageRoute(),
                ButtonColorEnum.redButton,
                buttonTypeEnum.navigationButton)),
      ],
    ),
  );
}

Widget popupTitle() {
  return Container(
    child: Flex(
      direction: Axis.vertical,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(bottom: 8, top: 30),
          child: Text(
            'Agree to our terms',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          child: Text(
            'By signing up, you are acknowledging that you have read and agree to the following terms',
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    ),
  );
}

Widget termsBundle(BuildContext context) {
  return Container(
    child: Flex(
      direction: Axis.vertical,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(bottom: 24),
          child: termsInkwell(context, 'Terms & Conditions'),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 24),
          child: termsInkwell(context, 'Privacy Policy'),
        ),
        Container(
          child: termsInkwell(context, 'Personal Information Agreement'),
        )
      ],
    ),
  );
}

Widget termsInkwell(BuildContext context, String labelText) {
  return Container(
      margin: EdgeInsets.only(top: 14),
      child: Flex(
        direction: Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          InkWell(
            child: Text(
              labelText,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: mainBeflexRed,
              ),
            ),
            onTap: () => {},
          ),
        ],
      ));
}

Widget popupModalCancelInkwell(BuildContext context, String labelText) {
  return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(top: 14),
      child: Flex(
        direction: Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          InkWell(
            child: Text(
              labelText,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: mainBeflexRed,
              ),
            ),
            onTap: () => Navigator.of(context).pop(),
          ),
        ],
      ));
}
