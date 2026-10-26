import 'package:flutter/material.dart';
import 'package:social_media/features/posts/view/widgets/post_widget.dart';
import 'package:social_media/features/stories/view/widgets/story_list_generator.dart';

class HomeContentSection extends StatelessWidget {
  const HomeContentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(child: SizedBox(height: 8.0)),

        const SliverToBoxAdapter(
          child: SizedBox(height: 80, child: StoryListGenerator()),
        ),

        const SliverToBoxAdapter(child: SizedBox(height: 12.0)),

        SliverList.separated(
          itemCount: 10,
          separatorBuilder: (context, index) => SizedBox(width: 8.0),
          itemBuilder: (context, index) {
            return PostWidget();
          },
        ),
      ],
    );
  }
}
