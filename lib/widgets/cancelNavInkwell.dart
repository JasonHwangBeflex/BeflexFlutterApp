import 'package:flutter/material.dart';
import '../beflexColorTheme.dart';

Widget modalCancelInkwell(BuildContext context, String labelText) {
  return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(top: 50, right: 15),
      child: Flex(
        direction: Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          InkWell(
            child: Text(
              labelText,
              style: TextStyle(
                fontSize: 20,
                color: mainBeflexRed,
              ),
            ),
            onTap: () => Navigator.of(context).pop(),
          ),
        ],
      ));
}
