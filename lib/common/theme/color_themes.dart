import 'package:flutter/painting.dart';

class ColorTheme {
  static const Color borderColor = Color(0xFFE2E8F0);
  static const Color avatarBorderColor = Color.fromARGB(255, 243, 78, 133);
  static const Color storyInteractionIconColor = Color.fromARGB(
    255,
    247,
    247,
    247,
  );
  static const Color textFieldLabelColor = Color(0xFF868f96);
  static const Color iconSecondary = Color(0xFFb8c9e1);
  static const LinearGradient buttonColor = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFFF5F6D), Color(0XFFFFc371)],
  );
  static const LinearGradient authHeaderColor = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0XFFEF629A), Color(0XFFEECDA1)],
  );
}
