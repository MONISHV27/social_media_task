import 'package:flutter/material.dart';
import 'package:social_media/features/stories/view/widgets/user_story_avatar_widget.dart';

class StoryListGenerator extends StatelessWidget {
  const StoryListGenerator({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: 8,
      separatorBuilder: (context, index) => const SizedBox(width: 8.0),
      itemBuilder: (context, index) {
        return UserStoryAvatarWidget(userLabel: 'Moni');
      },
    );
  }
}
