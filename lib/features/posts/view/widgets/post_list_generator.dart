import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media/features/posts/view/widgets/post_widget.dart';
import 'package:social_media/features/posts/view_model/post_viewmodel.dart';

class PostListGenerator extends StatelessWidget {
  const PostListGenerator({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<PostViewmodel, PostUIState>(
      selector: (context, value) => value.postState,
      builder: (context, data, child) {
        return switch (data) {
          PostFailureState() => const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          ),
          PostSuccessState() => SliverList.separated(
            itemCount: data.posts.length,
            separatorBuilder: (context, index) => const SizedBox(width: 8.0),
            itemBuilder: (context, index) {
              return PostWidget(postInfo: data.posts[index]);
            },
          ),

          PostLoadingState() => const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          ),
        };
      },
    );
  }
}
