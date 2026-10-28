import 'package:flutter/material.dart';
import 'package:social_media/common/theme/color_themes.dart';

class TextFieldLabelWidget extends StatelessWidget {
  final String text;
  const TextFieldLabelWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: ColorTheme.textFieldLabelColor,
      ),
    );
  }
}
