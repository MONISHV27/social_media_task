import 'package:flutter/material.dart';
import 'package:social_media/features/posts/view/widgets/post_list_generator.dart';
import 'package:social_media/features/stories/view/widgets/story_list_generator.dart';
import 'package:social_media/features/stories/view/widgets/user_story_avatar_widget.dart';

class HomeContentSection extends StatelessWidget {
  const HomeContentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(child: SizedBox(height: 8.0)),

        const SliverToBoxAdapter(
          child: SizedBox(
            height: 80,
            child: Padding(
              padding: EdgeInsets.only(left: 14.0),
              child: Row(
                children: [
                  UserStoryAvatarWidget(
                    userLabel: 'your story',
                    isUpload: true,
                  ),

                  SizedBox(width: 8.0),
                  Expanded(child: StoryListGenerator()),
                ],
              ),
            ),
          ),
        ),

        const SliverToBoxAdapter(child: SizedBox(height: 12.0)),

        const PostListGenerator(),
      ],
    );
  }
}
