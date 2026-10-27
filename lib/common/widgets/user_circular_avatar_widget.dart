import 'package:flutter/material.dart';
import 'package:social_media/common/theme/color_themes.dart';

class UserCircularAvatar extends StatelessWidget {
  final double radius;
  const UserCircularAvatar({super.key, required this.radius});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(color: ColorTheme.avatarBorderColor, width: 1.5),
        shape: BoxShape.circle,
        // color: Colors.red,
      ),
      child: SizedBox(
        height: radius * 2,
        width: radius * 2,
        child: Icon(Icons.person),
      ),
    );
  }
}
