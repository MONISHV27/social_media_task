import 'package:flutter/material.dart';

class FieldBorderStyle {
  static const borderStyle = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
    borderSide: BorderSide(
      // color: TextFieldColorSchemePattern.textFieldBorderColor,
    ),
  );

  static const commentFieldStyle = OutlineInputBorder(
    borderSide: BorderSide(
      // color: TextFieldColorSchemePattern.textFieldBorderColor,
    ),
  );
}
