import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:social_media/common/constants/spacing_constants.dart';
import 'package:social_media/common/theme/color_themes.dart';

class UserCircularAvatar extends StatelessWidget {
  final double radius;
  final String? imgUrl;
  const UserCircularAvatar({
    super.key,
    required this.radius,
    required this.imgUrl,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(color: ColorTheme.avatarBorderColor, width: 1.5),
        shape: BoxShape.circle,
      ),
      child: Padding(
        padding: EdgeInsetsGeometry.all(SpacingConstants.avatarSpacing),
        child: ClipOval(
          child: CircleAvatar(
            radius: radius - SpacingConstants.avatarSpacing,
            backgroundColor: Color(0xFFfdfcfb),
            child: SizedBox(
              child: imgUrl != null
                  ? Image.asset(imgUrl ?? '')
                  : Icon(
                      Icons.person_2_rounded,
                      color: ColorTheme.iconSecondary,
                    ),
            ),
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
        decoration: BoxDecoration(shape: BoxShape.circle),
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: radius - SpacingConstants.avatarSpacing,

          child: ClipOval(
            clipBehavior: Clip.hardEdge,
            child: BackdropFilter(
              filter: ui.ImageFilter.blur(sigmaX: 1.2, sigmaY: 1.2),
              child: SpinKitRing(
                lineWidth: 2.0,
                color: ColorTheme.avatarBorderColor,
                size: (radius - SpacingConstants.avatarSpacing) * 2,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
