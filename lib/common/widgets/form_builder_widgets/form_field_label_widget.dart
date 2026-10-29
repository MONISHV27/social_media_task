import 'package:flutter/material.dart';
import 'package:social_media/common/theme/color_themes.dart';

class FormFieldLabelWidget extends StatelessWidget {
  final String text;
  const FormFieldLabelWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        color: ColorTheme.textFieldLabelColor,
      ),
    );
  }
}
