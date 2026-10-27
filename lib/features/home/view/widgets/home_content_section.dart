import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media/core/user_manager/current_user_provider.dart';
import 'package:social_media/features/posts/view/widgets/post_list_generator.dart';
import 'package:social_media/features/stories/data/repository/story_repository.dart';
import 'package:social_media/features/stories/data/repository_impl/story_repository_impl.dart';
import 'package:social_media/features/stories/data/services/story_service.dart';
import 'package:social_media/features/stories/view/widgets/story_list_generator.dart';
import 'package:social_media/features/stories/view/widgets/user_story_avatar_widget.dart';
import 'package:social_media/features/stories/view_model/story_view_model.dart';

class HomeContentSection extends StatelessWidget {
  const HomeContentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(child: SizedBox(height: 8.0)),

        SliverToBoxAdapter(
          child: SizedBox(
            height: 80,
            child: Padding(
              padding: const EdgeInsets.only(left: 14.0),
              child: Row(
                children: [
                  const UserStoryAvatarWidget(
                    id: '',
                    userLabel: 'your story',
                    isUpload: true,
                  ),

                  const SizedBox(width: 8.0),
                  Expanded(
                    child: MultiProvider(
                      providers: [
                        Provider<StoryRepository>(
                          create: (context) => const StoryRepositoryImpl(
                            service: StoryService(),
                          ),
                        ),
                        Provider(
                          lazy: false,
                          create: (context) => StoryViewModel(
                            repository: context.read<StoryRepository>(),
                            userId: (context.read<CurrentUser>().userId),
                          ),
                        ),
                      ],

                      child: const StoryListGenerator(),
                    ),
                  ),
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
