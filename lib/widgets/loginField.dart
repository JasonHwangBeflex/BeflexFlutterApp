import 'package:flutter/material.dart';
import '../beflexColorTheme.dart';

Widget LoginField(BuildContext context, String labelText) {
  return Container(
    width: MediaQuery.of(context).size.width - 32,
    child: TextField(
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: new TextStyle(color: blackFontColor, fontSize: 16),
        enabledBorder: UnderlineInputBorder(
            borderSide: new BorderSide(
          color: Colors.grey,
        )),
        focusedBorder: UnderlineInputBorder(
            borderSide: new BorderSide(
          color: mainBeflexRed,
        )),
      ),
    ),
  );
}
