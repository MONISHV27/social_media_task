import 'package:flutter/material.dart';
import 'package:social_media/common/widgets/user_circular_avatar_widget.dart';

class UserStoryAvatarWidget extends StatelessWidget {
  final String userLabel;
  const UserStoryAvatarWidget({super.key, required this.userLabel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const UserCircularAvatar(radius: 30),

        Text(
          userLabel,
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14.0),
        ),
      ],
    );
  }
}
