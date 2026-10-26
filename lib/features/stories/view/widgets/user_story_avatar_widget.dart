import 'package:flutter/material.dart';
import 'package:social_media/common/widgets/user_circular_avatar_widget.dart';

class UserStoryAvatarWidget extends StatelessWidget {
  final String userLabel;
  final bool isUpload;
  const UserStoryAvatarWidget({
    super.key,
    required this.userLabel,
    this.isUpload = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            const UserCircularAvatar(radius: 30),
            if (isUpload)
              PhysicalModel(
                color: Colors.blue,
                shape: BoxShape.circle,
                child: Icon(Icons.add, size: 15, color: Colors.white),
              ),
          ],
        ),

        Text(
          userLabel,
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14.0),
        ),
      ],
    );
  }
}
