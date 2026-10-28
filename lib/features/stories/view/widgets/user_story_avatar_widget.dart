import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:social_media/common/widgets/user_circular_avatar_widget.dart';
import 'package:social_media/core/user_manager/current_user_provider.dart';
import 'package:social_media/features/stories/data/entities/story_entity.dart';
import 'package:social_media/features/stories/view/screen/story_screen.dart';
import 'package:social_media/features/stories/view_model/story_view_model.dart';

class UserStoryAvatarWidget extends StatelessWidget {
  final VoidCallback? onView;
  final String userLabel;
  final bool isUpload;
  final String id;
  const UserStoryAvatarWidget({
    super.key,
    required this.userLabel,
    this.isUpload = false,
    this.onView,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            GestureDetector(
              onTap: () async {
                if (context.read<StoryViewModel>().state
                    is AvatarLoadingState) {
                  return;
                }
                final userInstance = context.read<CurrentUser>();
                final String path = context
                    .read<StoryViewModel>()
                    .storyId
                    .firstWhere((e) => e.id == id)
                    .path;
                final StoryEntity? entity = await context
                    .read<StoryViewModel>()
                    .getStory(userInstance.userId, id);

                if (!context.mounted) return;
                if (entity != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MultiProvider(
                        providers: [
                          Provider<CurrentUser>.value(value: userInstance),
                          Provider<StoryEntity>.value(value: entity),
                          Provider<String>.value(value: path),
                        ],
                        child: const StoryScreen(),
                      ),
                    ),
                  );
                }
              },
              child: const UserCircularAvatar(radius: 30),
            ),
            if (isUpload)
              const PhysicalModel(
                color: Colors.blue,
                shape: BoxShape.circle,
                child: Icon(Icons.add, size: 15, color: Colors.white),
              ),
            if (id.isNotEmpty)
              Positioned.fill(
                child: Center(
                  child: ValueListenableBuilder(
                    valueListenable: context
                        .read<StoryViewModel>()
                        .stateNotifier,
                    builder: (context, value, child) {
                      if (value is AvatarLoadingState && value.id == id) {
                        return CircularAvatarLoading(radius: 30);
                      }

                      return SizedBox.shrink();
                    },
                  ),
                ),
              ),
          ],
        ),

        Text(
          userLabel,
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14.0),
        ),
      ],
    );
  }
}
