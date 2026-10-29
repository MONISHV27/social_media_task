import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media/features/stories/data/entities/story_play_entity.dart';
import 'package:social_media/features/stories/view/widgets/user_story_avatar_widget.dart';
import 'package:social_media/features/stories/view_model/story_view_model.dart';

class StoryListGenerator extends StatelessWidget {
  const StoryListGenerator({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: context.read<StoryViewModel>().storyId.length,
      separatorBuilder: (context, index) => const SizedBox(width: 8.0),
      itemBuilder: (context, index) {
        final StoryPlayEntity storyInfo = context
            .read<StoryViewModel>()
            .storyId[index];
        return Provider<StoryPlayEntity>.value(
          value: storyInfo,
          child: UserStoryAvatarWidget(
            userLabel: 'user ${Random().nextInt(100)}',
            id: context.read<StoryViewModel>().storyId[index].id,
          ),
        );
      },
    );
  }
}
