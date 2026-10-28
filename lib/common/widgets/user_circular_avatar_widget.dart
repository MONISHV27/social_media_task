import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:social_media/common/constants/spacing_constants.dart';
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
      child: Padding(
        padding: EdgeInsetsGeometry.all(SpacingConstants.avatarSpacing),
        child: CircleAvatar(
          radius: radius - SpacingConstants.avatarSpacing,
          backgroundColor: Color.fromARGB(255, 245, 245, 245),
          child: SizedBox(
            // height: radius * 2,
            // width: radius * 2,
            child: Icon(Icons.person),
          ),
        ),
      ),
    );
  }
}

class CircularAvatarLoading extends StatelessWidget {
  final double radius;
  const CircularAvatarLoading({super.key, required this.radius});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.all(SpacingConstants.avatarSpacing),
      child: DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          // color: Colors.red,
        ),
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: radius - SpacingConstants.avatarSpacing,

          child: ClipOval(
            clipBehavior: Clip.hardEdge,
            child: BackdropFilter(
              filter: ui.ImageFilter.blur(sigmaX: 0.5, sigmaY: 0.5),

              child: SpinKitCircle(
                color: Colors.grey,
                size: (radius - SpacingConstants.avatarSpacing),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
